import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/di/injection.dart';
import '../../../../core/rules/game_rule_registry.dart';
import '../../../../core/time/game_clock.dart';
import '../../../biome/presentation/states/biome_state.dart';
import '../../../biome/presentation/viewmodels/biome_viewmodel.dart';
import '../../../creature/presentation/states/creature_state.dart';
import '../../../creature/presentation/viewmodels/creature_viewmodel.dart';
import '../../../encounter/presentation/viewmodels/encounter_viewmodel.dart';
import '../../../evolution_tree/domain/repositories/evolution_tree_repository.dart';
import '../../../generation/domain/usecases/calculate_ep_use_case.dart';
import '../../../generation/domain/usecases/next_generation_use_case.dart';
import '../../../resource/presentation/viewmodels/resource_viewmodel.dart';
import '../states/game_shell_state.dart';
import 'synergy_notification_provider.dart';

class GameShellNotifier extends Notifier<GameShellState> {
  static const _slotId = 'slot_0';

  /// Ticks between season advances.
  static const _seasonInterval = 300;

  @override
  GameShellState build() {
    ref.listen<CreatureState>(creatureProvider, (prev, next) {
      if (next is CreatureStateDead) {
        _handleCreatureDeath(next.cause);
      }
    });

    // Inject ARE callbacks so engine rules can update Riverpod state.
    sl<GameRuleRegistry>().injectCallbacks(
      onBiomeDamage: (damage, type) =>
          ref.read(creatureProvider.notifier).applyDamage(damage, damageType: type),
      onLowHpWarning: () {},
      onFoodMultiplierChanged: (multiplier) =>
          ref.read(biomeProvider.notifier).updateFoodMultiplier(multiplier),
      onSynergyActivated: (id, bonus) {
        ref.read(synergyNotificationProvider.notifier).state = (id, bonus);
        // Auto-dismiss after 3 seconds
        Future.delayed(const Duration(seconds: 3), () {
          ref.read(synergyNotificationProvider.notifier).state = null;
        });
      },
    );

    return GameShellState.initial();
  }

  // ── Game Lifecycle ────────────────────────────────────────────────────────

  Future<void> startNewGame() async {
    state = state.copyWith(phase: GamePhase.setup);

    await ref.read(creatureProvider.notifier).spawnNew();
    await ref.read(biomeProvider.notifier).load();
    ref.read(resourceProvider.notifier).initialize();

    // Initialize resource nodes for the loaded biome
    final biomeState = ref.read(biomeProvider);
    if (biomeState is BiomeStateLoaded) {
      ref
          .read(resourceProvider.notifier)
          .initializeNodes(biomeState.biome.type);
    }

    // Transition to mutation selection before first tick
    state = state.copyWith(
      phase: GamePhase.mutationSelection,
      generation: 1,
      survivalSeconds: 0,
      evolutionaryPoints: 0,
      currentSummary: null,
    );
  }

  /// Called when the player finishes mutation selection.
  void onMutationSelected() {
    state = state.copyWith(phase: GamePhase.playing, isClockRunning: true);
    sl<GameClock>().start();
  }

  Future<void> resumeGame() async {
    state = state.copyWith(phase: GamePhase.setup);
    await ref.read(creatureProvider.notifier).loadOrSpawn();
    await ref.read(biomeProvider.notifier).load();
    final biomeState = ref.read(biomeProvider);
    if (biomeState is BiomeStateLoaded) {
      ref
          .read(resourceProvider.notifier)
          .initializeNodes(biomeState.biome.type);
    }
    state = state.copyWith(phase: GamePhase.playing, isClockRunning: true);
    sl<GameClock>().start();
  }

  /// Stop the clock and reset shell state so the user can return to main menu.
  /// Creature and biome remain persisted in Hive for the Continue flow.
  void quitToMenu() {
    sl<GameClock>().stop();
    state = GameShellState.initial();
  }

  void pauseGame() {
    sl<GameClock>().stop();
    state = state.copyWith(phase: GamePhase.paused, isClockRunning: false);
  }

  // ── Encounter ─────────────────────────────────────────────────────────────

  Future<void> onExplore() async {
    if (state.phase != GamePhase.playing) return;
    final creatureState = ref.read(creatureProvider);
    final biomeState = ref.read(biomeProvider);
    if (creatureState is! CreatureStateAlive) return;
    if (biomeState is! BiomeStateLoaded) return;

    sl<GameClock>().stop();
    state = state.copyWith(phase: GamePhase.encounter, isClockRunning: false);

    final triggered = await ref.read(encounterProvider.notifier).triggerEncounter(
          creatureState.creature,
          biomeState.biome.type,
        );

    if (!triggered) {
      // No encounter found — resume immediately
      state = state.copyWith(phase: GamePhase.playing, isClockRunning: true);
      sl<GameClock>().start();
    }
  }

  void onEncounterResolved() {
    ref.read(encounterProvider.notifier).dismiss();
    state = state.copyWith(phase: GamePhase.playing, isClockRunning: true);
    sl<GameClock>().start();
  }

  void resumeFromPause() {
    sl<GameClock>().start();
    state = state.copyWith(phase: GamePhase.playing, isClockRunning: true);
  }

  // ── Tick ─────────────────────────────────────────────────────────────────

  void onTick() {
    if (state.phase != GamePhase.playing) return;

    final newSeconds = state.survivalSeconds + 1;
    state = state.copyWith(survivalSeconds: newSeconds);

    // Biome: day/night cycle
    ref.read(biomeProvider.notifier).tickDayNight(newSeconds);

    // Biome: season advance every _seasonInterval ticks
    if (newSeconds % _seasonInterval == 0) {
      ref.read(biomeProvider.notifier).advanceSeason();
    }

    // Tick resource cooldowns
    ref.read(resourceProvider.notifier).onTick();

    // Metabolic food consumption — starvation damages creature
    final creatureState = ref.read(creatureProvider);
    if (creatureState is CreatureStateAlive) {
      final hasFood = ref.read(resourceProvider.notifier).consumeFood(
            creatureState.creature.stats.metabolismSpeed,
          );
      if (!hasFood) {
        // Starvation: deal 2 HP damage per tick
        ref.read(creatureProvider.notifier).applyDamage(2, damageType: 'starvation');
      }
    }
  }

  // ── Death & Generation Transition ─────────────────────────────────────────

  void _handleCreatureDeath(String deathCause) {
    if (state.phase == GamePhase.deathSummary) return; // Already handling death
    sl<GameClock>().stop();

    final creatureState = ref.read(creatureProvider);
    if (creatureState is! CreatureStateDead) return;

    sl<CalculateEpUseCase>()(
      CalculateEpParams(
        creature: creatureState.creature,
        survivalSeconds: state.survivalSeconds,
        deathCause: deathCause,
      ),
    ).then((summary) async {
      // Accumulate EP in evolution tree persistent balance
      await sl<EvolutionTreeRepository>().addEp(summary.evolutionaryPoints);
      ref.read(resourceProvider.notifier).addEP(summary.evolutionaryPoints);
      state = state.copyWith(
        phase: GamePhase.deathSummary,
        isClockRunning: false,
        evolutionaryPoints: state.evolutionaryPoints + summary.evolutionaryPoints,
        currentSummary: summary,
      );
    });
  }

  /// Called from the GenerationSummaryPage "BEGIN NEXT GENERATION" button.
  Future<void> beginNextGeneration() async {
    final summary = state.currentSummary;
    final creatureState = ref.read(creatureProvider);
    if (summary == null || creatureState is! CreatureStateDead) return;

    final nextCreature = await sl<NextGenerationUseCase>()(
      NextGenerationParams(
        slotId: _slotId,
        summary: summary,
        previousCreature: creatureState.creature,
      ),
    );

    ref.read(creatureProvider.notifier).updateCreature(nextCreature);
    ref.read(resourceProvider.notifier).initialize();

    state = state.copyWith(
      phase: GamePhase.mutationSelection,
      generation: state.generation + 1,
      survivalSeconds: 0,
      isClockRunning: false,
      currentSummary: null,
    );
  }
}

final gameShellProvider =
    NotifierProvider<GameShellNotifier, GameShellState>(GameShellNotifier.new);

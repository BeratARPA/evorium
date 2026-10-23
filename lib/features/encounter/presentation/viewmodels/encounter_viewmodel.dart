import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/di/injection.dart';
import '../../../../core/domain/enums/biome_type.dart';
import '../../../creature/domain/entities/creature.dart';
import '../../../creature/presentation/states/creature_state.dart';
import '../../../creature/presentation/viewmodels/creature_viewmodel.dart';
import '../../../resource/presentation/viewmodels/resource_viewmodel.dart';
import '../../domain/entities/encounter_choice.dart';
import '../../domain/usecases/resolve_encounter_use_case.dart';
import '../../domain/usecases/trigger_encounter_use_case.dart';
import '../states/encounter_state.dart';

class EncounterNotifier extends Notifier<EncounterState> {
  @override
  EncounterState build() => const EncounterState.idle();

  /// Trigger an encounter for the creature in the given biome.
  /// Returns true if an encounter was triggered.
  Future<bool> triggerEncounter(Creature creature, BiomeType biome) async {
    try {
      final encounter = await sl<TriggerEncounterUseCase>()(
        TriggerEncounterParams(creature: creature, currentBiome: biome),
      );
      if (encounter == null) return false;

      // Filter choices: remove those with unmet trait requirements
      final available = encounter.choices
          .where(
            (c) => c.requiredTraitId == null || creature.hasTrait(c.requiredTraitId!),
          )
          .toList();

      state = EncounterState.active(
        encounter: encounter,
        availableChoices: available,
      );
      return true;
    } catch (e) {
      state = EncounterState.error(e.toString());
      return false;
    }
  }

  /// Player selects a choice — resolves the encounter.
  void resolveChoice(Creature creature, EncounterChoice choice) {
    final current = state;
    if (current is! EncounterStateActive) return;

    state = EncounterState.resolving(
      encounter: current.encounter,
      choice: choice,
    );

    final result = sl<ResolveEncounterUseCase>()(
      ResolveEncounterParams(
        creature: creature,
        encounter: current.encounter,
        choice: choice,
      ),
    );

    // Apply HP change
    if (result.hpChange < 0) {
      ref
          .read(creatureProvider.notifier)
          .applyDamage(-result.hpChange, damageType: 'encounter');
    } else if (result.hpChange > 0) {
      // Healing: apply as negative damage (no-op if creature handles it)
      final cs = ref.read(creatureProvider);
      if (cs is CreatureStateAlive) {
        final healed = cs.creature.copyWith(
          stats: cs.creature.stats.copyWith(
            hp: (cs.creature.stats.hp + result.hpChange)
                .clamp(0, cs.creature.stats.maxHp),
          ),
        );
        ref.read(creatureProvider.notifier).updateCreature(healed);
      }
    }

    // EP gain
    if (result.epGain > 0) {
      ref.read(resourceProvider.notifier).addEP(result.epGain);
    }

    // Food gain
    if (result.foodGain > 0) {
      final cs = ref.read(creatureProvider);
      if (cs is CreatureStateAlive) {
        // Directly update resources
        final resources = ref.read(resourceProvider).resources;
        ref.read(resourceProvider.notifier).initialize(
              resources.addFood(result.foodGain),
            );
      }
    }

    // Track encounter win on creature
    if (result.won) {
      final cs = ref.read(creatureProvider);
      if (cs is CreatureStateAlive) {
        ref.read(creatureProvider.notifier).updateCreature(
              cs.creature.copyWith(
                encountersWon: cs.creature.encountersWon + 1,
              ),
            );
      }
    }

    state = EncounterState.resolved(
      encounter: current.encounter,
      result: result,
    );
  }

  void dismiss() => state = const EncounterState.idle();
}

final encounterProvider =
    NotifierProvider<EncounterNotifier, EncounterState>(EncounterNotifier.new);

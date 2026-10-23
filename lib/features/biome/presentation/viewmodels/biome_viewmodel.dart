import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/di/injection.dart';
import '../../../../core/domain/enums/biome_type.dart';
import '../../../../core/domain/enums/season.dart';
import '../../../../core/rng/random_service.dart';
import '../../domain/entities/biome.dart';
import '../../domain/usecases/get_current_biome_use_case.dart';
import '../../domain/usecases/transition_biome_use_case.dart';
import '../states/biome_state.dart';

class BiomeNotifier extends Notifier<BiomeState> {
  static const _slotId = 'slot_0';

  /// Ticks per half day/night cycle (60 ticks ≈ 1 minute).
  static const _dayNightHalfPeriod = 60;

  @override
  BiomeState build() => const BiomeState.initial();

  // ── Lifecycle ─────────────────────────────────────────────────────────────

  Future<void> load() async {
    state = const BiomeState.loading();
    try {
      final biome = await sl<GetCurrentBiomeUseCase>()(_slotId);
      state = BiomeState.loaded(
        biome: biome ?? Biome.create(BiomeType.primordialSoup),
      );
    } catch (e) {
      state = BiomeState.error(e.toString());
    }
  }

  // ── Day / Night Cycle ─────────────────────────────────────────────────────

  /// Called every tick from GameShellNotifier. Toggles day/night every
  /// [_dayNightHalfPeriod] ticks, adjusting light level accordingly.
  void tickDayNight(int totalTicks) {
    if (state is! BiomeStateLoaded) return;
    final loaded = state as BiomeStateLoaded;
    final shouldBeNight = (totalTicks ~/ _dayNightHalfPeriod) % 2 == 1;
    if (loaded.biome.condition.isNight == shouldBeNight) return;

    final baseLightLevel =
        BiomeConditionInit.initial(loaded.biome.type).lightLevel;
    final newCondition = loaded.biome.condition.copyWith(
      isNight: shouldBeNight,
      lightLevel: shouldBeNight ? baseLightLevel * 0.1 : baseLightLevel,
    );
    state = BiomeState.loaded(
      biome: loaded.biome.copyWith(condition: newCondition),
    );
  }

  // ── Seasonal Progression ─────────────────────────────────────────────────

  /// Advance the current season. Call every 300 ticks.
  void advanceSeason() {
    if (state is! BiomeStateLoaded) return;
    final loaded = state as BiomeStateLoaded;
    final nextSeason = _rollNextSeason(loaded.biome.condition.season);
    final newCondition = loaded.biome.condition.copyWith(
      season: nextSeason,
      foodMultiplier: _foodMultiplierForSeason(nextSeason),
    );
    state = BiomeState.loaded(
      biome: loaded.biome.copyWith(condition: newCondition),
    );
  }

  Season _rollNextSeason(Season current) {
    if (current == Season.winter) {
      final roll = sl<RandomService>().nextDoubleBetween(0, 1);
      if (roll < 0.15) return Season.drought;
      if (roll < 0.30) return Season.abundance;
      return Season.spring;
    }
    return switch (current) {
      Season.spring => Season.summer,
      Season.summer => Season.autumn,
      Season.autumn => Season.winter,
      _ => Season.spring,
    };
  }

  double _foodMultiplierForSeason(Season season) => switch (season) {
        Season.spring => 1.2,
        Season.summer => 1.0,
        Season.autumn => 0.8,
        Season.winter => 0.6,
        Season.drought => 0.3,
        Season.abundance => 2.0,
        Season.disaster => 0.1,
      };

  // ── Food Multiplier (from ARE seasonal rules) ─────────────────────────────

  void updateFoodMultiplier(double multiplier) {
    if (state is! BiomeStateLoaded) return;
    final loaded = state as BiomeStateLoaded;
    state = BiomeState.loaded(
      biome: loaded.biome.copyWith(
        condition: loaded.biome.condition.copyWith(foodMultiplier: multiplier),
      ),
    );
  }

  // ── Biome Transition ──────────────────────────────────────────────────────

  /// Optimistically updates state to new biome and persists asynchronously.
  void transitionTo(BiomeType targetBiome) {
    state = BiomeState.loaded(biome: Biome.create(targetBiome));
    sl<TransitionBiomeUseCase>()(
      TransitionBiomeParams(slotId: _slotId, targetBiome: targetBiome),
    );
  }

  // ── Legacy ────────────────────────────────────────────────────────────────

  void updateCondition(Biome updated) {
    state = BiomeState.loaded(biome: updated);
  }
}

final biomeProvider =
    NotifierProvider<BiomeNotifier, BiomeState>(BiomeNotifier.new);

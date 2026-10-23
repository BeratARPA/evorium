import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/enums/biome_type.dart';
import '../../../../core/domain/enums/evolution_stage.dart';
import 'biome_condition.dart';

part 'biome.freezed.dart';
part 'biome.g.dart';

/// A biome the creature can inhabit and explore.
@freezed
class Biome with _$Biome {
  const factory Biome({
    required String id,
    required BiomeType type,
    required EvolutionStage requiredStage,

    /// Current live conditions (changes over time via ARE events).
    required BiomeCondition condition,

    /// Whether this biome has been discovered (unlocked for transition).
    @Default(false) bool isDiscovered,

    /// Time the creature has spent in this biome (seconds).
    @Default(0) int timeSpentSeconds,
  }) = _Biome;

  const Biome._();

  factory Biome.fromJson(Map<String, dynamic> json) => _$BiomeFromJson(json);

  factory Biome.create(BiomeType type) => Biome(
        id: type.name,
        type: type,
        requiredStage: type.requiredStage,
        condition: BiomeConditionInit.initial(type),
      );

  String get displayName => type.displayName;
  String get emoji => type.emoji;
}

extension BiomeConditionInit on BiomeCondition {
  static BiomeCondition initial(BiomeType type) => switch (type) {
        BiomeType.primordialSoup => const BiomeCondition(
            temperature: 28,
            humidity: 95,
            lightLevel: 60,
          ),
        BiomeType.thermalVents => const BiomeCondition(
            temperature: 80,
            humidity: 70,
            lightLevel: 5,
            pressure: 2.5,
          ),
        BiomeType.frozenSubsurface => const BiomeCondition(
            temperature: -10,
            humidity: 40,
            lightLevel: 0,
            pressure: 1.2,
          ),
        BiomeType.shallowSea => const BiomeCondition(
            temperature: 22,
            humidity: 100,
            lightLevel: 75,
          ),
        BiomeType.coralReef => const BiomeCondition(
            temperature: 26,
            humidity: 100,
            lightLevel: 85,
          ),
        BiomeType.deepOcean => const BiomeCondition(
            temperature: 4,
            humidity: 100,
            lightLevel: 0,
            pressure: 5.0,
          ),
        BiomeType.coastalWetland => const BiomeCondition(
            temperature: 20,
            humidity: 85,
            lightLevel: 70,
          ),
        BiomeType.rainforest => const BiomeCondition(
            temperature: 28,
            humidity: 90,
            lightLevel: 55,
          ),
        BiomeType.aridScrublands => const BiomeCondition(
            temperature: 38,
            humidity: 15,
            lightLevel: 95,
          ),
        BiomeType.volcanicTerrain => const BiomeCondition(
            temperature: 65,
            humidity: 20,
            lightLevel: 50,
          ),
        BiomeType.iceAgeTundra => const BiomeCondition(
            temperature: -25,
            humidity: 30,
            lightLevel: 30,
          ),
      };
}

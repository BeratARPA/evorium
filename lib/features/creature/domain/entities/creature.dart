import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/enums/biome_type.dart';
import '../../../../core/domain/enums/evolution_stage.dart';
import 'creature_stats.dart';
import 'creature_trait.dart';

part 'creature.freezed.dart';
part 'creature.g.dart';

/// Core creature domain entity.
/// Represents the player's evolving organism at any point in time.
@freezed
class Creature with _$Creature {
  const factory Creature({
    /// Unique instance ID (UUID).
    required String id,

    /// Descriptive name (generated or player-chosen).
    required String name,

    /// Current generation number (starts at 1).
    required int generation,

    /// Primary and derived stats.
    required CreatureStats stats,

    /// All currently active traits.
    @Default([]) List<CreatureTrait> traits,

    /// Current evolutionary stage.
    @Default(EvolutionStage.cellular) EvolutionStage stage,

    /// Current biome the creature inhabits.
    @Default(BiomeType.primordialSoup) BiomeType currentBiome,

    /// Total survival time this generation (in seconds).
    @Default(0) int survivalSeconds,

    /// Resources gathered this generation.
    @Default(0) int resourcesGathered,

    /// Encounters won this generation.
    @Default(0) int encountersWon,

    /// Evolutionary Points accumulated this generation.
    @Default(0) int evolutionaryPoints,
  }) = _Creature;

  const Creature._();

  factory Creature.fromJson(Map<String, dynamic> json) =>
      _$CreatureFromJson(json);

  /// Creates a fresh creature for generation 1.
  factory Creature.newGame({required String id, required String name}) =>
      Creature(
        id: id,
        name: name,
        generation: 1,
        stats: CreatureStats.initial(),
      );

  bool get isAlive => stats.isAlive;
  bool get isLowHp => stats.isLowHp;

  bool hasTrait(String traitId) => traits.any((t) => t.id == traitId);

  CreatureTrait? getTrait(String traitId) {
    try {
      return traits.firstWhere((t) => t.id == traitId);
    } catch (_) {
      return null;
    }
  }

  /// All trait IDs the creature currently has.
  List<String> get traitIds => traits.map((t) => t.id).toList();

  /// Check if two trait IDs are both present (for synergy detection).
  bool hasBothTraits(String a, String b) => hasTrait(a) && hasTrait(b);
}

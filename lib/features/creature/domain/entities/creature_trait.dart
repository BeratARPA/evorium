import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/enums/trait_category.dart';

part 'creature_trait.freezed.dart';
part 'creature_trait.g.dart';

/// A persistent ability a creature gains via mutation.
@freezed
class CreatureTrait with _$CreatureTrait {
  const factory CreatureTrait({
    /// Unique trait identifier (e.g. 'compound_eye').
    required String id,

    /// Display name (e.g. 'Compound Eye').
    required String name,

    /// Trait category.
    required TraitCategory category,

    /// Current level of this trait (1 = base, 2+ = evolved).
    @Default(1) int level,

    /// Stat modifier deltas applied to CreatureStats.
    /// Keys: 'atk', 'def', 'spd', 'per', 'adp', 'hp'
    @Default({}) Map<String, int> statModifiers,

    /// IDs of traits this one synergises with.
    @Default([]) List<String> synergyTraitIds,

    /// IDs of traits this one conflicts with.
    @Default([]) List<String> conflictTraitIds,

    /// Whether this trait has been actively used this generation
    /// (increases inheritance chance).
    @Default(false) bool isMarked,
  }) = _CreatureTrait;

  const CreatureTrait._();

  factory CreatureTrait.fromJson(Map<String, dynamic> json) =>
      _$CreatureTraitFromJson(json);

  bool hasSynergyWith(String traitId) => synergyTraitIds.contains(traitId);
  bool conflictsWith(String traitId) => conflictTraitIds.contains(traitId);
}

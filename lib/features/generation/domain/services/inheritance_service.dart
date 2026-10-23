import '../../../../core/rng/random_service.dart';
import '../../../creature/domain/entities/creature_trait.dart';

/// Determines which traits are inherited from a dead creature to the next
/// generation, based on the inheritance ratio.
class InheritanceService {
  const InheritanceService(this._rng);

  final RandomService _rng;

  /// Returns traits to carry forward.
  ///
  /// [traits]             — traits the previous creature had at death.
  /// [inheritanceRatio]   — fraction (0.0–1.0) of traits to inherit.
  /// [extraInheritCount]  — flat bonus from Evolution Tree nodes.
  List<CreatureTrait> inherit(
    List<CreatureTrait> traits, {
    double inheritanceRatio = 0.5,
    int extraInheritCount = 0,
  }) {
    if (traits.isEmpty) return [];

    final maxInherit = (traits.length * inheritanceRatio).ceil() + extraInheritCount;
    final candidates = List<CreatureTrait>.from(traits);

    // Marked traits (used this generation) have doubled inheritance chance
    candidates.sort((a, b) => b.isMarked ? 1 : -1);

    final inherited = <CreatureTrait>[];
    for (final trait in candidates) {
      if (inherited.length >= maxInherit) break;
      final baseChance = trait.isMarked ? inheritanceRatio * 1.5 : inheritanceRatio;
      if (_rng.chance(baseChance.clamp(0.0, 1.0))) {
        // Inherited traits reset their level back to 1 (restart evolution)
        inherited.add(trait.copyWith(level: 1, isMarked: false));
      }
    }
    return inherited;
  }
}

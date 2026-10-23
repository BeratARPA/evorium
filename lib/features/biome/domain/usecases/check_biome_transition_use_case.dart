import '../../../../core/base/base_use_case.dart';
import '../../../../core/domain/enums/biome_type.dart';
import '../../../creature/domain/entities/creature.dart';
import '../entities/biome_transition_requirement.dart';

class BiomeTransitionCheckResult {
  const BiomeTransitionCheckResult({
    required this.canTransition,
    this.failureReasons = const [],
  });

  final bool canTransition;
  final List<String> failureReasons;
}

class CheckBiomeTransitionParams {
  const CheckBiomeTransitionParams({
    required this.creature,
    required this.targetBiome,
    required this.currentFood,
  });

  final Creature creature;
  final BiomeType targetBiome;
  final int currentFood;
}

/// Synchronously checks whether a creature can migrate to the target biome.
class CheckBiomeTransitionUseCase
    implements SyncUseCase<BiomeTransitionCheckResult, CheckBiomeTransitionParams> {
  const CheckBiomeTransitionUseCase();

  @override
  BiomeTransitionCheckResult call(CheckBiomeTransitionParams params) {
    final req = BiomeTransitionRequirement.all[params.targetBiome];
    if (req == null) {
      return const BiomeTransitionCheckResult(
        canTransition: false,
        failureReasons: ['Unknown biome'],
      );
    }

    final creature = params.creature;
    final reasons = <String>[];

    if (creature.stage.index < req.requiredStage.index) {
      reasons.add('Requires ${req.requiredStage.displayName} stage');
    }

    if (creature.stats.adp < req.minAdp) {
      reasons.add('ADP ${creature.stats.adp} / ${req.minAdp}');
    }
    if (creature.stats.def < req.minDef) {
      reasons.add('DEF ${creature.stats.def} / ${req.minDef}');
    }
    if (creature.stats.spd < req.minSpd) {
      reasons.add('SPD ${creature.stats.spd} / ${req.minSpd}');
    }
    if (creature.stats.per < req.minPer) {
      reasons.add('PER ${creature.stats.per} / ${req.minPer}');
    }

    for (final traitId in req.requiredTraitIds) {
      if (!creature.hasTrait(traitId)) {
        reasons.add('Trait: ${traitId.replaceAll('_', ' ')}');
      }
    }

    if (req.foodCost > 0 && params.currentFood < req.foodCost) {
      reasons.add('Food ${params.currentFood} / ${req.foodCost}');
    }

    return BiomeTransitionCheckResult(
      canTransition: reasons.isEmpty,
      failureReasons: reasons,
    );
  }
}

import 'package:uuid/uuid.dart';

import '../../../../core/base/base_use_case.dart';
import '../../../../core/domain/enums/biome_type.dart';
import '../../../../core/domain/enums/difficulty_mode.dart';
import '../../../../core/domain/enums/evolution_stage.dart';
import '../../../creature/domain/entities/creature.dart';
import '../../../creature/domain/entities/creature_stats.dart';
import '../../../creature/domain/repositories/creature_repository.dart';
import '../../../evolution_tree/data/datasources/evolution_tree_definitions.dart';
import '../../../evolution_tree/domain/entities/applied_evolution_bonuses.dart';
import '../../../evolution_tree/domain/repositories/evolution_tree_repository.dart';
import '../entities/generation_summary.dart';
import '../services/inheritance_service.dart';

class NextGenerationParams {
  const NextGenerationParams({
    required this.slotId,
    required this.summary,
    required this.previousCreature,
    this.difficulty = DifficultyMode.normal,
  });

  final String slotId;
  final GenerationSummary summary;
  final Creature previousCreature;
  final DifficultyMode difficulty;
}

/// Creates the next generation creature with inherited traits.
class NextGenerationUseCase
    implements UseCase<Creature, NextGenerationParams> {
  const NextGenerationUseCase(
    this._repository,
    this._inheritance,
    this._evolutionTree,
  );

  final CreatureRepository _repository;
  final InheritanceService _inheritance;
  final EvolutionTreeRepository _evolutionTree;

  @override
  Future<Creature> call(NextGenerationParams params) async {
    // Load evolution tree bonuses
    final bonuses = await _loadBonuses();

    final effectiveRatio =
        params.difficulty.inheritanceRatio + bonuses.inheritanceRatioBonus;

    final inherited = _inheritance.inherit(
      params.previousCreature.traits,
      inheritanceRatio: effectiveRatio,
      extraInheritCount: bonuses.extraTraitInheritance,
    );

    // Carry forward biome if creature was land-adapted
    final startingBiome = _determineStartingBiome(params.previousCreature);
    final startingStage =
        _determineStartingStage(params.previousCreature, bonuses);

    // Start with fresh stats, apply inherited trait modifiers + tree HP bonus
    var stats = CreatureStats.initial();
    for (final trait in inherited) {
      stats = stats.applyModifiers(trait.statModifiers);
    }
    if (bonuses.hpBonus > 0) {
      stats = stats.copyWith(hp: stats.hp + bonuses.hpBonus);
    }

    final newCreature = Creature(
      id: const Uuid().v4(),
      name: params.previousCreature.name,
      generation: params.previousCreature.generation + 1,
      stats: stats,
      traits: inherited,
      stage: startingStage,
      currentBiome: startingBiome,
    );

    await _repository.saveCreature(params.slotId, newCreature);
    return newCreature;
  }

  Future<AppliedEvolutionBonuses> _loadBonuses() async {
    final unlockedIds = await _evolutionTree.getUnlockedNodeIds();
    final nodes = EvolutionTreeDefinitions.all();
    for (final node in nodes) {
      node.isUnlocked = unlockedIds.contains(node.id);
    }
    return AppliedEvolutionBonuses.fromNodes(nodes);
  }

  BiomeType _determineStartingBiome(Creature previous) {
    if (previous.stage.isLand) return previous.currentBiome;
    return BiomeType.primordialSoup;
  }

  EvolutionStage _determineStartingStage(
    Creature previous,
    AppliedEvolutionBonuses bonuses,
  ) {
    if (previous.stage == EvolutionStage.cellular) {
      return EvolutionStage.cellular;
    }
    // Stage Retention node prevents regression
    if (bonuses.keepEvolutionStage) return previous.stage;
    return previous.traits.length >= 3
        ? previous.stage
        : EvolutionStage.values[previous.stage.index - 1];
  }
}

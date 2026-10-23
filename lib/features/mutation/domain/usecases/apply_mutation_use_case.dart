import '../../../../core/base/base_use_case.dart';
import '../../../../core/domain/enums/trait_category.dart';
import '../../../creature/domain/entities/creature.dart';
import '../../../creature/domain/entities/creature_trait.dart';
import '../../../creature/domain/repositories/creature_repository.dart';
import '../entities/mutation.dart';

class ApplyMutationParams {
  const ApplyMutationParams({
    required this.slotId,
    required this.creature,
    required this.mutation,
  });

  final String slotId;
  final Creature creature;
  final Mutation mutation;
}

class ApplyMutationUseCase
    implements UseCase<Creature, ApplyMutationParams> {
  const ApplyMutationUseCase(this._repository);

  final CreatureRepository _repository;

  @override
  Future<Creature> call(ApplyMutationParams params) async {
    var creature = params.creature;
    final mutation = params.mutation;

    // Remove old trait for regressive mutations
    if (mutation.removedTraitId != null) {
      final updatedTraits = creature.traits
          .where((t) => t.id != mutation.removedTraitId)
          .toList();
      creature = creature.copyWith(traits: updatedTraits);
    }

    // Apply stat modifiers directly to stats
    if (mutation.statModifiers.isNotEmpty) {
      creature = creature.copyWith(
        stats: creature.stats.applyModifiers(mutation.statModifiers),
      );
    }

    // Grant new trait
    if (mutation.grantedTraitId != null) {
      final traitId = mutation.grantedTraitId!;

      // Check for trait evolution (upgrade existing)
      final existingIndex =
          creature.traits.indexWhere((t) => t.id == mutation.requiredTraitId);

      if (existingIndex != -1 && mutation.requiredTraitId != null) {
        // Evolve existing trait: bump level, replace id
        final old = creature.traits[existingIndex];
        final evolved = old.copyWith(id: traitId, level: old.level + 1);
        final traits = List<CreatureTrait>.from(creature.traits)
          ..[existingIndex] = evolved;
        creature = creature.copyWith(traits: traits);
      } else {
        // Add new trait
        final newTrait = CreatureTrait(
          id: traitId,
          name: mutation.name,
          category: _inferCategory(traitId),
          statModifiers: mutation.statModifiers,
        );
        creature = creature.copyWith(
          traits: [...creature.traits, newTrait],
        );
      }

      // Re-apply trait stat modifiers to base stats
      if (mutation.statModifiers.isEmpty) {
        // Stat modifiers are in the trait itself (loaded from JSON)
        // For now, trust statPreview values; trait will affect stats via applyModifiers
      }
    }

    // Recalculate maxEnergy after ADP changes
    final newMaxEnergy = creature.stats.computedMaxEnergy;
    creature = creature.copyWith(
      stats: creature.stats.copyWith(maxEnergy: newMaxEnergy),
    );

    await _repository.saveCreature(params.slotId, creature);
    return creature;
  }

  TraitCategory _inferCategory(String traitId) {
    if (traitId.contains('eye') || traitId.contains('echo') ||
        traitId.contains('electro')) {
      return TraitCategory.sensory;
    }
    if (traitId.contains('shell') || traitId.contains('spikes') ||
        traitId.contains('camouflage')) {
      return TraitCategory.defense;
    }
    if (traitId.contains('claw') || traitId.contains('poison') ||
        traitId.contains('acid') || traitId.contains('electric')) {
      return TraitCategory.attack;
    }
    if (traitId.contains('cilia') || traitId.contains('flagellum') ||
        traitId.contains('fin') || traitId.contains('wing')) {
      return TraitCategory.locomotion;
    }
    if (traitId.contains('photo') || traitId.contains('filter') ||
        traitId.contains('digest')) {
      return TraitCategory.metabolic;
    }
    if (traitId.contains('herd') || traitId.contains('biolumi') ||
        traitId.contains('pheromone')) {
      return TraitCategory.social;
    }
    return TraitCategory.structural;
  }
}

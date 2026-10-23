import '../../domain/entities/evolution_node.dart';

/// Static definitions for all evolution tree nodes.
abstract class EvolutionTreeDefinitions {
  static List<EvolutionNode> all() => [
        // ── Genetics ────────────────────────────────────────────────────────
        EvolutionNode(
          id: 'cellular_memory',
          name: 'Cellular Memory',
          description: 'Encoded evolutionary experience in cellular RNA improves trait inheritance probability.',
          category: 'Genetics',
          epCost: 100,
          bonus: const EvolutionBonus(EvolutionBonusType.inheritanceRatioBonus, 0.1),
        ),
        EvolutionNode(
          id: 'dna_fidelity',
          name: 'DNA Fidelity',
          description: 'High-fidelity replication machinery reduces genetic drift. One additional trait can be passed on.',
          category: 'Genetics',
          epCost: 250,
          requiredNodeIds: ['cellular_memory'],
          bonus: const EvolutionBonus(EvolutionBonusType.extraTraitInheritance, 1),
        ),
        EvolutionNode(
          id: 'adaptive_genome',
          name: 'Adaptive Genome',
          description: 'The genome restructures itself to preserve advantageous mutations. Two more traits transfer each generation.',
          category: 'Genetics',
          epCost: 500,
          requiredNodeIds: ['dna_fidelity'],
          bonus: const EvolutionBonus(EvolutionBonusType.extraTraitInheritance, 2),
        ),

        // ── Vitality ────────────────────────────────────────────────────────
        EvolutionNode(
          id: 'robust_cells',
          name: 'Robust Cells',
          description: 'Fortified cell walls and improved membrane integrity grant offspring stronger starting vitality.',
          category: 'Vitality',
          epCost: 100,
          bonus: const EvolutionBonus(EvolutionBonusType.hpBonus, 15),
        ),
        EvolutionNode(
          id: 'efficient_metabolism',
          name: 'Efficient Metabolism',
          description: 'Streamlined biochemical pathways reduce the caloric cost of all metabolic processes.',
          category: 'Vitality',
          epCost: 200,
          requiredNodeIds: ['robust_cells'],
          bonus: const EvolutionBonus(EvolutionBonusType.foodReductionPercent, 0.2),
        ),
        EvolutionNode(
          id: 'endurance',
          name: 'Endurance',
          description: 'Reinforced tissue architecture grants each new generation a substantial boost to maximum HP.',
          category: 'Vitality',
          epCost: 400,
          requiredNodeIds: ['efficient_metabolism'],
          bonus: const EvolutionBonus(EvolutionBonusType.hpBonus, 25),
        ),

        // ── Combat ──────────────────────────────────────────────────────────
        EvolutionNode(
          id: 'predator_instinct',
          name: 'Predator Instinct',
          description: 'Encoded hunting patterns sharpen combat reflexes, improving attack during encounters.',
          category: 'Combat',
          epCost: 150,
          bonus: const EvolutionBonus(EvolutionBonusType.encounterAtkPercent, 0.1),
        ),
        EvolutionNode(
          id: 'battle_hardened',
          name: 'Battle Hardened',
          description: 'Epigenetic stress markers from past combats prime offspring defenses against known threats.',
          category: 'Combat',
          epCost: 300,
          requiredNodeIds: ['predator_instinct'],
          bonus: const EvolutionBonus(EvolutionBonusType.encounterDefPercent, 0.1),
        ),
        EvolutionNode(
          id: 'apex_predator',
          name: 'Apex Predator',
          description: 'Your lineage is refined by conflict. Combat patterns are deeply encoded — +20% attack in encounters.',
          category: 'Combat',
          epCost: 600,
          requiredNodeIds: ['battle_hardened'],
          bonus: const EvolutionBonus(EvolutionBonusType.encounterAtkPercent, 0.2),
        ),

        // ── Resources ───────────────────────────────────────────────────────
        EvolutionNode(
          id: 'efficient_forager',
          name: 'Efficient Forager',
          description: 'Learned foraging behaviors encoded in muscle memory improve resource yield by 15%.',
          category: 'Resources',
          epCost: 100,
          bonus: const EvolutionBonus(EvolutionBonusType.resourceGatherPercent, 0.15),
        ),
        EvolutionNode(
          id: 'biome_adaptation',
          name: 'Biome Adaptation',
          description: 'Generational knowledge of biome-specific nutrient sources unlocks an additional resource node.',
          category: 'Resources',
          epCost: 250,
          requiredNodeIds: ['efficient_forager'],
          bonus: const EvolutionBonus(EvolutionBonusType.extraResourceNode, 1),
        ),
        EvolutionNode(
          id: 'master_scavenger',
          name: 'Master Scavenger',
          description: 'Advanced sensory processing and resource extraction techniques increase gather yield by 30%.',
          category: 'Resources',
          epCost: 500,
          requiredNodeIds: ['biome_adaptation'],
          bonus: const EvolutionBonus(EvolutionBonusType.resourceGatherPercent, 0.3),
        ),

        // ── Evolution ───────────────────────────────────────────────────────
        EvolutionNode(
          id: 'accelerated_evolution',
          name: 'Accelerated Evolution',
          description: 'Epigenetic pressure accelerates evolutionary selection. All EP rewards increase by 10%.',
          category: 'Evolution',
          epCost: 150,
          bonus: const EvolutionBonus(EvolutionBonusType.epGainPercent, 0.1),
        ),
        EvolutionNode(
          id: 'stage_retention',
          name: 'Stage Retention',
          description: 'Deeply embedded evolutionary milestones persist into the next generation — stage never regresses on death.',
          category: 'Evolution',
          epCost: 400,
          requiredNodeIds: ['accelerated_evolution'],
          bonus: const EvolutionBonus(EvolutionBonusType.keepEvolutionStage, 1),
        ),
        EvolutionNode(
          id: 'legendary_bloodline',
          name: 'Legendary Bloodline',
          description: 'Your lineage has crossed a threshold of complexity. Each new generation begins with one guaranteed legendary mutation.',
          category: 'Evolution',
          epCost: 800,
          requiredNodeIds: ['stage_retention'],
          bonus: const EvolutionBonus(EvolutionBonusType.guaranteedLegendary, 1),
        ),
      ];
}

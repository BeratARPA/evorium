import '../../../../core/domain/enums/biome_type.dart';
import '../../../../core/domain/enums/evolution_stage.dart';

/// Requirements a creature must meet to transition into a biome.
class BiomeTransitionRequirement {
  const BiomeTransitionRequirement({
    required this.requiredStage,
    this.minAdp = 0,
    this.minDef = 0,
    this.minSpd = 0,
    this.minPer = 0,
    this.requiredTraitIds = const [],
    this.foodCost = 20,
  });

  final EvolutionStage requiredStage;
  final int minAdp;
  final int minDef;
  final int minSpd;
  final int minPer;
  final List<String> requiredTraitIds;

  /// Food deducted upon successful transition.
  final int foodCost;

  /// Static config map for all 11 biomes.
  static const Map<BiomeType, BiomeTransitionRequirement> all = {
    BiomeType.primordialSoup: BiomeTransitionRequirement(
      requiredStage: EvolutionStage.cellular,
      foodCost: 0,
    ),
    BiomeType.thermalVents: BiomeTransitionRequirement(
      requiredStage: EvolutionStage.cellular,
      minAdp: 6,
      foodCost: 15,
    ),
    BiomeType.frozenSubsurface: BiomeTransitionRequirement(
      requiredStage: EvolutionStage.cellular,
      minAdp: 6,
      foodCost: 15,
    ),
    BiomeType.shallowSea: BiomeTransitionRequirement(
      requiredStage: EvolutionStage.multicellular,
      minSpd: 4,
      foodCost: 25,
    ),
    BiomeType.coralReef: BiomeTransitionRequirement(
      requiredStage: EvolutionStage.multicellular,
      minPer: 5,
      foodCost: 30,
    ),
    BiomeType.deepOcean: BiomeTransitionRequirement(
      requiredStage: EvolutionStage.multicellular,
      minDef: 6,
      minAdp: 6,
      foodCost: 40,
    ),
    BiomeType.coastalWetland: BiomeTransitionRequirement(
      requiredStage: EvolutionStage.landTransition,
      foodCost: 35,
    ),
    BiomeType.rainforest: BiomeTransitionRequirement(
      requiredStage: EvolutionStage.landTransition,
      minSpd: 5,
      foodCost: 40,
    ),
    BiomeType.aridScrublands: BiomeTransitionRequirement(
      requiredStage: EvolutionStage.landTransition,
      minAdp: 7,
      foodCost: 40,
    ),
    BiomeType.volcanicTerrain: BiomeTransitionRequirement(
      requiredStage: EvolutionStage.landTransition,
      minAdp: 7,
      minDef: 6,
      requiredTraitIds: ['heat_resistance'],
      foodCost: 50,
    ),
    BiomeType.iceAgeTundra: BiomeTransitionRequirement(
      requiredStage: EvolutionStage.landTransition,
      minAdp: 7,
      requiredTraitIds: ['cold_resistance'],
      foodCost: 50,
    ),
  };
}

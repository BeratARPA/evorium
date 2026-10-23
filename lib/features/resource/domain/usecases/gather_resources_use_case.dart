import '../../../../core/base/base_use_case.dart';
import '../../../../core/domain/enums/biome_type.dart';
import '../../../../core/domain/enums/resource_type.dart';
import '../../../../core/rng/random_service.dart';
import '../entities/player_resources.dart';
import '../repositories/resource_repository.dart';

class GatherResourcesParams {
  const GatherResourcesParams({
    required this.slotId,
    required this.resources,
    required this.biome,
    required this.gatheringSpeed,
  });

  final String slotId;
  final PlayerResources resources;
  final BiomeType biome;

  /// Creature's SPD stat (affects gathering amount).
  final int gatheringSpeed;
}

class GatherResult {
  const GatherResult({
    required this.resources,
    required this.gains,
  });

  final PlayerResources resources;

  /// Map of resourceType → amount gained.
  final Map<ResourceType, int> gains;
}

class GatherResourcesUseCase
    implements UseCase<GatherResult, GatherResourcesParams> {
  const GatherResourcesUseCase(this._repository, this._rng);

  final ResourceRepository _repository;
  final RandomService _rng;

  @override
  Future<GatherResult> call(GatherResourcesParams params) async {
    final gains = _calculateGains(params);
    var updated = params.resources;

    for (final entry in gains.entries) {
      updated = switch (entry.key) {
        ResourceType.food => updated.addFood(entry.value),
        ResourceType.minerals => updated.addMinerals(entry.value),
        ResourceType.biochemical => updated.addBiochemical(entry.value),
        ResourceType.evolutionaryPoints => updated.addEP(entry.value),
        ResourceType.energy => updated,
      };
    }

    await _repository.saveResources(params.slotId, updated);
    return GatherResult(resources: updated, gains: gains);
  }

  Map<ResourceType, int> _calculateGains(GatherResourcesParams params) {
    // Base gather per action = 5 + (SPD / 2)
    final baseAmount = 5 + (params.gatheringSpeed ~/ 2);
    final variance = _rng.nextInt(-2, 3);

    final result = <ResourceType, int>{};

    // Always get food in most biomes
    final foodChance = _foodChance(params.biome);
    if (_rng.chance(foodChance)) {
      result[ResourceType.food] = (baseAmount + variance).clamp(1, 30);
    }

    // Minerals from rocky/volcanic biomes
    final mineralChance = _mineralChance(params.biome);
    if (_rng.chance(mineralChance)) {
      result[ResourceType.minerals] =
          _rng.nextInt(1, (baseAmount ~/ 2).clamp(1, 10));
    }

    // Biochemical from coral reef, rainforest, volcanic
    final biochemChance = _biochemChance(params.biome);
    if (_rng.chance(biochemChance)) {
      result[ResourceType.biochemical] = _rng.nextInt(1, 5);
    }

    return result;
  }

  double _foodChance(BiomeType biome) => switch (biome) {
        BiomeType.primordialSoup => 0.90,
        BiomeType.shallowSea || BiomeType.coralReef => 0.85,
        BiomeType.rainforest => 0.80,
        BiomeType.deepOcean || BiomeType.frozenSubsurface => 0.50,
        BiomeType.aridScrublands || BiomeType.iceAgeTundra => 0.40,
        _ => 0.70,
      };

  double _mineralChance(BiomeType biome) => switch (biome) {
        BiomeType.thermalVents || BiomeType.volcanicTerrain => 0.80,
        BiomeType.deepOcean || BiomeType.frozenSubsurface => 0.40,
        BiomeType.aridScrublands => 0.30,
        _ => 0.15,
      };

  double _biochemChance(BiomeType biome) => switch (biome) {
        BiomeType.coralReef => 0.60,
        BiomeType.rainforest => 0.50,
        BiomeType.thermalVents || BiomeType.volcanicTerrain => 0.35,
        _ => 0.10,
      };
}

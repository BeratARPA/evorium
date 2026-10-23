import '../../../../core/base/base_use_case.dart';
import '../../../../core/domain/enums/biome_type.dart';
import '../../../../core/domain/enums/encounter_type.dart';
import '../../../../core/rng/random_service.dart';
import '../../../creature/domain/entities/creature.dart';
import '../entities/encounter.dart';
import '../repositories/encounter_repository.dart';

class TriggerEncounterParams {
  const TriggerEncounterParams({
    required this.creature,
    required this.currentBiome,
    this.forcedType,
  });

  final Creature creature;
  final BiomeType currentBiome;

  /// If set, always trigger an encounter of this type (used for Explore button).
  final EncounterType? forcedType;
}

/// Determines whether and which encounter is triggered.
///
/// When called from Explore, [forcedType] is null → rolls biome-weighted type.
/// Returns null if no encounter triggers (explore roll failed).
class TriggerEncounterUseCase
    implements UseCase<Encounter?, TriggerEncounterParams> {
  const TriggerEncounterUseCase(this._repository, this._rng);

  final EncounterRepository _repository;
  final RandomService _rng;

  @override
  Future<Encounter?> call(TriggerEncounterParams params) async {
    final type = params.forcedType ?? _rollEncounterType(params.currentBiome);

    final all = await _repository.getAllEncounters();
    final eligible = all
        .where((e) =>
            e.type == type &&
            e.minStage <= params.creature.stage.index)
        .toList();

    if (eligible.isEmpty) return null;
    return _rng.pick(eligible);
  }

  /// Rolls which encounter type fires based on biome context.
  EncounterType _rollEncounterType(BiomeType biome) {
    // Weight table for each biome family
    final weights = _biomeWeights(biome);
    final total = weights.values.fold(0.0, (a, b) => a + b);
    var roll = _rng.nextDoubleBetween(0, total);

    for (final entry in weights.entries) {
      roll -= entry.value;
      if (roll <= 0) return entry.key;
    }
    return EncounterType.predator;
  }

  Map<EncounterType, double> _biomeWeights(BiomeType biome) => switch (biome) {
        BiomeType.primordialSoup ||
        BiomeType.thermalVents ||
        BiomeType.frozenSubsurface =>
          {
            EncounterType.predator: 0.30,
            EncounterType.environmental: 0.30,
            EncounterType.hunt: 0.15,
            EncounterType.competition: 0.10,
            EncounterType.discovery: 0.10,
            EncounterType.symbiosis: 0.05,
          },
        BiomeType.shallowSea ||
        BiomeType.coralReef ||
        BiomeType.deepOcean =>
          {
            EncounterType.hunt: 0.25,
            EncounterType.predator: 0.25,
            EncounterType.competition: 0.20,
            EncounterType.symbiosis: 0.15,
            EncounterType.discovery: 0.10,
            EncounterType.environmental: 0.05,
          },
        _ => {
            EncounterType.predator: 0.25,
            EncounterType.hunt: 0.25,
            EncounterType.environmental: 0.20,
            EncounterType.competition: 0.15,
            EncounterType.discovery: 0.10,
            EncounterType.symbiosis: 0.05,
          },
      };
}

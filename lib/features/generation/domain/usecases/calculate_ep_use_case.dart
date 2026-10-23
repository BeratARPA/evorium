import '../../../../core/base/base_use_case.dart';
import '../../../creature/domain/entities/creature.dart';
import '../entities/generation_summary.dart';

class CalculateEpParams {
  const CalculateEpParams({
    required this.creature,
    required this.survivalSeconds,
    required this.deathCause,
  });

  final Creature creature;
  final int survivalSeconds;
  final String deathCause;
}

/// Calculates Evolutionary Points earned in a generation.
///
/// EP formula (from GDD):
///   Survival time:            1 min = 10 EP
///   Resources gathered:       100 units = 5 EP
///   Encounters won:           15-50 EP each
///   Biome areas discovered:   20 EP each (Phase 3)
///   Synergies activated:      25 EP each
///   Stage transition:         200 EP each
class CalculateEpUseCase
    implements UseCase<GenerationSummary, CalculateEpParams> {
  const CalculateEpUseCase();

  @override
  Future<GenerationSummary> call(CalculateEpParams params) async {
    final c = params.creature;
    final breakdown = <String, int>{};

    // Survival time: 10 EP per minute
    final survivalEP = (params.survivalSeconds / 60 * 10).floor();
    breakdown['Survival'] = survivalEP;

    // Resources gathered: 5 EP per 100 units
    final resourceEP = (c.resourcesGathered / 100 * 5).floor();
    breakdown['Resources'] = resourceEP;

    // Encounters: already tracked on creature
    final encounterEP = c.encountersWon * 20;
    breakdown['Encounters'] = encounterEP;

    // Trait count bonus: 5 EP per distinct trait
    final traitEP = c.traits.length * 5;
    breakdown['Traits'] = traitEP;

    // Stage transition bonus
    final stageEP = c.stage.index * 200;
    if (stageEP > 0) breakdown['Stage'] = stageEP;

    final totalEP =
        breakdown.values.fold(0, (sum, v) => sum + v);

    return GenerationSummary(
      generation: c.generation,
      survivalSeconds: params.survivalSeconds,
      resourcesGathered: c.resourcesGathered,
      encountersWon: c.encountersWon,
      evolutionaryPoints: totalEP,
      lastBiome: c.currentBiome,
      achievedStage: c.stage,
      deathCause: params.deathCause,
      traitIds: c.traitIds,
      epBreakdown: breakdown,
    );
  }
}

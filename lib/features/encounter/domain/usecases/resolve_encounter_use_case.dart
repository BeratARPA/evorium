import '../../../../core/base/base_use_case.dart';
import '../../../../core/domain/enums/encounter_outcome.dart';
import '../../../../core/domain/enums/encounter_type.dart';
import '../../../../core/rng/random_service.dart';
import '../../../creature/domain/entities/creature.dart';
import '../entities/encounter.dart';
import '../entities/encounter_choice.dart';
import '../entities/encounter_result.dart';

class ResolveEncounterParams {
  const ResolveEncounterParams({
    required this.creature,
    required this.encounter,
    required this.choice,
  });

  final Creature creature;
  final Encounter encounter;
  final EncounterChoice choice;
}

/// Resolves an encounter using the scoring formula:
///
///   score = (statValue × weight × 10) + traitBonus + rng(−10, 10)
///
/// Outcome thresholds:
///   ≥70 Critical Success | ≥50 Success | ≥30 Partial | ≥15 Failure | <15 Critical Failure
class ResolveEncounterUseCase
    implements SyncUseCase<EncounterResult, ResolveEncounterParams> {
  const ResolveEncounterUseCase(this._rng);

  final RandomService _rng;

  @override
  EncounterResult call(ResolveEncounterParams params) {
    final c = params.creature;
    final enc = params.encounter;
    final choice = params.choice;

    final statValue = _getStatValue(c, choice.primaryStat);
    final weight = enc.statWeights[choice.primaryStat] ?? 0.33;
    final traitBonus = enc.traitBonusIds.any(c.hasTrait) ? 20 : 0;
    final rng = _rng.nextInt(-10, 11);

    final score = (statValue * weight * 10).round() + traitBonus + rng;

    return _buildResult(score, enc.type);
  }

  int _getStatValue(Creature c, String stat) => switch (stat) {
        'atk' => c.stats.atk,
        'def' => c.stats.def,
        'spd' => c.stats.spd,
        'per' => c.stats.per,
        'adp' => c.stats.adp,
        'hp' => c.stats.hp ~/ 5,
        _ => 5,
      };

  EncounterResult _buildResult(int score, EncounterType type) {
    if (score >= 70) {
      return EncounterResult(
        outcome: EncounterOutcome.criticalSuccess,
        description: _desc(EncounterOutcome.criticalSuccess, type),
        hpChange: 10,
        epGain: 50,
        foodGain: type == EncounterType.hunt ? 20 : 5,
        won: true,
        score: score,
      );
    } else if (score >= 50) {
      return EncounterResult(
        outcome: EncounterOutcome.success,
        description: _desc(EncounterOutcome.success, type),
        epGain: 20,
        foodGain: type == EncounterType.hunt ? 10 : 0,
        won: true,
        score: score,
      );
    } else if (score >= 30) {
      return EncounterResult(
        outcome: EncounterOutcome.partial,
        description: _desc(EncounterOutcome.partial, type),
        hpChange: -5,
        epGain: 8,
        won: true,
        score: score,
      );
    } else if (score >= 15) {
      return EncounterResult(
        outcome: EncounterOutcome.failure,
        description: _desc(EncounterOutcome.failure, type),
        hpChange: -12,
        score: score,
      );
    } else {
      return EncounterResult(
        outcome: EncounterOutcome.criticalFailure,
        description: _desc(EncounterOutcome.criticalFailure, type),
        hpChange: -20,
        score: score,
      );
    }
  }

  String _desc(EncounterOutcome o, EncounterType t) => switch ((o, t)) {
        (EncounterOutcome.criticalSuccess, EncounterType.predator) =>
          'Overwhelmed the predator with superior force!',
        (EncounterOutcome.success, EncounterType.predator) =>
          'Successfully drove off the predator.',
        (EncounterOutcome.partial, EncounterType.predator) =>
          'Escaped, but not without taking damage.',
        (EncounterOutcome.failure, EncounterType.predator) =>
          'The predator landed heavy blows before you escaped.',
        (EncounterOutcome.criticalFailure, EncounterType.predator) =>
          'Critically wounded — barely survived the attack.',
        (EncounterOutcome.criticalSuccess, EncounterType.hunt) =>
          'Perfect hunt! Abundant nutrients secured.',
        (EncounterOutcome.success, EncounterType.hunt) =>
          'Successful hunt — food stores replenished.',
        (EncounterOutcome.partial, EncounterType.hunt) =>
          'Partial catch — some food acquired, energy expended.',
        (EncounterOutcome.failure, EncounterType.hunt) =>
          'Prey escaped. The hunt failed.',
        (EncounterOutcome.criticalFailure, EncounterType.hunt) =>
          'Ambushed while hunting — prey fought back!',
        (EncounterOutcome.criticalSuccess, EncounterType.environmental) =>
          'Adapted brilliantly to the environmental hazard!',
        (EncounterOutcome.success, EncounterType.environmental) =>
          'Navigated the hazard without incident.',
        (EncounterOutcome.partial, EncounterType.environmental) =>
          'Made it through, but took some damage.',
        (EncounterOutcome.failure, EncounterType.environmental) =>
          'The environment was harsh — significant damage taken.',
        (EncounterOutcome.criticalFailure, EncounterType.environmental) =>
          'Catastrophic — the environment nearly destroyed you.',
        (EncounterOutcome.criticalSuccess, EncounterType.discovery) =>
          'Remarkable discovery! New insights gained.',
        (EncounterOutcome.success, EncounterType.discovery) =>
          'Interesting find — knowledge is power.',
        (EncounterOutcome.partial, EncounterType.discovery) =>
          'Discovered something, but the opportunity slipped by.',
        (EncounterOutcome.failure, EncounterType.discovery) =>
          'Nothing useful discovered this time.',
        (EncounterOutcome.criticalFailure, EncounterType.discovery) =>
          'Exploration backfired — an unexpected hazard was triggered.',
        (EncounterOutcome.criticalSuccess, EncounterType.symbiosis) =>
          'A perfect mutualistic bond formed!',
        (EncounterOutcome.success, EncounterType.symbiosis) =>
          'Beneficial interaction — both parties gained.',
        (EncounterOutcome.partial, EncounterType.symbiosis) =>
          'Limited symbiosis — minor benefit only.',
        (EncounterOutcome.failure, EncounterType.symbiosis) =>
          'The potential symbiont rejected you.',
        (EncounterOutcome.criticalFailure, EncounterType.symbiosis) =>
          'What appeared as symbiosis was actually parasitism!',
        (EncounterOutcome.criticalSuccess, EncounterType.competition) =>
          'Dominated the competition — territory claimed!',
        (EncounterOutcome.success, EncounterType.competition) =>
          'Won the competition — resources secured.',
        (EncounterOutcome.partial, EncounterType.competition) =>
          'A draw — neither side fully won.',
        (EncounterOutcome.failure, EncounterType.competition) =>
          'Outcompeted — forced to retreat.',
        (EncounterOutcome.criticalFailure, EncounterType.competition) =>
          'Completely dominated — sustained heavy losses.',
      };
}

import '../../../../core/domain/enums/encounter_outcome.dart';

/// The outcome of a resolved encounter.
class EncounterResult {
  const EncounterResult({
    required this.outcome,
    required this.description,
    this.hpChange = 0,
    this.epGain = 0,
    this.foodGain = 0,
    this.won = false,
    this.score = 0,
  });

  final EncounterOutcome outcome;
  final String description;

  /// Positive = heal, negative = damage.
  final int hpChange;
  final int epGain;
  final int foodGain;
  final bool won;

  /// Debug: the raw score used for outcome determination.
  final int score;
}

import '../../../../core/domain/enums/encounter_type.dart';
import 'encounter_choice.dart';

/// An encounter event the creature can face during gameplay.
class Encounter {
  const Encounter({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.statWeights,
    required this.choices,
    this.traitBonusIds = const [],
    this.minStage = 0,
  });

  final String id;
  final EncounterType type;
  final String title;
  final String description;

  /// Stat name → contribution weight (should sum to ~1.0).
  final Map<String, double> statWeights;

  /// Available player choices.
  final List<EncounterChoice> choices;

  /// Traits that grant a +20 bonus to the resolution score.
  final List<String> traitBonusIds;

  /// Minimum EvolutionStage.index required.
  final int minStage;

  factory Encounter.fromJson(Map<String, dynamic> json) {
    final rawWeights = json['statWeights'] as Map<String, dynamic>;
    final rawChoices = json['choices'] as List<dynamic>;
    final rawBonusIds = json['traitBonusIds'] as List<dynamic>? ?? [];

    return Encounter(
      id: json['id'] as String,
      type: EncounterType.values.byName(json['type'] as String),
      title: json['title'] as String,
      description: json['description'] as String,
      statWeights: rawWeights.map(
        (k, v) => MapEntry(k, (v as num).toDouble()),
      ),
      choices: rawChoices
          .map((e) => EncounterChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
      traitBonusIds: rawBonusIds.map((e) => e as String).toList(),
      minStage: (json['minStage'] as int?) ?? 0,
    );
  }
}

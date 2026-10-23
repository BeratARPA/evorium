/// A player-selectable action during an encounter.
class EncounterChoice {
  const EncounterChoice({
    required this.id,
    required this.label,
    required this.primaryStat,
    this.requiredTraitId,
    this.icon = '⚡',
  });

  final String id;
  final String label;

  /// The creature stat used in the resolution formula.
  final String primaryStat;

  /// If non-null, the creature must have this trait to see this choice.
  final String? requiredTraitId;

  final String icon;

  factory EncounterChoice.fromJson(Map<String, dynamic> json) =>
      EncounterChoice(
        id: json['id'] as String,
        label: json['label'] as String,
        primaryStat: json['primaryStat'] as String,
        requiredTraitId: json['requiredTraitId'] as String?,
        icon: (json['icon'] as String?) ?? '⚡',
      );
}

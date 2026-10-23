/// Result tier of a resolved encounter.
enum EncounterOutcome {
  criticalSuccess,
  success,
  partial,
  failure,
  criticalFailure;

  bool get isWin =>
      this == criticalSuccess || this == success || this == partial;

  String get label => switch (this) {
        criticalSuccess => 'CRITICAL SUCCESS',
        success => 'SUCCESS',
        partial => 'PARTIAL SUCCESS',
        failure => 'FAILURE',
        criticalFailure => 'CRITICAL FAILURE',
      };

  String get emoji => switch (this) {
        criticalSuccess => '🌟',
        success => '✅',
        partial => '⚡',
        failure => '❌',
        criticalFailure => '💀',
      };
}

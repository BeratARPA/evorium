enum DifficultyMode {
  adaptive,
  easy,
  normal,
  hard,
  extinction;

  String get displayName => switch (this) {
        adaptive => 'Adaptive',
        easy => 'Easy',
        normal => 'Normal',
        hard => 'Hard',
        extinction => 'Extinction Mode',
      };

  String get description => switch (this) {
        adaptive => 'Difficulty adjusts to your performance',
        easy => 'Abundant resources, low encounter damage',
        normal => 'Balanced experience',
        hard => 'Scarce resources, strong enemies',
        extinction => 'Permadeath — no meta-progression',
      };

  /// Multiplier applied to resource spawns (higher = more resources).
  double get resourceMultiplier => switch (this) {
        adaptive => 1.0,
        easy => 1.5,
        normal => 1.0,
        hard => 0.6,
        extinction => 0.5,
      };

  /// Multiplier applied to encounter damage.
  double get damageMultiplier => switch (this) {
        adaptive => 1.0,
        easy => 0.6,
        normal => 1.0,
        hard => 1.4,
        extinction => 2.0,
      };

  /// Inheritance ratio for traits between generations.
  double get inheritanceRatio => switch (this) {
        adaptive => 0.5,
        easy => 0.7,
        normal => 0.5,
        hard => 0.3,
        extinction => 0.0,
      };
}

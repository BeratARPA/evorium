enum TraitCategory {
  structural,
  locomotion,
  sensory,
  attack,
  defense,
  metabolic,
  social;

  String get displayName => switch (this) {
        structural => 'Structural',
        locomotion => 'Locomotion',
        sensory => 'Sensory',
        attack => 'Attack',
        defense => 'Defense',
        metabolic => 'Metabolic',
        social => 'Social',
      };
}

enum EncounterType {
  hunt,
  predator,
  competition,
  environmental,
  discovery,
  symbiosis;

  String get displayName => switch (this) {
        hunt => 'Hunt',
        predator => 'Predator',
        competition => 'Competition',
        environmental => 'Environmental',
        discovery => 'Discovery',
        symbiosis => 'Symbiosis',
      };

  bool get isDangerous =>
      this == predator || this == environmental || this == competition;
}

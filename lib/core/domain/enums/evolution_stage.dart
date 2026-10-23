enum EvolutionStage {
  cellular,
  multicellular,
  landTransition,
  social,
  dominantSpecies;

  bool get isWater => this == cellular || this == multicellular;
  bool get isLand => index >= landTransition.index;

  /// Display name for UI.
  String get displayName => switch (this) {
        cellular => 'Cellular',
        multicellular => 'Multicellular',
        landTransition => 'Land Transition',
        social => 'Social',
        dominantSpecies => 'Dominant Species',
      };
}

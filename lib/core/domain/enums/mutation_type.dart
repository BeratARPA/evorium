enum MutationType {
  /// Grants an entirely new trait.
  newTrait,

  /// Evolves an existing trait to a higher level.
  traitEvolution,

  /// Pure stat change (no new trait added).
  statMutation,

  /// Biome-specific adaptation bonus.
  adaptiveMutation,

  /// Lose one trait in exchange for another (trade-off).
  regressiveMutation,

  /// Unlocked by having two specific synergy traits.
  synergyUnlock;

  String get displayName => switch (this) {
        newTrait => 'New Trait',
        traitEvolution => 'Evolution',
        statMutation => 'Stat Boost',
        adaptiveMutation => 'Adaptation',
        regressiveMutation => 'Trade-off',
        synergyUnlock => 'Synergy Unlock',
      };
}

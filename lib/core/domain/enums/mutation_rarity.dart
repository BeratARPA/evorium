enum MutationRarity {
  common,
  rare,
  epic,
  legendary;

  String get displayName => switch (this) {
        common => 'Common',
        rare => 'Rare',
        epic => 'Epic',
        legendary => 'Legendary',
      };

  /// Base drop weight for rarity-weighted random selection.
  int get weight => switch (this) {
        common => 60,
        rare => 25,
        epic => 12,
        legendary => 3,
      };
}

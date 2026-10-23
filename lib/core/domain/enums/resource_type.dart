enum ResourceType {
  /// Replenishes HP and energy; needed for breeding cost.
  food,

  /// Consumed by actions; renewed by rest/thermal sources.
  energy,

  /// For structural trait evolution (shell, teeth, skeleton).
  minerals,

  /// For chemical trait evolution (poison, acid, pheromone).
  biochemical,

  /// Meta-progression currency (never carried; accumulated each generation).
  evolutionaryPoints;

  String get displayName => switch (this) {
        food => 'Food',
        energy => 'Energy',
        minerals => 'Minerals',
        biochemical => 'Biochemical',
        evolutionaryPoints => 'EP',
      };

  String get icon => switch (this) {
        food => '🍖',
        energy => '⚡',
        minerals => '🪨',
        biochemical => '🧪',
        evolutionaryPoints => '⭐',
      };

  /// Whether this resource can be physically carried in inventory.
  bool get isCarried => this != evolutionaryPoints && this != energy;
}

/// ARE engine event name constants.
/// Format: namespace.action (snake_case)
class GameEvents {
  const GameEvents._();

  // ── Clock ─────────────────────────────────────────────────────────────────
  static const String clockTick = 'clock.tick';

  // ── Creature ──────────────────────────────────────────────────────────────
  static const String creatureSpawned = 'creature.spawned';
  static const String creatureDied = 'creature.died';
  static const String creatureDamaged = 'creature.damaged';
  static const String creatureHealed = 'creature.healed';
  static const String creatureStatChanged = 'creature.stat_changed';
  static const String creatureEnergyChanged = 'creature.energy_changed';

  // ── Mutation ──────────────────────────────────────────────────────────────
  static const String mutationSelected = 'mutation.selected';
  static const String mutationApplied = 'mutation.applied';

  // ── Biome ─────────────────────────────────────────────────────────────────
  static const String biomeEntered = 'biome.entered';
  static const String biomeConditionChanged = 'biome.condition_changed';
  static const String biomeDisaster = 'biome.disaster';
  static const String biomeNightStarted = 'biome.night_started';
  static const String biomeDayStarted = 'biome.day_started';

  // ── Resource ──────────────────────────────────────────────────────────────
  static const String resourceCollected = 'resource.collected';
  static const String resourceDepleted = 'resource.depleted';

  // ── Encounter ─────────────────────────────────────────────────────────────
  static const String encounterTriggered = 'encounter.triggered';
  static const String encounterResolved = 'encounter.resolved';

  // ── Generation ────────────────────────────────────────────────────────────
  static const String generationCompleted = 'generation.completed';
  static const String generationStarted = 'generation.started';

  // ── Evolution ─────────────────────────────────────────────────────────────
  static const String evolutionStageUnlocked = 'evolution.stage_unlocked';
  static const String traitSynergyActivated = 'trait.synergy_activated';
}

/// ARE rule group names.
class GameRuleGroups {
  const GameRuleGroups._();

  static const String cellular = 'cellular_rules';
  static const String multicellular = 'multicellular_rules';
  static const String land = 'land_rules';
  static const String social = 'social_rules';
  static const String dominant = 'dominant_rules';
  static const String night = 'night_rules';
  static const String disaster = 'disaster_rules';
  static const String waterBiome = 'water_biome_rules';
}

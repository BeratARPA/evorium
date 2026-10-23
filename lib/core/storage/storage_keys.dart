/// Hive box names and key constants.
class StorageKeys {
  const StorageKeys._();

  // ── Box Names ─────────────────────────────────────────────────────────────
  static const String saveSlotsBox = 'save_slots';
  static const String creatureBox = 'creature_box';
  static const String evolutionTreeBox = 'evolution_tree_box';
  static const String generationHistoryBox = 'generation_history';
  static const String settingsBox = 'settings_box';
  static const String achievementsBox = 'achievements_box';
  static const String biomeBox = 'biome_box';
  static const String resourcesBox = 'resources_box';

  // ── Settings Keys ─────────────────────────────────────────────────────────
  static const String settingsDifficulty = 'difficulty';
  static const String settingsMusicVolume = 'music_volume';
  static const String settingsSfxVolume = 'sfx_volume';
  static const String settingsHaptics = 'haptics_enabled';
  static const String settingsColorblind = 'colorblind_mode';
  static const String settingsReducedMotion = 'reduced_motion';
  static const String settingsGameSpeed = 'game_speed';

  // ── Save Slot Keys ────────────────────────────────────────────────────────
  static const String activeCreaturePrefix = 'active_creature_';
  static const String activeBiomePrefix = 'active_biome_';
  static const String generationCountPrefix = 'generation_count_';
  static const String evolutionStagePrefix = 'evolution_stage_';
  static const String evolutionPointsPrefix = 'evolution_points_';
}

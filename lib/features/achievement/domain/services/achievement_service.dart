import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/storage/storage_keys.dart';
import '../../data/datasources/achievement_definitions.dart';
import '../entities/achievement.dart';

/// Manages achievement unlock state via Hive.
/// Keeps a simple set of unlocked IDs — no repository abstraction needed
/// since achievements are a global (not slot-specific) concern.
class AchievementService {
  static const _unlockedKey = 'unlocked_achievements';

  Box<String> get _box => Hive.box<String>(StorageKeys.achievementsBox);

  // ── Read ─────────────────────────────────────────────────────────────────

  List<Achievement> getAll() {
    final unlockedIds = _loadUnlockedIds();
    final now = _loadUnlockDates();
    return AchievementDefinitions.all().map((a) {
      final unlocked = unlockedIds.contains(a.id);
      return a.copyWith(
        isUnlocked: unlocked,
        unlockedAt: unlocked ? now[a.id] : null,
      );
    }).toList();
  }

  bool isUnlocked(String id) => _loadUnlockedIds().contains(id);

  int get unlockedCount => _loadUnlockedIds().length;
  int get totalCount => AchievementDefinitions.all().length;

  // ── Unlock ───────────────────────────────────────────────────────────────

  /// Unlocks an achievement if not already unlocked. Returns true if newly unlocked.
  bool unlock(String id) {
    final ids = _loadUnlockedIds();
    if (ids.contains(id)) return false;
    ids.add(id);
    _saveUnlockedIds(ids);
    _saveUnlockDate(id);
    return true;
  }

  /// Batch check — call after significant events.
  List<Achievement> checkAndUnlock({
    int? generation,
    int? survivalSeconds,
    int? encountersWon,
    int? totalEncountersWon,
    int? traitCount,
    int? totalEp,
    int? treeNodesUnlocked,
    String? deathCause,
    String? evolutionStageId,
    String? encounterType,
    bool? hadSynergy,
    bool? hadLegendaryMutation,
    bool? survivedAtOneHp,
    bool? noStarvationThisGen,
  }) {
    final newlyUnlocked = <Achievement>[];

    void tryUnlock(String id) {
      if (unlock(id)) {
        final a = AchievementDefinitions.all().firstWhere((a) => a.id == id);
        newlyUnlocked.add(a.copyWith(isUnlocked: true, unlockedAt: DateTime.now()));
      }
    }

    if (generation != null && generation >= 1) tryUnlock('first_breath');
    if (generation != null && generation >= 10) tryUnlock('generation_10');
    if (generation != null && generation >= 25) tryUnlock('generation_25');

    if (survivalSeconds != null && survivalSeconds >= 60) tryUnlock('survivor_1min');
    if (survivalSeconds != null && survivalSeconds >= 300) tryUnlock('survivor_5min');

    if (totalEncountersWon != null && totalEncountersWon >= 1) tryUnlock('first_kill');
    if (totalEncountersWon != null && totalEncountersWon >= 10) tryUnlock('encounters_10');
    if (totalEncountersWon != null && totalEncountersWon >= 50) tryUnlock('encounters_50');

    if (traitCount != null && traitCount >= 1) tryUnlock('first_mutation');
    if (traitCount != null && traitCount >= 5) tryUnlock('traits_5');
    if (traitCount != null && traitCount >= 10) tryUnlock('traits_10');

    if (totalEp != null && totalEp >= 1000) tryUnlock('ep_1000');
    if (treeNodesUnlocked != null && treeNodesUnlocked >= 1) tryUnlock('tree_node_first');

    if (evolutionStageId == 'multicellular') tryUnlock('stage_multicellular');
    if (evolutionStageId == 'landTransition') tryUnlock('stage_land_transition');
    if (evolutionStageId == 'social') tryUnlock('stage_social');
    if (evolutionStageId == 'dominantSpecies') tryUnlock('stage_dominant');

    if (deathCause == 'predator') tryUnlock('death_by_predator');
    if (encounterType == 'symbiosis') tryUnlock('symbiosis');

    if (hadSynergy == true) tryUnlock('synergy_first');
    if (hadLegendaryMutation == true) tryUnlock('legendary_mutation');
    if (survivedAtOneHp == true) tryUnlock('comeback');
    if (noStarvationThisGen == true) tryUnlock('no_starvation');

    return newlyUnlocked;
  }

  // ── Private helpers ───────────────────────────────────────────────────────

  List<String> _loadUnlockedIds() {
    final raw = _box.get(_unlockedKey);
    if (raw == null) return [];
    final list = jsonDecode(raw) as List<dynamic>;
    return list.cast<String>();
  }

  void _saveUnlockedIds(List<String> ids) {
    _box.put(_unlockedKey, jsonEncode(ids));
  }

  Map<String, DateTime> _loadUnlockDates() {
    final raw = _box.get('unlock_dates');
    if (raw == null) return {};
    final map = jsonDecode(raw) as Map<String, dynamic>;
    return map.map((k, v) => MapEntry(k, DateTime.parse(v as String)));
  }

  void _saveUnlockDate(String id) {
    final dates = _loadUnlockDates();
    dates[id] = DateTime.now();
    _box.put('unlock_dates', jsonEncode(dates.map((k, v) => MapEntry(k, v.toIso8601String()))));
  }
}

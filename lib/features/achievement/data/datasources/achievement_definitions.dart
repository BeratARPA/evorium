import '../../domain/entities/achievement.dart';

abstract class AchievementDefinitions {
  static List<Achievement> all() => [
        // ── Survival ────────────────────────────────────────────────────────
        const Achievement(
          id: 'first_breath',
          name: 'First Breath',
          description: 'Survive your first generation.',
          category: AchievementCategory.survival,
          icon: '🌱',
        ),
        const Achievement(
          id: 'survivor_1min',
          name: 'Persistent',
          description: 'Survive for 1 minute in a single generation.',
          category: AchievementCategory.survival,
          icon: '⏱️',
        ),
        const Achievement(
          id: 'survivor_5min',
          name: 'Tenacious',
          description: 'Survive for 5 minutes in a single generation.',
          category: AchievementCategory.survival,
          icon: '💪',
        ),
        const Achievement(
          id: 'generation_10',
          name: 'Bloodline',
          description: 'Reach generation 10.',
          category: AchievementCategory.survival,
          icon: '🧬',
        ),
        const Achievement(
          id: 'generation_25',
          name: 'Ancient Lineage',
          description: 'Reach generation 25.',
          category: AchievementCategory.survival,
          icon: '🌳',
        ),
        const Achievement(
          id: 'no_starvation',
          name: 'Well Fed',
          description: 'Complete a generation without starving.',
          category: AchievementCategory.survival,
          icon: '🍃',
        ),

        // ── Combat ──────────────────────────────────────────────────────────
        const Achievement(
          id: 'first_kill',
          name: 'Hunter',
          description: 'Win your first encounter.',
          category: AchievementCategory.combat,
          icon: '⚔️',
        ),
        const Achievement(
          id: 'encounters_10',
          name: 'Battle Tested',
          description: 'Win 10 encounters across all generations.',
          category: AchievementCategory.combat,
          icon: '🛡️',
        ),
        const Achievement(
          id: 'encounters_50',
          name: 'Apex Hunter',
          description: 'Win 50 encounters across all generations.',
          category: AchievementCategory.combat,
          icon: '🏆',
        ),
        const Achievement(
          id: 'critical_success',
          name: 'Perfect Strike',
          description: 'Achieve a critical success in an encounter.',
          category: AchievementCategory.combat,
          icon: '⚡',
        ),

        // ── Evolution ───────────────────────────────────────────────────────
        const Achievement(
          id: 'first_mutation',
          name: 'Mutation',
          description: 'Apply your first mutation.',
          category: AchievementCategory.evolution,
          icon: '🔬',
        ),
        const Achievement(
          id: 'stage_multicellular',
          name: 'Multicellular',
          description: 'Reach the Multicellular evolution stage.',
          category: AchievementCategory.evolution,
          icon: '🫧',
        ),
        const Achievement(
          id: 'stage_land_transition',
          name: 'Land Walker',
          description: 'Reach the Land Transition evolution stage.',
          category: AchievementCategory.evolution,
          icon: '🦎',
        ),
        const Achievement(
          id: 'stage_social',
          name: 'Social Being',
          description: 'Reach the Social evolution stage.',
          category: AchievementCategory.evolution,
          icon: '🐺',
        ),
        const Achievement(
          id: 'stage_dominant',
          name: 'Dominant Species',
          description: 'Reach the Dominant Species stage.',
          category: AchievementCategory.evolution,
          icon: '👑',
        ),
        const Achievement(
          id: 'legendary_mutation',
          name: 'Legend',
          description: 'Unlock a legendary mutation.',
          category: AchievementCategory.evolution,
          icon: '🌟',
        ),
        const Achievement(
          id: 'ep_1000',
          name: 'Evolutionary Pressure',
          description: 'Accumulate 1000 total EP.',
          category: AchievementCategory.evolution,
          icon: '💎',
        ),
        const Achievement(
          id: 'tree_node_first',
          name: 'Branching Out',
          description: 'Unlock your first Evolution Tree node.',
          category: AchievementCategory.evolution,
          icon: '🌿',
        ),

        // ── Collection ──────────────────────────────────────────────────────
        const Achievement(
          id: 'traits_5',
          name: 'Polymorphic',
          description: 'Have 5 traits simultaneously.',
          category: AchievementCategory.collection,
          icon: '🧪',
        ),
        const Achievement(
          id: 'traits_10',
          name: 'Complex Organism',
          description: 'Have 10 traits simultaneously.',
          category: AchievementCategory.collection,
          icon: '🔭',
        ),
        const Achievement(
          id: 'biome_3',
          name: 'Explorer',
          description: 'Visit 3 different biomes.',
          category: AchievementCategory.collection,
          icon: '🗺️',
        ),
        const Achievement(
          id: 'synergy_first',
          name: 'Synergist',
          description: 'Activate a trait synergy for the first time.',
          category: AchievementCategory.collection,
          icon: '✨',
        ),

        // ── Special ─────────────────────────────────────────────────────────
        const Achievement(
          id: 'death_by_predator',
          name: 'Prey',
          description: 'Be killed by a predator encounter.',
          category: AchievementCategory.special,
          icon: '💀',
        ),
        const Achievement(
          id: 'comeback',
          name: 'Comeback',
          description: 'Survive at 1 HP.',
          category: AchievementCategory.special,
          icon: '❤️',
        ),
        const Achievement(
          id: 'symbiosis',
          name: 'Friends in Nature',
          description: 'Complete a symbiosis encounter.',
          category: AchievementCategory.special,
          icon: '🤝',
        ),
      ];
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

import '../../../../app/di/injection.dart';
import '../../../../app/theme/app_colors.dart';
import '../../domain/entities/achievement.dart';
import '../../domain/services/achievement_service.dart';

class AchievementsPage extends StatefulWidget {
  const AchievementsPage({super.key});

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {
  late List<Achievement> _achievements;
  AchievementCategory? _selectedCategory;

  static const _categoryIcons = {
    AchievementCategory.survival: '🌱',
    AchievementCategory.combat: '⚔️',
    AchievementCategory.evolution: '🧬',
    AchievementCategory.collection: '🗺️',
    AchievementCategory.special: '✨',
  };

  static const _categoryLabels = {
    AchievementCategory.survival: 'Survival',
    AchievementCategory.combat: 'Combat',
    AchievementCategory.evolution: 'Evolution',
    AchievementCategory.collection: 'Collection',
    AchievementCategory.special: 'Special',
  };

  @override
  void initState() {
    super.initState();
    _achievements = sl<AchievementService>().getAll();
  }

  List<Achievement> get _filtered => _selectedCategory == null
      ? _achievements
      : _achievements.where((a) => a.category == _selectedCategory).toList();

  int get _unlockedCount => _achievements.where((a) => a.isUnlocked).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildCategoryFilter(),
            Expanded(child: _buildList()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios, color: AppColors.primary, size: 20),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const Gap(12),
          const Text(
            'ACHIEVEMENTS',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
            ),
          ),
          const Spacer(),
          Text(
            '$_unlockedCount / ${_achievements.length}',
            style: const TextStyle(
              color: AppColors.xp,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          _FilterChip(
            label: 'All',
            icon: '🏆',
            selected: _selectedCategory == null,
            onTap: () => setState(() => _selectedCategory = null),
          ),
          ...AchievementCategory.values.map(
            (cat) => _FilterChip(
              label: _categoryLabels[cat]!,
              icon: _categoryIcons[cat]!,
              selected: _selectedCategory == cat,
              onTap: () => setState(() => _selectedCategory = cat),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList() {
    final filtered = _filtered;
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: filtered.length,
      separatorBuilder: (_, __) => const Gap(8),
      itemBuilder: (context, i) {
        return _AchievementCard(achievement: filtered[i])
            .animate()
            .fadeIn(delay: (i * 40).ms);
      },
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final String icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.primary.withValues(alpha: 0.15)
              : AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? AppColors.primary : AppColors.border,
          ),
        ),
        child: Row(
          children: [
            Text(icon, style: const TextStyle(fontSize: 12)),
            const Gap(4),
            Text(
              label,
              style: TextStyle(
                color: selected ? AppColors.primary : AppColors.textSecondary,
                fontSize: 11,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AchievementCard extends StatelessWidget {
  const _AchievementCard({required this.achievement});

  final Achievement achievement;

  @override
  Widget build(BuildContext context) {
    final unlocked = achievement.isUnlocked;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: unlocked
            ? AppColors.xp.withValues(alpha: 0.06)
            : AppColors.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: unlocked
              ? AppColors.xp.withValues(alpha: 0.4)
              : AppColors.border,
        ),
      ),
      child: Row(
        children: [
          // Icon
          Container(
            width: 48,
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: unlocked
                  ? AppColors.xp.withValues(alpha: 0.15)
                  : AppColors.surfaceVariant,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              unlocked ? achievement.icon : '🔒',
              style: TextStyle(fontSize: unlocked ? 24 : 20),
            ),
          ),
          const Gap(12),
          // Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  unlocked ? achievement.name : '???',
                  style: TextStyle(
                    color: unlocked ? AppColors.xp : AppColors.textSecondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const Gap(2),
                Text(
                  unlocked
                      ? achievement.description
                      : 'Complete the challenge to reveal this achievement.',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 11,
                    height: 1.4,
                  ),
                ),
                if (unlocked && achievement.unlockedAt != null) ...[
                  const Gap(4),
                  Text(
                    'Unlocked ${_formatDate(achievement.unlockedAt!)}',
                    style: const TextStyle(
                      color: AppColors.textDisabled,
                      fontSize: 9,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (unlocked) ...[
            const Gap(8),
            const Icon(Icons.check_circle, color: AppColors.xp, size: 16),
          ],
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

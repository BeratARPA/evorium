import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../domain/entities/mutation.dart';

class MutationCard extends StatelessWidget {
  const MutationCard({
    super.key,
    required this.mutation,
    required this.onSelected,
    this.index = 0,
  });

  final Mutation mutation;
  final VoidCallback onSelected;
  final int index;

  @override
  Widget build(BuildContext context) {
    final rarityColor = _rarityColor(mutation.rarity.name);

    return GestureDetector(
      onTap: onSelected,
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: rarityColor, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: rarityColor.withValues(alpha: 0.25),
              blurRadius: 12,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rarity badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: rarityColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: rarityColor.withValues(alpha: 0.5)),
              ),
              child: Text(
                mutation.rarity.displayName.toUpperCase(),
                style: TextStyle(
                  color: rarityColor,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),

            const Gap(10),

            // Mutation type icon
            Text(
              _typeEmoji(mutation.type.name),
              style: const TextStyle(fontSize: 28),
            ),

            const Gap(8),

            // Name
            Text(
              mutation.name,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            const Gap(6),

            // Description
            Text(
              mutation.description,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 10,
                height: 1.3,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),

            const Gap(10),

            // Stat preview
            if (mutation.statPreview.isNotEmpty) ...[
              const Divider(color: AppColors.border, height: 1),
              const Gap(8),
              Wrap(
                spacing: 6,
                runSpacing: 4,
                children: mutation.statPreview.entries
                    .map((e) => _StatChip(stat: e.key, value: e.value))
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    )
        .animate(delay: Duration(milliseconds: index * 120))
        .fadeIn(duration: 400.ms)
        .slideY(begin: 0.3, curve: Curves.easeOutCubic);
  }

  Color _rarityColor(String rarity) => switch (rarity) {
        'common' => AppColors.rarityCommon,
        'rare' => AppColors.rarityRare,
        'epic' => AppColors.rarityEpic,
        'legendary' => AppColors.rarityLegendary,
        _ => AppColors.rarityCommon,
      };

  String _typeEmoji(String type) => switch (type) {
        'newTrait' => '🧬',
        'traitEvolution' => '⬆️',
        'statMutation' => '📈',
        'adaptiveMutation' => '🌍',
        'regressiveMutation' => '🔄',
        'synergyUnlock' => '✨',
        _ => '🧬',
      };
}

class _StatChip extends StatelessWidget {
  const _StatChip({required this.stat, required this.value});

  final String stat;
  final int value;

  @override
  Widget build(BuildContext context) {
    final isPositive = value > 0;
    final color = isPositive ? AppColors.secondary : AppColors.hp;
    final prefix = isPositive ? '+' : '';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        '${stat.toUpperCase()} $prefix$value',
        style: TextStyle(
          color: color,
          fontSize: 9,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

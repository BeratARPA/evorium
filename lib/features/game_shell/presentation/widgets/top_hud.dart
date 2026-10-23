import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../creature/presentation/states/creature_state.dart';
import '../../../creature/presentation/viewmodels/creature_viewmodel.dart';
import '../../../resource/presentation/viewmodels/resource_viewmodel.dart';
import '../viewmodels/game_shell_viewmodel.dart';

class TopHud extends ConsumerWidget {
  const TopHud({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameShellProvider);
    final creatureState = ref.watch(creatureProvider);
    final resources = ref.watch(resourceProvider.select((s) => s.resources));

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.85),
        border: const Border(
          bottom: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            // HP + Energy bars
            if (creatureState is CreatureStateAlive) ...[
              _StatBar(
                label: 'HP',
                value: creatureState.creature.stats.hpPercent,
                color: AppColors.hp,
                width: 80,
              ),
              const Gap(8),
              _StatBar(
                label: 'EN',
                value: creatureState.creature.stats.energyPercent,
                color: AppColors.energy,
                width: 80,
              ),
            ],

            const Spacer(),

            // Food resource
            _HudChip(
              label: '🌿',
              value: '${resources.food}',
              color: AppColors.secondary,
            ),

            const Gap(4),

            // Minerals
            _HudChip(
              label: '🪨',
              value: '${resources.minerals}',
              color: const Color(0xFF8B8080),
            ),

            const Gap(4),

            // Biochemical
            _HudChip(
              label: '🧪',
              value: '${resources.biochemical}',
              color: const Color(0xFFB04DF5),
            ),

            const Gap(6),

            // Generation counter
            _HudChip(
              label: 'GEN',
              value: '${gameState.generation}',
              color: AppColors.primary,
            ),

            const Gap(6),

            // Survival time
            _HudChip(
              label: 'TIME',
              value: _formatTime(gameState.survivalSeconds),
              color: AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }
}

class _StatBar extends StatelessWidget {
  const _StatBar({
    required this.label,
    required this.value,
    required this.color,
    required this.width,
  });

  final String label;
  final double value;
  final Color color;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: color,
                fontSize: 9,
              ),
        ),
        const Gap(2),
        SizedBox(
          width: width,
          height: 6,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: LinearProgressIndicator(
              value: value.clamp(0.0, 1.0),
              backgroundColor: AppColors.surfaceVariant,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ),
      ],
    );
  }
}

class _HudChip extends StatelessWidget {
  const _HudChip({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.4), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$label ',
            style: TextStyle(
              color: color.withValues(alpha: 0.7),
              fontSize: 9,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

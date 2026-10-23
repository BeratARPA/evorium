import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../biome/presentation/pages/biome_selection_page.dart';
import '../../../biome/presentation/states/biome_state.dart';
import '../../../biome/presentation/viewmodels/biome_viewmodel.dart';
import '../../../creature/presentation/states/creature_state.dart';
import '../../../creature/presentation/viewmodels/creature_viewmodel.dart';
import '../../../resource/presentation/viewmodels/resource_viewmodel.dart';
import '../viewmodels/game_shell_viewmodel.dart';

class BottomActions extends ConsumerWidget {
  const BottomActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameShellProvider);
    final canGather = ref.watch(resourceProvider.select((s) => s.canGather));

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.9),
        border: const Border(
          top: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Move / Explore
            _ActionButton(
              icon: Icons.explore_outlined,
              label: 'Explore',
              color: gameState.isPlaying ? AppColors.primary : AppColors.textDisabled,
              onTap: gameState.isPlaying
                  ? () => ref.read(gameShellProvider.notifier).onExplore()
                  : () {},
            ),

            // Gather Resources
            _ActionButton(
              icon: Icons.grass_outlined,
              label: 'Gather',
              color: canGather ? AppColors.secondary : AppColors.textDisabled,
              onTap: canGather && gameState.isPlaying
                  ? () {
                      final biomeState = ref.read(biomeProvider);
                      final creatureState = ref.read(creatureProvider);
                      if (biomeState is BiomeStateLoaded &&
                          creatureState is CreatureStateAlive) {
                        ref.read(resourceProvider.notifier).gather(
                              biome: biomeState.biome.type,
                              gatheringSpeed:
                                  creatureState.creature.stats.spd,
                            );
                      }
                    }
                  : () {},
            ),

            // Pause / Resume toggle
            _ActionButton(
              icon: gameState.isPaused
                  ? Icons.play_arrow_rounded
                  : Icons.pause_rounded,
              label: gameState.isPaused ? 'Resume' : 'Pause',
              color: AppColors.textSecondary,
              onTap: () {
                if (gameState.isPaused) {
                  ref.read(gameShellProvider.notifier).resumeFromPause();
                } else {
                  ref.read(gameShellProvider.notifier).pauseGame();
                }
              },
            ),

            // Migrate biome
            _ActionButton(
              icon: Icons.swap_horiz_rounded,
              label: 'Migrate',
              color: gameState.isPlaying ? AppColors.accent : AppColors.textDisabled,
              onTap: gameState.isPlaying
                  ? () {
                      ref.read(gameShellProvider.notifier).pauseGame();
                      Navigator.of(context)
                          .push<void>(
                        MaterialPageRoute<void>(
                          fullscreenDialog: true,
                          builder: (_) => BiomeSelectionPage(onMigrated: () {}),
                        ),
                      )
                          .then((_) {
                        if (context.mounted) {
                          ref.read(gameShellProvider.notifier).resumeFromPause();
                        }
                      });
                    }
                  : () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 64,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: color.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 22),
            const Gap(4),
            Text(
              label,
              style: TextStyle(
                color: color.withValues(alpha: 0.8),
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

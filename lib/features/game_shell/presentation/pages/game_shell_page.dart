import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_router.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../biome/presentation/pages/biome_selection_page.dart';
import '../../../biome/presentation/states/biome_state.dart';
import '../../../biome/presentation/viewmodels/biome_viewmodel.dart';
import '../../../encounter/presentation/pages/encounter_page.dart';
import '../../../generation/presentation/pages/generation_summary_page.dart';
import '../../../menu/presentation/pages/settings_page.dart';
import '../../../mutation/presentation/pages/mutation_selection_page.dart';
import '../../../tutorial/domain/tutorial_service.dart';
import '../../../tutorial/presentation/tutorial_hint_overlay.dart';
import '../states/game_shell_state.dart';
import '../viewmodels/game_shell_viewmodel.dart';
import '../viewmodels/synergy_notification_provider.dart';
import '../widgets/biome_background.dart';
import '../widgets/bottom_actions.dart';
import '../widgets/creature_sprite.dart';
import '../widgets/resource_nodes_overlay.dart';
import '../widgets/top_hud.dart';

/// The main game screen.
/// Hosts BiomeBackground → CreatureSprite → TopHUD → BottomActions in a Stack.
class GameShellPage extends ConsumerStatefulWidget {
  const GameShellPage({super.key, this.isNewGame = true});

  /// If true, starts a new game; otherwise resumes an existing session.
  final bool isNewGame;

  @override
  ConsumerState<GameShellPage> createState() => _GameShellPageState();
}

class _GameShellPageState extends ConsumerState<GameShellPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isNewGame) {
        ref.read(gameShellProvider.notifier).startNewGame();
        _showTutorialHints();
      } else {
        ref.read(gameShellProvider.notifier).resumeGame();
      }
    });
  }

  Future<void> _showTutorialHints() async {
    // Chain tutorial hints sequentially
    await showTutorialHintIfNeeded(context, TutorialHint.welcome);
    if (!mounted) return;
    await showTutorialHintIfNeeded(context, TutorialHint.gather);
    if (!mounted) return;
    await showTutorialHintIfNeeded(context, TutorialHint.mutations);
    if (!mounted) return;
    await showTutorialHintIfNeeded(context, TutorialHint.clock);
  }

  @override
  Widget build(BuildContext context) {
    final phase = ref.watch(gameShellProvider.select((s) => s.phase));

    // React to phase transitions that require full-screen overlays
    ref.listen<GamePhase>(
      gameShellProvider.select((s) => s.phase),
      (prev, next) {
        if (next == GamePhase.mutationSelection) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            Navigator.of(context).push<void>(
              MaterialPageRoute<void>(
                fullscreenDialog: true,
                builder: (_) => MutationSelectionPage(
                  isGenerationStart: true,
                  onMutationSelected: () {
                    Navigator.of(context).pop();
                    ref.read(gameShellProvider.notifier).onMutationSelected();
                  },
                ),
              ),
            );
          });
        } else if (next == GamePhase.encounter) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            final nav = Navigator.of(context);
            // Show encounter tutorial hint (non-blocking), then push encounter
            showTutorialHintIfNeeded(context, TutorialHint.encounters).then((_) {
              if (!mounted) return;
              nav.push<void>(
                MaterialPageRoute<void>(
                  fullscreenDialog: true,
                  builder: (_) => EncounterPage(
                    onDismiss: () {
                      nav.pop();
                      ref.read(gameShellProvider.notifier).onEncounterResolved();
                    },
                  ),
                ),
              );
            });
          });
        } else if (next == GamePhase.deathSummary) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            final summary = ref.read(gameShellProvider).currentSummary;
            if (summary == null) return;
            Navigator.of(context).push<void>(
              MaterialPageRoute<void>(
                fullscreenDialog: true,
                builder: (_) => GenerationSummaryPage(
                  summary: summary,
                  onContinue: () {
                    Navigator.of(context).pop();
                    ref.read(gameShellProvider.notifier).beginNextGeneration();
                  },
                ),
              ),
            );
          });
        }
      },
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          BiomeBackground(
            child: Column(
              children: [
                const TopHud(),
                Expanded(child: _buildCenterContent(phase)),
                const BottomActions(),
              ],
            ),
          ),
          // Synergy notification overlay
          const Positioned(
            top: 80,
            left: 16,
            right: 16,
            child: _SynergyNotificationBanner(),
          ),
        ],
      ),
    );
  }

  Widget _buildCenterContent(GamePhase phase) => switch (phase) {
        GamePhase.setup => const _SetupView(),
        GamePhase.playing ||
        GamePhase.encounter ||
        GamePhase.mutationSelection ||
        GamePhase.deathSummary =>
          const _PlayingView(),
        GamePhase.paused => const _PausedOverlay(),
      };
}

// ── Center views ─────────────────────────────────────────────────────────────

class _SetupView extends ConsumerWidget {
  const _SetupView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'EVORIUM',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: AppColors.primary,
                  letterSpacing: 8,
                  fontWeight: FontWeight.w900,
                ),
          )
              .animate()
              .fadeIn(duration: 600.ms)
              .shimmer(duration: 2000.ms, color: AppColors.primaryGlow),
          const SizedBox(height: 8),
          Text(
            'Evolve. Adapt. Survive.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                  letterSpacing: 3,
                ),
          ).animate().fadeIn(delay: 300.ms, duration: 600.ms),
          const SizedBox(height: 32),
          const CircularProgressIndicator(
            color: AppColors.primary,
            strokeWidth: 1.5,
          ).animate().fadeIn(delay: 600.ms),
        ],
      ),
    );
  }
}

class _PlayingView extends StatelessWidget {
  const _PlayingView();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Creature in center
        const Positioned.fill(child: CreatureSprite()),

        // Resource nodes overlay
        const Positioned.fill(child: ResourceNodesOverlay()),

        // Biome name label (bottom of center)
        Positioned(
          bottom: 16,
          left: 0,
          right: 0,
          child: _BiomeLabel(),
        ),
      ],
    );
  }
}

class _BiomeLabel extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final biomeState = ref.watch(biomeProvider);
    if (biomeState is! BiomeStateLoaded) return const SizedBox.shrink();

    final biome = biomeState.biome;
    final isNight = biome.condition.isNight;

    return GestureDetector(
      onTap: () {
        final phase = ref.read(gameShellProvider.select((s) => s.phase));
        if (phase != GamePhase.playing) return;
        ref.read(gameShellProvider.notifier).pauseGame();
        Navigator.of(context)
            .push<void>(
          MaterialPageRoute<void>(
            fullscreenDialog: true,
            builder: (_) => BiomeSelectionPage(
              onMigrated: () {},
            ),
          ),
        )
            .then((_) {
          if (context.mounted) {
            ref.read(gameShellProvider.notifier).resumeFromPause();
          }
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isNight ? '🌙' : biome.emoji,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 6),
              Text(
                biome.displayName.toUpperCase(),
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 10,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          if (biome.condition.season.isHarsh)
            Text(
              biome.condition.season.displayName.toUpperCase(),
              style: TextStyle(
                color: AppColors.hp.withValues(alpha: 0.8),
                fontSize: 9,
                letterSpacing: 1,
              ),
            ),
        ],
      ).animate().fadeIn(),
    );
  }
}

// ── Paused overlay ────────────────────────────────────────────────────────────

class _PausedOverlay extends ConsumerWidget {
  const _PausedOverlay();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: AppColors.background.withValues(alpha: 0.85),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'PAUSED',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: AppColors.textSecondary,
                    letterSpacing: 6,
                  ),
            ).animate().fadeIn(duration: 300.ms),
            const SizedBox(height: 40),
            SizedBox(
              width: 220,
              child: Column(
                children: [
                  _PauseButton(
                    label: 'RESUME',
                    color: AppColors.primary,
                    onTap: () =>
                        ref.read(gameShellProvider.notifier).resumeFromPause(),
                  ),
                  const SizedBox(height: 12),
                  _PauseButton(
                    label: 'SETTINGS',
                    color: AppColors.textSecondary,
                    onTap: () {
                      Navigator.of(context).push<void>(
                        MaterialPageRoute<void>(
                          builder: (_) => const SettingsPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  _PauseButton(
                    label: 'MAIN MENU',
                    color: AppColors.hp,
                    onTap: () {
                      ref.read(gameShellProvider.notifier).quitToMenu();
                      context.go(AppRoutes.mainMenu);
                    },
                  ),
                ],
              ),
            ).animate().fadeIn(delay: 100.ms, duration: 300.ms),
          ],
        ),
      ),
    );
  }
}

class _PauseButton extends StatelessWidget {
  const _PauseButton({
    required this.label,
    required this.color,
    required this.onTap,
  });

  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withValues(alpha: 0.4)),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color,
            fontSize: 13,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}

// ── Synergy notification banner ───────────────────────────────────────────────

class _SynergyNotificationBanner extends ConsumerWidget {
  const _SynergyNotificationBanner();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final synergy = ref.watch(synergyNotificationProvider);
    if (synergy == null) return const SizedBox.shrink();

    final (synergyId, bonusValue) = synergy;
    final displayName = synergyId
        .replaceAll('_', ' ')
        .split(' ')
        .map((w) => w.isEmpty ? w : w[0].toUpperCase() + w.substring(1))
        .join(' ');

    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.accent.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.accent.withValues(alpha: 0.5)),
        ),
        child: Row(
          children: [
            const Text('✨', style: TextStyle(fontSize: 20)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'SYNERGY ACTIVATED',
                    style: TextStyle(
                      color: AppColors.accent,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  Text(
                    displayName,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (bonusValue > 0)
                    Text(
                      '+$bonusValue bonus',
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 10,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      )
          .animate()
          .fadeIn(duration: 300.ms)
          .slideY(begin: -0.5, end: 0, duration: 300.ms, curve: Curves.easeOut),
    );
  }
}

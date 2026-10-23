import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../evolution_tree/presentation/pages/evolution_tree_page.dart';
import '../../domain/entities/generation_summary.dart';

/// Shows end-of-generation stats and EP earned.
class GenerationSummaryPage extends ConsumerWidget {
  const GenerationSummaryPage({
    super.key,
    required this.summary,
    required this.onContinue,
  });

  final GenerationSummary summary;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Title
              Text(
                'GENERATION ${summary.generation} COMPLETE',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: summary.deathCause == 'starvation'
                          ? AppColors.xp
                          : AppColors.hp,
                      letterSpacing: 2,
                      fontSize: 18,
                    ),
                textAlign: TextAlign.center,
              )
                  .animate()
                  .fadeIn(duration: 600.ms)
                  .shimmer(delay: 300.ms, duration: 1500.ms),

              const Gap(8),
              Text(
                'Cause: ${summary.deathCause}',
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                  letterSpacing: 1,
                ),
                textAlign: TextAlign.center,
              ).animate().fadeIn(delay: 200.ms),

              const Gap(32),

              // Stats grid
              _StatsGrid(summary: summary).animate().fadeIn(delay: 400.ms),

              const Gap(24),

              // EP breakdown
              _EpBreakdown(summary: summary).animate().fadeIn(delay: 600.ms),

              const Spacer(),

              // EP total
              _EpTotal(ep: summary.evolutionaryPoints)
                  .animate()
                  .fadeIn(delay: 800.ms),

              const Gap(24),

              OutlinedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const EvolutionTreePage(),
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  side: const BorderSide(color: AppColors.xp),
                  foregroundColor: AppColors.xp,
                ),
                child: const Text(
                  '⚡  EVOLUTION TREE',
                  style: TextStyle(letterSpacing: 1.5),
                ),
              ).animate().fadeIn(delay: 900.ms),

              const Gap(12),

              ElevatedButton(
                onPressed: onContinue,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'BEGIN NEXT GENERATION',
                  style: TextStyle(letterSpacing: 1.5),
                ),
              ).animate().fadeIn(delay: 1000.ms),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatsGrid extends StatelessWidget {
  const _StatsGrid({required this.summary});

  final GenerationSummary summary;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _StatTile(
          label: 'Survived',
          value: summary.survivalFormatted,
          icon: '⏱️',
        ),
        const Gap(12),
        _StatTile(
          label: 'Resources',
          value: '${summary.resourcesGathered}',
          icon: '🌿',
        ),
        const Gap(12),
        _StatTile(
          label: 'Encounters',
          value: '${summary.encountersWon}',
          icon: '⚔️',
        ),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          children: [
            Text(icon, style: const TextStyle(fontSize: 24)),
            const Gap(4),
            Text(
              value,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(2),
            Text(
              label,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EpBreakdown extends StatelessWidget {
  const _EpBreakdown({required this.summary});

  final GenerationSummary summary;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'EP BREAKDOWN',
            style: TextStyle(
              color: AppColors.xp,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          const Gap(10),
          ...summary.epBreakdown.entries.map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Row(
                children: [
                  Text(
                    e.key,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '+${e.value} EP',
                    style: const TextStyle(
                      color: AppColors.xp,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EpTotal extends StatelessWidget {
  const _EpTotal({required this.ep});

  final int ep;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.xp.withValues(alpha: 0.1),
            AppColors.accent.withValues(alpha: 0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.xp.withValues(alpha: 0.4)),
      ),
      child: Column(
        children: [
          const Text(
            'EVOLUTIONARY POINTS EARNED',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 10,
              letterSpacing: 2,
            ),
          ),
          const Gap(4),
          Text(
            '$ep EP',
            style: const TextStyle(
              color: AppColors.xp,
              fontSize: 32,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

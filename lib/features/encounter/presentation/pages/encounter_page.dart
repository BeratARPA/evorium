import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/domain/enums/encounter_outcome.dart';
import '../../../creature/presentation/states/creature_state.dart';
import '../../../creature/presentation/viewmodels/creature_viewmodel.dart';
import '../../domain/entities/encounter.dart';
import '../../domain/entities/encounter_choice.dart';
import '../../domain/entities/encounter_result.dart';
import '../states/encounter_state.dart';
import '../viewmodels/encounter_viewmodel.dart';

/// Full-screen encounter overlay.
/// Shown when a creature encounters another organism or event.
class EncounterPage extends ConsumerWidget {
  const EncounterPage({super.key, required this.onDismiss});

  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(encounterProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: switch (state) {
          EncounterStateActive(:final encounter, :final availableChoices) =>
            _ActiveView(encounter: encounter, choices: availableChoices),
          EncounterStateResolving() => const _ResolvingView(),
          EncounterStateResolved(:final result) =>
            _OutcomeView(result: result, onDismiss: onDismiss),
          _ => const SizedBox.shrink(),
        },
      ),
    );
  }
}

// ── Active View ───────────────────────────────────────────────────────────────

class _ActiveView extends ConsumerWidget {
  const _ActiveView({required this.encounter, required this.choices});

  final Encounter encounter;
  final List<EncounterChoice> choices;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          _EncounterHeader(encounter: encounter),

          const Gap(24),

          // Description
          Text(
            encounter.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(delay: 300.ms),

          const Gap(32),

          // Creature stats hint
          _StatHints(encounter: encounter),

          const Gap(24),

          const Text(
            'CHOOSE YOUR RESPONSE',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 10,
              letterSpacing: 2,
            ),
            textAlign: TextAlign.center,
          ),

          const Gap(12),

          // Choice buttons
          ...choices.asMap().entries.map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _ChoiceButton(
                  choice: e.value,
                  index: e.key,
                  onTap: () {
                    final cs = ref.read(creatureProvider);
                    if (cs is CreatureStateAlive) {
                      ref
                          .read(encounterProvider.notifier)
                          .resolveChoice(cs.creature, e.value);
                    }
                  },
                ),
              )),

          const Spacer(),
        ],
      ),
    );
  }
}

class _EncounterHeader extends StatelessWidget {
  const _EncounterHeader({required this.encounter});

  final Encounter encounter;

  String get _typeEmoji => switch (encounter.type.name) {
        'predator' => '🦷',
        'hunt' => '🎯',
        'environmental' => '⛈️',
        'discovery' => '🔬',
        'symbiosis' => '🌱',
        'competition' => '⚔️',
        _ => '❓',
      };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _typeEmoji,
          style: const TextStyle(fontSize: 56),
          textAlign: TextAlign.center,
        )
            .animate()
            .scale(begin: const Offset(0.5, 0.5), duration: 400.ms)
            .fadeIn(),
        const Gap(8),
        Text(
          encounter.title.toUpperCase(),
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: AppColors.accent,
                letterSpacing: 3,
                fontSize: 20,
              ),
          textAlign: TextAlign.center,
        ).animate().fadeIn(delay: 200.ms),
        const Gap(4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
            color: AppColors.surfaceVariant,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            encounter.type.displayName.toUpperCase(),
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 9,
              letterSpacing: 2,
            ),
          ),
        ).animate().fadeIn(delay: 300.ms),
      ],
    );
  }
}

class _StatHints extends ConsumerWidget {
  const _StatHints({required this.encounter});

  final Encounter encounter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = ref.watch(creatureProvider);
    if (cs is! CreatureStateAlive) return const SizedBox.shrink();

    final stats = cs.creature.stats;
    final relevant = encounter.statWeights.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: relevant.take(3).map((e) {
        final value = _statVal(stats, e.key);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: _StatPill(label: e.key.toUpperCase(), value: value),
        );
      }).toList(),
    ).animate().fadeIn(delay: 400.ms);
  }

  int _statVal(dynamic stats, String key) => switch (key) {
        'atk' => stats.atk as int,
        'def' => stats.def as int,
        'spd' => stats.spd as int,
        'per' => stats.per as int,
        'adp' => stats.adp as int,
        _ => 5,
      };
}

class _StatPill extends StatelessWidget {
  const _StatPill({required this.label, required this.value});

  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 9,
              letterSpacing: 1,
            ),
          ),
          const Gap(2),
          Text(
            '$value',
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChoiceButton extends StatelessWidget {
  const _ChoiceButton({
    required this.choice,
    required this.index,
    required this.onTap,
  });

  final EncounterChoice choice;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Text(choice.icon, style: const TextStyle(fontSize: 20)),
            const Gap(12),
            Expanded(
              child: Text(
                choice.label,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: AppColors.surfaceVariant,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                choice.primaryStat.toUpperCase(),
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    )
        .animate(delay: Duration(milliseconds: 100 * index))
        .slideX(begin: 0.3)
        .fadeIn();
  }
}

// ── Resolving View ────────────────────────────────────────────────────────────

class _ResolvingView extends StatelessWidget {
  const _ResolvingView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(color: AppColors.accent),
          const Gap(16),
          Text(
            'Calculating...',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

// ── Outcome View ──────────────────────────────────────────────────────────────

class _OutcomeView extends StatelessWidget {
  const _OutcomeView({required this.result, required this.onDismiss});

  final EncounterResult result;
  final VoidCallback onDismiss;

  Color _outcomeColor() => switch (result.outcome) {
        EncounterOutcome.criticalSuccess => AppColors.secondary,
        EncounterOutcome.success => AppColors.primary,
        EncounterOutcome.partial => AppColors.xp,
        EncounterOutcome.failure || EncounterOutcome.criticalFailure => AppColors.hp,
      };

  @override
  Widget build(BuildContext context) {
    final color = _outcomeColor();

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),

          // Outcome emoji
          Text(
            result.outcome.emoji,
            style: const TextStyle(fontSize: 72),
            textAlign: TextAlign.center,
          ).animate().scale(begin: const Offset(0, 0), duration: 500.ms, curve: Curves.elasticOut),

          const Gap(16),

          // Outcome label
          Text(
            result.outcome.label,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: color,
                  letterSpacing: 3,
                  fontSize: 22,
                ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(delay: 200.ms),

          const Gap(16),

          // Description
          Text(
            result.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(delay: 400.ms),

          const Gap(32),

          // Rewards / penalties
          _RewardRow(result: result).animate().fadeIn(delay: 600.ms),

          const Spacer(),

          ElevatedButton(
            onPressed: onDismiss,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: color.withValues(alpha: 0.15),
              foregroundColor: color,
              side: BorderSide(color: color.withValues(alpha: 0.5)),
            ),
            child: const Text(
              'CONTINUE',
              style: TextStyle(letterSpacing: 2),
            ),
          ).animate().fadeIn(delay: 800.ms),
        ],
      ),
    );
  }
}

class _RewardRow extends StatelessWidget {
  const _RewardRow({required this.result});

  final EncounterResult result;

  @override
  Widget build(BuildContext context) {
    final chips = <Widget>[];

    if (result.hpChange > 0) {
      chips.add(_RewardChip(label: '+${result.hpChange} HP', color: AppColors.hp));
    } else if (result.hpChange < 0) {
      chips.add(_RewardChip(label: '${result.hpChange} HP', color: AppColors.hp));
    }
    if (result.epGain > 0) {
      chips.add(_RewardChip(label: '+${result.epGain} EP', color: AppColors.xp));
    }
    if (result.foodGain > 0) {
      chips.add(_RewardChip(label: '+${result.foodGain} 🌿', color: AppColors.secondary));
    }

    if (chips.isEmpty) {
      chips.add(const _RewardChip(label: 'No rewards', color: AppColors.textDisabled));
    }

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: chips,
    );
  }
}

class _RewardChip extends StatelessWidget {
  const _RewardChip({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

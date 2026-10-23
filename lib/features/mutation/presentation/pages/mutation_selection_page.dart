import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../creature/presentation/states/creature_state.dart';
import '../../../creature/presentation/viewmodels/creature_viewmodel.dart';
import '../../domain/entities/mutation.dart';
import '../states/mutation_state.dart';
import '../viewmodels/mutation_viewmodel.dart';
import '../widgets/mutation_card.dart';

/// Full-screen mutation draft overlay (Slay the Spire style).
/// Shown at generation start and at milestone intervals.
class MutationSelectionPage extends ConsumerStatefulWidget {
  const MutationSelectionPage({
    super.key,
    required this.onMutationSelected,
    this.isGenerationStart = true,
  });

  /// Called when the player picks a mutation and it has been applied.
  final VoidCallback onMutationSelected;
  final bool isGenerationStart;

  @override
  ConsumerState<MutationSelectionPage> createState() =>
      _MutationSelectionPageState();
}

class _MutationSelectionPageState
    extends ConsumerState<MutationSelectionPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _draw());
  }

  Future<void> _draw() async {
    final creature = ref.read(creatureProvider);
    if (creature is! CreatureStateAlive) return;
    await ref
        .read(mutationProvider.notifier)
        .drawOptions(creature.creature);
  }

  @override
  Widget build(BuildContext context) {
    final mutState = ref.watch(mutationProvider);
    final creature = ref.watch(creatureProvider);

    // Navigate away when mutation is done
    ref.listen(mutationProvider, (prev, next) {
      if (next is MutationStateDone) {
        widget.onMutationSelected();
        ref.read(mutationProvider.notifier).reset();
      }
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _Header(isGenerationStart: widget.isGenerationStart),
            const Gap(8),
            if (creature is CreatureStateAlive)
              _GenerationBadge(
                generation: creature.creature.generation,
              ),
            const Gap(24),
            Expanded(
              child: switch (mutState) {
                MutationStateDrawing() || MutationStateIdle() => const Center(
                    child: CircularProgressIndicator(color: AppColors.accent),
                  ),
                MutationStateSelecting(:final options) =>
                  _CardRow(options: options, onSelect: _onSelect),
                MutationStateApplying() => const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(color: AppColors.accent),
                        Gap(16),
                        Text('Applying mutation...',
                            style: TextStyle(color: AppColors.textSecondary)),
                      ],
                    ),
                  ),
                MutationStateError(:final message) => Center(
                    child: Text(message,
                        style: const TextStyle(color: AppColors.hp)),
                  ),
                MutationStateDone() => const SizedBox.shrink(),
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onSelect(Mutation mutation) {
    final creature = ref.read(creatureProvider);
    if (creature is! CreatureStateAlive) return;
    ref
        .read(mutationProvider.notifier)
        .applyMutation(creature.creature, mutation);
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.isGenerationStart});

  final bool isGenerationStart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      child: Column(
        children: [
          Text(
            isGenerationStart ? 'CHOOSE YOUR MUTATION' : 'EVOLUTION MILESTONE',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: AppColors.accent,
                  letterSpacing: 3,
                  fontSize: 20,
                ),
          ).animate().fadeIn(duration: 400.ms),
          const Gap(6),
          Text(
            isGenerationStart
                ? 'Select one mutation to begin your generation'
                : 'A new adaptation is available',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ).animate().fadeIn(delay: 200.ms),
        ],
      ),
    );
  }
}

class _GenerationBadge extends StatelessWidget {
  const _GenerationBadge({required this.generation});

  final int generation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        'GENERATION $generation',
        style: const TextStyle(
          color: AppColors.primary,
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
    );
  }
}

class _CardRow extends StatelessWidget {
  const _CardRow({required this.options, required this.onSelect});

  final List<Mutation> options;
  final void Function(Mutation) onSelect;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: options
            .asMap()
            .entries
            .map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: MutationCard(
                  mutation: e.value,
                  index: e.key,
                  onSelected: () => onSelect(e.value),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

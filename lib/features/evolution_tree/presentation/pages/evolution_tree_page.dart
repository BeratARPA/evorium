import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../app/theme/app_colors.dart';
import '../../domain/entities/evolution_node.dart';
import '../../domain/usecases/unlock_evolution_node_use_case.dart';
import '../viewmodels/evolution_tree_notifier.dart';

class EvolutionTreePage extends ConsumerWidget {
  const EvolutionTreePage({super.key});

  static const _categoryIcons = {
    'Genetics': '🧬',
    'Vitality': '❤️',
    'Combat': '⚔️',
    'Resources': '🌿',
    'Evolution': '⚡',
  };

  static const _categoryColors = {
    'Genetics': AppColors.accent,
    'Vitality': AppColors.hp,
    'Combat': Color(0xFFFF6D00),
    'Resources': AppColors.secondary,
    'Evolution': AppColors.xp,
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(evolutionTreeProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _Header(epBalance: state.epBalance),
            Expanded(
              child: state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(color: AppColors.primary),
                    )
                  : _TreeContent(
                      state: state,
                      categoryIcons: _categoryIcons,
                      categoryColors: _categoryColors,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Header ─────────────────────────────────────────────────────────────────

class _Header extends StatelessWidget {
  const _Header({required this.epBalance});

  final int epBalance;

  @override
  Widget build(BuildContext context) {
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
            'EVOLUTION TREE',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.xp.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.xp.withValues(alpha: 0.4)),
            ),
            child: Row(
              children: [
                const Text('⚡', style: TextStyle(fontSize: 14)),
                const Gap(4),
                Text(
                  '$epBalance EP',
                  style: const TextStyle(
                    color: AppColors.xp,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Tree Content ────────────────────────────────────────────────────────────

class _TreeContent extends ConsumerWidget {
  const _TreeContent({
    required this.state,
    required this.categoryIcons,
    required this.categoryColors,
  });

  final EvolutionTreeState state;
  final Map<String, String> categoryIcons;
  final Map<String, Color> categoryColors;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: state.categories.length,
      itemBuilder: (context, index) {
        final category = state.categories[index];
        final nodes = state.nodesForCategory(category);
        final color = categoryColors[category] ?? AppColors.primary;
        final icon = categoryIcons[category] ?? '🔬';

        return _CategorySection(
          category: category,
          icon: icon,
          color: color,
          nodes: nodes,
          state: state,
        ).animate().fadeIn(delay: (index * 80).ms);
      },
    );
  }
}

// ── Category Section ────────────────────────────────────────────────────────

class _CategorySection extends ConsumerWidget {
  const _CategorySection({
    required this.category,
    required this.icon,
    required this.color,
    required this.nodes,
    required this.state,
  });

  final String category;
  final String icon;
  final Color color;
  final List<EvolutionNode> nodes;
  final EvolutionTreeState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unlockedCount = nodes.where((n) => n.isUnlocked).length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category header
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              Text(icon, style: const TextStyle(fontSize: 18)),
              const Gap(8),
              Text(
                category.toUpperCase(),
                style: TextStyle(
                  color: color,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const Spacer(),
              Text(
                '$unlockedCount / ${nodes.length}',
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
        // Nodes
        ...nodes.asMap().entries.map((entry) {
          final i = entry.key;
          final node = entry.value;
          final canUnlock = state.canUnlock(node);
          final isLast = i == nodes.length - 1;

          return Column(
            children: [
              _NodeCard(
                node: node,
                color: color,
                canUnlock: canUnlock,
                onUnlock: () => _onUnlock(context, ref, node),
              ),
              if (!isLast) _ConnectorLine(color: color),
            ],
          );
        }),
        const Gap(8),
        const Divider(color: AppColors.border, height: 1),
        const Gap(8),
      ],
    );
  }

  Future<void> _onUnlock(
    BuildContext context,
    WidgetRef ref,
    EvolutionNode node,
  ) async {
    final result =
        await ref.read(evolutionTreeProvider.notifier).unlock(node);
    if (!context.mounted) return;

    if (result is UnlockNodeSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${node.name} unlocked!'),
          backgroundColor: color,
          duration: const Duration(seconds: 2),
        ),
      );
    } else if (result is UnlockNodeFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result.reason),
          backgroundColor: AppColors.hp,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}

// ── Node Card ───────────────────────────────────────────────────────────────

class _NodeCard extends StatelessWidget {
  const _NodeCard({
    required this.node,
    required this.color,
    required this.canUnlock,
    required this.onUnlock,
  });

  final EvolutionNode node;
  final Color color;
  final bool canUnlock;
  final VoidCallback onUnlock;

  @override
  Widget build(BuildContext context) {
    final isUnlocked = node.isUnlocked;
    final borderColor = isUnlocked
        ? color.withValues(alpha: 0.6)
        : canUnlock
            ? color.withValues(alpha: 0.3)
            : AppColors.border;
    final bgColor = isUnlocked
        ? color.withValues(alpha: 0.08)
        : AppColors.surface;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          // Bonus icon + unlock indicator
          Column(
            children: [
              Text(node.bonus.icon, style: const TextStyle(fontSize: 22)),
              const Gap(4),
              _UnlockIndicator(isUnlocked: isUnlocked, canUnlock: canUnlock, color: color),
            ],
          ),
          const Gap(12),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      node.name,
                      style: TextStyle(
                        color: isUnlocked ? color : AppColors.textPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    const Spacer(),
                    _CostBadge(epCost: node.epCost, isUnlocked: isUnlocked),
                  ],
                ),
                const Gap(4),
                Text(
                  node.description,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 11,
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Gap(6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    node.bonus.displayText,
                    style: TextStyle(
                      color: color,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (node.requiredNodeIds.isNotEmpty && !isUnlocked) ...[
                  const Gap(4),
                  Text(
                    'Requires: ${node.requiredNodeIds.join(", ").replaceAll("_", " ")}',
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
          if (!isUnlocked && canUnlock) ...[
            const Gap(8),
            GestureDetector(
              onTap: onUnlock,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: color.withValues(alpha: 0.6)),
                ),
                child: Text(
                  'UNLOCK',
                  style: TextStyle(
                    color: color,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _UnlockIndicator extends StatelessWidget {
  const _UnlockIndicator({
    required this.isUnlocked,
    required this.canUnlock,
    required this.color,
  });

  final bool isUnlocked;
  final bool canUnlock;
  final Color color;

  @override
  Widget build(BuildContext context) {
    if (isUnlocked) {
      return Icon(Icons.check_circle, color: color, size: 14);
    }
    if (canUnlock) {
      return Icon(Icons.lock_open, color: color.withValues(alpha: 0.6), size: 14);
    }
    return const Icon(Icons.lock, color: AppColors.textDisabled, size: 14);
  }
}

class _CostBadge extends StatelessWidget {
  const _CostBadge({required this.epCost, required this.isUnlocked});

  final int epCost;
  final bool isUnlocked;

  @override
  Widget build(BuildContext context) {
    if (isUnlocked) {
      return const Text(
        'UNLOCKED',
        style: TextStyle(
          color: AppColors.secondary,
          fontSize: 9,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      );
    }
    return Text(
      '$epCost EP',
      style: const TextStyle(
        color: AppColors.xp,
        fontSize: 11,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _ConnectorLine extends StatelessWidget {
  const _ConnectorLine({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Gap(22),
        Container(
          width: 2,
          height: 20,
          color: color.withValues(alpha: 0.3),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/domain/enums/resource_type.dart';
import '../../../creature/presentation/states/creature_state.dart';
import '../../../creature/presentation/viewmodels/creature_viewmodel.dart';
import '../../../resource/domain/entities/resource_node.dart';
import '../../../resource/presentation/viewmodels/resource_viewmodel.dart';
import '../states/game_shell_state.dart';
import '../viewmodels/game_shell_viewmodel.dart';

/// Renders interactive resource nodes in the game area.
/// Each node is a tappable glowing orb; depleted nodes show a countdown.
class ResourceNodesOverlay extends ConsumerWidget {
  const ResourceNodesOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nodes = ref.watch(resourceProvider.select((s) => s.nodes));
    final phase = ref.watch(gameShellProvider.select((s) => s.phase));

    if (nodes.isEmpty || phase != GamePhase.playing) {
      return const SizedBox.shrink();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            for (var i = 0; i < nodes.length; i++)
              _NodeWidget(
                node: nodes[i],
                index: i,
                constraints: constraints,
              ).animate(delay: Duration(milliseconds: 100 * i)).fadeIn(
                    duration: 500.ms,
                  ),
          ],
        );
      },
    );
  }
}

class _NodeWidget extends ConsumerWidget {
  const _NodeWidget({
    required this.node,
    required this.index,
    required this.constraints,
  });

  final ResourceNode node;
  final int index;
  final BoxConstraints constraints;

  static const _nodeRadius = 22.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final x = node.relativePos.dx * constraints.maxWidth - _nodeRadius;
    final y = node.relativePos.dy * constraints.maxHeight - _nodeRadius;

    final color = _colorFor(node.type);
    final emoji = node.type.icon;
    final available = node.isAvailable;

    return Positioned(
      left: x,
      top: y,
      child: GestureDetector(
        onTap: available
            ? () {
                final cs = ref.read(creatureProvider);
                final speed =
                    cs is CreatureStateAlive ? cs.creature.stats.spd : 5;
                ref.read(resourceProvider.notifier).gatherNode(index, speed);
              }
            : null,
        child: SizedBox(
          width: _nodeRadius * 2,
          height: _nodeRadius * 2,
          child: available
              ? _AvailableNode(color: color, emoji: emoji)
              : _DepletedNode(color: color, cooldown: node.cooldownTicks),
        ),
      ),
    );
  }

  Color _colorFor(ResourceType type) => switch (type) {
        ResourceType.food => AppColors.secondary,
        ResourceType.minerals => const Color(0xFF8B8080),
        ResourceType.biochemical => const Color(0xFFB04DF5),
        ResourceType.energy => AppColors.energy,
        ResourceType.evolutionaryPoints => AppColors.accent,
      };
}

class _AvailableNode extends StatelessWidget {
  const _AvailableNode({required this.color, required this.emoji});

  final Color color;
  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withValues(alpha: 0.15),
        border: Border.all(color: color.withValues(alpha: 0.6), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.3),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Center(
        child: Text(emoji, style: const TextStyle(fontSize: 14)),
      ),
    )
        .animate(onPlay: (c) => c.repeat(reverse: true))
        .scaleXY(end: 1.08, duration: 1200.ms, curve: Curves.easeInOut);
  }
}

class _DepletedNode extends StatelessWidget {
  const _DepletedNode({required this.color, required this.cooldown});

  final Color color;
  final int cooldown;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.surfaceVariant.withValues(alpha: 0.4),
        border: Border.all(
          color: color.withValues(alpha: 0.15),
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          '$cooldown',
          style: TextStyle(
            color: color.withValues(alpha: 0.4),
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

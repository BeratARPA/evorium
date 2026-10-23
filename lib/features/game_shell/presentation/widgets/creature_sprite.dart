import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/domain/enums/evolution_stage.dart';
import '../../../creature/domain/entities/creature.dart';
import '../../../creature/presentation/states/creature_state.dart';
import '../../../creature/presentation/viewmodels/creature_viewmodel.dart';

/// Renders the player's creature using CustomPainter.
/// Phase 1: simple shape-based rendering driven by stage + traits.
class CreatureSprite extends ConsumerWidget {
  const CreatureSprite({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final creatureState = ref.watch(creatureProvider);

    if (creatureState is! CreatureStateAlive) {
      return const SizedBox.shrink();
    }

    return Center(
      child: _AnimatedCreature(creature: creatureState.creature),
    );
  }
}

class _AnimatedCreature extends StatelessWidget {
  const _AnimatedCreature({required this.creature});

  final Creature creature;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: CustomPaint(
        painter: _CreaturePainter(creature: creature),
      ),
    )
        .animate(onPlay: (c) => c.repeat(reverse: true))
        .scaleXY(
          begin: 1.0,
          end: 1.04,
          duration: const Duration(milliseconds: 1200),
          curve: Curves.easeInOut,
        );
  }
}

class _CreaturePainter extends CustomPainter {
  const _CreaturePainter({required this.creature});

  final Creature creature;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final bodyRadius = _bodyRadius(size);
    final bodyColor = _bodyColor();

    final bodyPaint = Paint()
      ..color = bodyColor
      ..style = PaintingStyle.fill;

    final glowPaint = Paint()
      ..color = bodyColor.withValues(alpha: 0.15)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20)
      ..style = PaintingStyle.fill;

    final outlinePaint = Paint()
      ..color = bodyColor.withValues(alpha: 0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    // Draw glow
    canvas.drawCircle(center, bodyRadius + 12, glowPaint);

    // Draw body shape based on stage
    _drawBody(canvas, center, bodyRadius, bodyPaint, outlinePaint);

    // Draw HP indicator ring
    _drawHpRing(canvas, center, bodyRadius + 6, size);
  }

  void _drawBody(
    Canvas canvas,
    Offset center,
    double radius,
    Paint fill,
    Paint outline,
  ) {
    switch (creature.stage) {
      case EvolutionStage.cellular:
        // Blob shape
        canvas.drawCircle(center, radius, fill);
        canvas.drawCircle(center, radius, outline);
        // Nucleus
        final nucleusPaint = Paint()
          ..color = fill.color.withValues(alpha: 0.6)
          ..style = PaintingStyle.fill;
        canvas.drawCircle(center, radius * 0.35, nucleusPaint);
      case EvolutionStage.multicellular:
        // Segmented oval
        final rect = Rect.fromCenter(
          center: center,
          width: radius * 2.2,
          height: radius * 1.6,
        );
        canvas.drawOval(rect, fill);
        canvas.drawOval(rect, outline);
      case EvolutionStage.landTransition ||
            EvolutionStage.social ||
            EvolutionStage.dominantSpecies:
        // More complex shape (placeholder)
        canvas.drawCircle(center, radius, fill);
        canvas.drawCircle(center, radius, outline);
    }
  }

  void _drawHpRing(Canvas canvas, Offset center, double radius, Size size) {
    final hpPercent = creature.stats.hpPercent;
    final trackPaint = Paint()
      ..color = AppColors.surfaceVariant
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    final hpPaint = Paint()
      ..color = _hpColor(hpPercent)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    const startAngle = -1.5708; // -90 degrees
    const sweepFull = 6.2832; // 2*pi

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepFull,
      false,
      trackPaint,
    );
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepFull * hpPercent,
      false,
      hpPaint,
    );
  }

  Color _bodyColor() {
    if (creature.isLowHp) return AppColors.hp;
    return switch (creature.stage) {
      EvolutionStage.cellular => AppColors.secondary,
      EvolutionStage.multicellular => AppColors.primary,
      EvolutionStage.landTransition => const Color(0xFF76FF03),
      EvolutionStage.social => AppColors.accent,
      EvolutionStage.dominantSpecies => AppColors.rarityLegendary,
    };
  }

  double _bodyRadius(Size size) => switch (creature.stage) {
        EvolutionStage.cellular => size.width * 0.25,
        EvolutionStage.multicellular => size.width * 0.30,
        EvolutionStage.landTransition => size.width * 0.35,
        EvolutionStage.social => size.width * 0.38,
        EvolutionStage.dominantSpecies => size.width * 0.42,
      };

  Color _hpColor(double percent) {
    if (percent > 0.6) return AppColors.secondary;
    if (percent > 0.3) return AppColors.xp;
    return AppColors.hp;
  }

  @override
  bool shouldRepaint(_CreaturePainter old) =>
      old.creature != creature;
}

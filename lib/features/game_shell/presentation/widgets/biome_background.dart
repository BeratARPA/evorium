import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/domain/enums/biome_type.dart';
import '../../../biome/presentation/states/biome_state.dart';
import '../../../biome/presentation/viewmodels/biome_viewmodel.dart';

/// Animated parallax biome background.
/// Three scrolling particle layers + gradient; reacts to day/night state.
class BiomeBackground extends ConsumerStatefulWidget {
  const BiomeBackground({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<BiomeBackground> createState() => _BiomeBackgroundState();
}

class _BiomeBackgroundState extends ConsumerState<BiomeBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final biomeState = ref.watch(biomeProvider);

    final biomeType = biomeState is BiomeStateLoaded
        ? biomeState.biome.type
        : BiomeType.primordialSoup;
    final isNight =
        biomeState is BiomeStateLoaded && biomeState.biome.condition.isNight;

    final (topColor, bottomColor) = _resolveGradient(biomeType, isNight);

    return Stack(
      children: [
        // Gradient background — animates smoothly on biome/day-night changes
        AnimatedContainer(
          duration: const Duration(seconds: 4),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [topColor, bottomColor],
            ),
          ),
        ),

        // Animated parallax particle layers
        Positioned.fill(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) => CustomPaint(
              painter: _ParallaxPainter(
                biomeType: biomeType,
                progress: _controller.value,
                isNight: isNight,
              ),
            ),
          ),
        ),

        // Content on top
        widget.child,
      ],
    );
  }

  (Color, Color) _resolveGradient(BiomeType type, bool isNight) {
    final (day, night) = _gradientPair(type);
    return isNight ? night : day;
  }

  ((Color, Color), (Color, Color)) _gradientPair(BiomeType type) =>
      switch (type) {
        BiomeType.primordialSoup => (
            (const Color(0xFF0A1520), const Color(0xFF0D2B1E)),
            (const Color(0xFF050C14), const Color(0xFF071A12)),
          ),
        BiomeType.thermalVents => (
            (const Color(0xFF1A0500), const Color(0xFF2D0E00)),
            (const Color(0xFF0D0300), const Color(0xFF1A0800)),
          ),
        BiomeType.frozenSubsurface => (
            (const Color(0xFF050D1E), const Color(0xFF0A1530)),
            (const Color(0xFF030810), const Color(0xFF060D1E)),
          ),
        BiomeType.shallowSea => (
            (const Color(0xFF001A33), const Color(0xFF00334D)),
            (const Color(0xFF000D1A), const Color(0xFF001A28)),
          ),
        BiomeType.coralReef => (
            (const Color(0xFF001F40), const Color(0xFF003D2B)),
            (const Color(0xFF000F20), const Color(0xFF001E15)),
          ),
        BiomeType.deepOcean => (
            (const Color(0xFF000510), const Color(0xFF000D1A)),
            (const Color(0xFF000208), const Color(0xFF00060D)),
          ),
        BiomeType.coastalWetland => (
            (const Color(0xFF071A10), const Color(0xFF0F2D1A)),
            (const Color(0xFF030D08), const Color(0xFF07160D)),
          ),
        BiomeType.rainforest => (
            (const Color(0xFF051A08), const Color(0xFF082B0D)),
            (const Color(0xFF030D04), const Color(0xFF041507)),
          ),
        BiomeType.aridScrublands => (
            (const Color(0xFF1A1000), const Color(0xFF2D1E00)),
            (const Color(0xFF0D0800), const Color(0xFF160F00)),
          ),
        BiomeType.volcanicTerrain => (
            (const Color(0xFF1A0500), const Color(0xFF0D0000)),
            (const Color(0xFF0D0300), const Color(0xFF070000)),
          ),
        BiomeType.iceAgeTundra => (
            (const Color(0xFF050D1A), const Color(0xFF0A1522)),
            (const Color(0xFF02060D), const Color(0xFF050A10)),
          ),
      };
}

// ── Parallax Painter ──────────────────────────────────────────────────────────

class _ParallaxPainter extends CustomPainter {
  _ParallaxPainter({
    required this.biomeType,
    required this.progress,
    required this.isNight,
  });

  final BiomeType biomeType;
  final double progress;
  final bool isNight;

  @override
  void paint(Canvas canvas, Size size) {
    final color = _particleColor(biomeType);
    final rng = Random(biomeType.index * 42);

    // Far layer: tiny, very slow
    _drawLayer(canvas, size, rng, color,
        speedFraction: 0.15, count: 20, maxRadius: 1.2, maxOpacity: 0.12);
    // Mid layer: medium speed
    _drawLayer(canvas, size, rng, color,
        speedFraction: 0.40, count: 15, maxRadius: 2.0, maxOpacity: 0.18);
    // Near layer: fast, larger
    _drawLayer(canvas, size, rng, color,
        speedFraction: 0.80, count: 8, maxRadius: 3.5, maxOpacity: 0.28);
  }

  void _drawLayer(
    Canvas canvas,
    Size size,
    Random rng,
    Color color, {
    required double speedFraction,
    required int count,
    required double maxRadius,
    required double maxOpacity,
  }) {
    final paint = Paint()..style = PaintingStyle.fill;
    final shift = (progress * speedFraction * size.width) % size.width;

    for (var i = 0; i < count; i++) {
      final baseX = rng.nextDouble() * size.width;
      final y = rng.nextDouble() * size.height;
      final radius = rng.nextDouble() * maxRadius + 0.4;
      final opacity = rng.nextDouble() * maxOpacity + 0.03;

      final x = (baseX + shift) % size.width;
      final effectiveOpacity = isNight ? opacity * 0.5 : opacity;
      paint.color = color.withValues(alpha: effectiveOpacity);
      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  Color _particleColor(BiomeType type) => switch (type) {
        BiomeType.primordialSoup => AppColors.secondary,
        BiomeType.thermalVents => Colors.orange,
        BiomeType.frozenSubsurface => Colors.lightBlue,
        BiomeType.shallowSea ||
        BiomeType.coralReef ||
        BiomeType.deepOcean =>
          AppColors.primary,
        BiomeType.coastalWetland || BiomeType.rainforest => AppColors.secondary,
        BiomeType.aridScrublands => Colors.amber,
        BiomeType.volcanicTerrain => Colors.red,
        BiomeType.iceAgeTundra => Colors.white,
      };

  @override
  bool shouldRepaint(_ParallaxPainter old) =>
      old.progress != progress ||
      old.biomeType != biomeType ||
      old.isNight != isNight;
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../app/router/app_router.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/storage/storage_keys.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key});

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  bool _hasSave = false;

  @override
  void initState() {
    super.initState();
    _checkSave();
  }

  void _checkSave() {
    final box = Hive.box<String>(StorageKeys.creatureBox);
    setState(() {
      _hasSave = box.containsKey(
        '${StorageKeys.activeCreaturePrefix}slot_0',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          const Positioned.fill(child: _MenuBackground()),
          SafeArea(
            child: Column(
              children: [
                const Spacer(flex: 2),
                _buildTitle(context),
                const Spacer(flex: 3),
                _buildButtons(context),
                const Spacer(flex: 2),
                _buildVersion(context),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'EVORIUM',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: AppColors.primary,
                letterSpacing: 10,
                fontWeight: FontWeight.w900,
              ),
        )
            .animate()
            .fadeIn(duration: 800.ms)
            .shimmer(duration: 2500.ms, color: AppColors.primaryGlow),
        const SizedBox(height: 8),
        Text(
          'EVOLVE · ADAPT · SURVIVE',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.textSecondary,
                letterSpacing: 4,
                fontSize: 10,
              ),
        ).animate().fadeIn(delay: 400.ms, duration: 600.ms),
      ],
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _MenuButton(
            label: 'NEW GAME',
            icon: '🧬',
            color: AppColors.primary,
            onTap: () => context.go(
              AppRoutes.gameShell,
              extra: {'isNewGame': true},
            ),
          )
              .animate()
              .fadeIn(delay: 600.ms, duration: 400.ms)
              .slideY(begin: 0.3, end: 0),
          const SizedBox(height: 12),
          _MenuButton(
            label: 'CONTINUE',
            icon: '▶',
            color: _hasSave ? AppColors.secondary : AppColors.textDisabled,
            enabled: _hasSave,
            onTap: () => context.go(
              AppRoutes.gameShell,
              extra: {'isNewGame': false},
            ),
          )
              .animate()
              .fadeIn(delay: 700.ms, duration: 400.ms)
              .slideY(begin: 0.3, end: 0),
          const SizedBox(height: 12),
          _MenuButton(
            label: 'SETTINGS',
            icon: '⚙',
            color: AppColors.textSecondary,
            onTap: () => context.push(AppRoutes.settings),
          )
              .animate()
              .fadeIn(delay: 800.ms, duration: 400.ms)
              .slideY(begin: 0.3, end: 0),
          const SizedBox(height: 12),
          _MenuButton(
            label: 'EVOLUTION TREE',
            icon: '🌿',
            color: AppColors.xp,
            onTap: () => context.push(AppRoutes.evolutionTree),
          )
              .animate()
              .fadeIn(delay: 900.ms, duration: 400.ms)
              .slideY(begin: 0.3, end: 0),
          const SizedBox(height: 12),
          _MenuButton(
            label: 'ACHIEVEMENTS',
            icon: '🏆',
            color: AppColors.accent,
            onTap: () => context.push(AppRoutes.achievements),
          )
              .animate()
              .fadeIn(delay: 1000.ms, duration: 400.ms)
              .slideY(begin: 0.3, end: 0),
        ],
      ),
    );
  }

  Widget _buildVersion(BuildContext context) {
    return Text(
      'v0.1.0-alpha',
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: AppColors.textDisabled,
            fontSize: 9,
            letterSpacing: 1,
          ),
    ).animate().fadeIn(delay: 1000.ms);
  }
}

// ── Menu Button ───────────────────────────────────────────────────────────────

class _MenuButton extends StatelessWidget {
  const _MenuButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
    this.enabled = true,
  });

  final String label;
  final String icon;
  final Color color;
  final VoidCallback onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: enabled
              ? color.withValues(alpha: 0.08)
              : AppColors.surfaceVariant.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: color.withValues(alpha: enabled ? 0.5 : 0.15),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Text(icon, style: const TextStyle(fontSize: 18)),
            const SizedBox(width: 16),
            Text(
              label,
              style: TextStyle(
                color: enabled ? color : AppColors.textDisabled,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Animated Background ───────────────────────────────────────────────────────

class _MenuBackground extends StatefulWidget {
  const _MenuBackground();

  @override
  State<_MenuBackground> createState() => _MenuBackgroundState();
}

class _MenuBackgroundState extends State<_MenuBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) => CustomPaint(
        size: Size.infinite,
        painter: _ParticlePainter(_controller.value),
      ),
    );
  }
}

class _ParticlePainter extends CustomPainter {
  const _ParticlePainter(this.progress);

  final double progress;

  // Deterministic particle positions: (x, y, speedFactor, colorVariant, size)
  static const _particles = [
    (0.05, 0.10, 0.20, 0, 1.5),
    (0.15, 0.25, 0.28, 1, 1.0),
    (0.30, 0.08, 0.16, 2, 2.0),
    (0.45, 0.18, 0.22, 0, 1.0),
    (0.60, 0.05, 0.30, 1, 1.5),
    (0.75, 0.22, 0.18, 2, 1.0),
    (0.88, 0.12, 0.24, 0, 2.0),
    (0.92, 0.30, 0.14, 1, 1.0),
    (0.12, 0.45, 0.26, 2, 1.5),
    (0.28, 0.55, 0.20, 0, 1.0),
    (0.50, 0.42, 0.32, 1, 2.0),
    (0.68, 0.50, 0.18, 2, 1.0),
    (0.82, 0.60, 0.22, 0, 1.5),
    (0.95, 0.48, 0.16, 1, 1.0),
    (0.08, 0.70, 0.28, 2, 2.0),
    (0.22, 0.78, 0.20, 0, 1.0),
    (0.38, 0.65, 0.24, 1, 1.5),
    (0.55, 0.75, 0.18, 2, 1.0),
    (0.72, 0.80, 0.30, 0, 2.0),
    (0.85, 0.72, 0.22, 1, 1.0),
    (0.18, 0.90, 0.16, 2, 1.5),
    (0.42, 0.88, 0.26, 0, 1.0),
    (0.65, 0.92, 0.20, 1, 2.0),
    (0.78, 0.85, 0.14, 2, 1.0),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (final p in _particles) {
      final (sx, sy, speed, colorVariant, radius) = p;
      final y = (sy + progress * speed) % 1.0;
      final opacity = 0.25 + (colorVariant * 0.1);
      final color = switch (colorVariant) {
        0 => AppColors.primary.withValues(alpha: opacity),
        1 => AppColors.secondary.withValues(alpha: opacity * 0.6),
        _ => AppColors.accent.withValues(alpha: opacity * 0.5),
      };
      paint.color = color;
      canvas.drawCircle(
        Offset(sx * size.width, y * size.height),
        radius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_ParticlePainter old) => old.progress != progress;
}

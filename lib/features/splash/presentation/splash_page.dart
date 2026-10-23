import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/app_router.dart';
import '../../../app/theme/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2600), () {
      if (mounted) context.go(AppRoutes.mainMenu);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Animated logo
            _AnimatedLogo(),
            const SizedBox(height: 24),
            // Tagline
            const Text(
              'EVOLVE · ADAPT · SURVIVE',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 10,
                letterSpacing: 4,
              ),
            )
                .animate()
                .fadeIn(delay: 1200.ms, duration: 600.ms),
            const SizedBox(height: 48),
            // Loading indicator
            const SizedBox(
              width: 120,
              child: LinearProgressIndicator(
                backgroundColor: AppColors.border,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            )
                .animate()
                .fadeIn(delay: 1600.ms, duration: 400.ms),
          ],
        ),
      ),
    );
  }
}

class _AnimatedLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Animated hexagon rings (CSS-like concentric circles)
        SizedBox(
          width: 120,
          height: 120,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Outer ring
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.2),
                    width: 1,
                  ),
                ),
              )
                  .animate(onPlay: (c) => c.repeat())
                  .scaleXY(begin: 0.85, end: 1.15, duration: 2000.ms)
                  .then()
                  .scaleXY(begin: 1.15, end: 0.85, duration: 2000.ms),

              // Middle ring
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.4),
                    width: 1.5,
                  ),
                ),
              )
                  .animate(onPlay: (c) => c.repeat())
                  .scaleXY(begin: 1.05, end: 0.9, duration: 1800.ms)
                  .then()
                  .scaleXY(begin: 0.9, end: 1.05, duration: 1800.ms),

              // Core glow
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary.withValues(alpha: 0.1),
                  border: Border.all(color: AppColors.primary, width: 2),
                ),
              )
                  .animate(onPlay: (c) => c.repeat())
                  .custom(
                    duration: 1500.ms,
                    builder: (_, value, child) => Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary.withValues(alpha: 0.05 + value * 0.1),
                        border: Border.all(color: AppColors.primary, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.3 + value * 0.3),
                            blurRadius: 20 + value * 10,
                            spreadRadius: value * 5,
                          ),
                        ],
                      ),
                      child: child,
                    ),
                  ),

              // DNA icon in center
              const Text(
                '🧬',
                style: TextStyle(fontSize: 24),
              ).animate().fadeIn(delay: 400.ms, duration: 600.ms),
            ],
          ),
        )
            .animate()
            .fadeIn(duration: 800.ms)
            .scale(
              begin: const Offset(0.7, 0.7),
              end: const Offset(1.0, 1.0),
              duration: 800.ms,
              curve: Curves.easeOutBack,
            ),

        const SizedBox(height: 20),

        // Title
        const Text(
          'EVORIUM',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 36,
            fontWeight: FontWeight.w900,
            letterSpacing: 10,
          ),
        )
            .animate()
            .fadeIn(delay: 600.ms, duration: 600.ms)
            .shimmer(delay: 800.ms, duration: 2000.ms, color: AppColors.primaryGlow),
      ],
    );
  }
}

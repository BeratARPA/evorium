import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

import '../../../app/di/injection.dart';
import '../../../app/theme/app_colors.dart';
import '../domain/tutorial_service.dart';

/// Shows a tutorial hint dialog if the user hasn't seen it yet.
/// Call this from any page's initState / postFrameCallback.
Future<void> showTutorialHintIfNeeded(
  BuildContext context,
  TutorialHint hint,
) async {
  final service = sl<TutorialService>();
  if (service.hasSeen(hint)) return;
  if (!context.mounted) return;

  await showDialog<void>(
    context: context,
    barrierColor: AppColors.background.withValues(alpha: 0.75),
    builder: (_) => _TutorialHintDialog(hint: hint),
  );
  await service.markSeen(hint);
}

class _TutorialHintDialog extends StatelessWidget {
  const _TutorialHintDialog({required this.hint});

  final TutorialHint hint;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.4)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              TutorialService.iconFor(hint),
              style: const TextStyle(fontSize: 40),
            ),
            const Gap(12),
            Text(
              TutorialService.titleFor(hint).toUpperCase(),
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 14,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(12),
            Text(
              TutorialService.bodyFor(hint),
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 13,
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('GOT IT'),
              ),
            ),
          ],
        ),
      )
          .animate()
          .fadeIn(duration: 250.ms)
          .scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1), duration: 250.ms),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../app/di/injection.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/storage/storage_keys.dart';
import '../../../tutorial/domain/tutorial_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _difficulty = 'normal';
  bool _haptics = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    final box = Hive.box<String>(StorageKeys.settingsBox);
    setState(() {
      _difficulty =
          box.get(StorageKeys.settingsDifficulty, defaultValue: 'normal')!;
      final hapticsVal =
          box.get(StorageKeys.settingsHaptics, defaultValue: 'true')!;
      _haptics = hapticsVal == 'true';
    });
  }

  void _save(String key, String value) {
    Hive.box<String>(StorageKeys.settingsBox).put(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.textSecondary,
            size: 18,
          ),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'SETTINGS',
          style: TextStyle(
            color: AppColors.textSecondary,
            letterSpacing: 4,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionLabel('GAMEPLAY'),
            const SizedBox(height: 12),
            _DifficultySelector(
              value: _difficulty,
              onChange: (val) {
                setState(() => _difficulty = val);
                _save(StorageKeys.settingsDifficulty, val);
              },
            ),
            const SizedBox(height: 24),
            const _SectionLabel('INTERFACE'),
            const SizedBox(height: 12),
            _ToggleRow(
              label: 'Haptic Feedback',
              value: _haptics,
              onChange: (val) {
                setState(() => _haptics = val);
                _save(StorageKeys.settingsHaptics, val.toString());
              },
            ),
            const SizedBox(height: 32),
            const _SectionLabel('SAVE DATA'),
            const SizedBox(height: 12),
            _DangerButton(
              label: 'CLEAR SAVE DATA',
              onTap: () => _showClearConfirm(context),
            ),
            const SizedBox(height: 12),
            _DangerButton(
              label: 'RESET TUTORIAL',
              onTap: () async {
                await sl<TutorialService>().resetAll();
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Tutorial hints reset.')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showClearConfirm(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: AppColors.border),
        ),
        title: const Text(
          'Clear Save?',
          style: TextStyle(color: AppColors.textPrimary),
        ),
        content: const Text(
          'This will permanently delete your creature, progress, and resources.',
          style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text(
              'CANCEL',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(ctx).pop();
              await _clearSave();
            },
            child: const Text(
              'CLEAR',
              style: TextStyle(color: AppColors.hp),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _clearSave() async {
    final creatureBox = Hive.box<String>(StorageKeys.creatureBox);
    await creatureBox.delete(
      '${StorageKeys.activeCreaturePrefix}slot_0',
    );
    final biomeBox = Hive.box<String>(StorageKeys.biomeBox);
    await biomeBox.delete('${StorageKeys.activeBiomePrefix}slot_0');
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Save data cleared.'),
          backgroundColor: AppColors.surfaceVariant,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}

// ── Section label ─────────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.primary,
        fontSize: 10,
        letterSpacing: 3,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

// ── Difficulty selector ────────────────────────────────────────────────────────

class _DifficultySelector extends StatelessWidget {
  const _DifficultySelector({required this.value, required this.onChange});

  final String value;
  final ValueChanged<String> onChange;

  @override
  Widget build(BuildContext context) {
    final options = <(String, String, Color)>[
      ('easy', 'EASY', AppColors.secondary),
      ('normal', 'NORMAL', AppColors.primary),
      ('hard', 'HARD', AppColors.hp),
    ];

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          for (final opt in options)
            Expanded(
              child: GestureDetector(
                onTap: () => onChange(opt.$1),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: value == opt.$1
                        ? opt.$3.withValues(alpha: 0.2)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(6),
                    border: value == opt.$1
                        ? Border.all(color: opt.$3.withValues(alpha: 0.5))
                        : null,
                  ),
                  child: Text(
                    opt.$2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: value == opt.$1 ? opt.$3 : AppColors.textDisabled,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ── Toggle row ────────────────────────────────────────────────────────────────

class _ToggleRow extends StatelessWidget {
  const _ToggleRow({
    required this.label,
    required this.value,
    required this.onChange,
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 13,
            ),
          ),
          const Spacer(),
          Switch(
            value: value,
            onChanged: onChange,
            activeThumbColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}

// ── Danger button ─────────────────────────────────────────────────────────────

class _DangerButton extends StatelessWidget {
  const _DangerButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.hp.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.hp.withValues(alpha: 0.3)),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.hp,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}

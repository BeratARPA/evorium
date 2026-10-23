import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/domain/enums/biome_type.dart';
import '../../../../core/domain/enums/evolution_stage.dart';
import '../../../creature/presentation/states/creature_state.dart';
import '../../../creature/presentation/viewmodels/creature_viewmodel.dart';
import '../../../resource/presentation/viewmodels/resource_viewmodel.dart';
import '../../domain/entities/biome_transition_requirement.dart';
import '../../domain/usecases/check_biome_transition_use_case.dart';
import '../states/biome_state.dart';
import '../viewmodels/biome_viewmodel.dart';

/// Full-screen page listing all biomes and their migration requirements.
class BiomeSelectionPage extends ConsumerWidget {
  const BiomeSelectionPage({super.key, required this.onMigrated});

  final VoidCallback onMigrated;

  static const _checker = CheckBiomeTransitionUseCase();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final biomeState = ref.watch(biomeProvider);
    final creatureState = ref.watch(creatureProvider);
    final resourceState = ref.watch(resourceProvider);

    final currentBiome =
        biomeState is BiomeStateLoaded ? biomeState.biome.type : null;

    // Group biomes by evolution stage
    final groups = <EvolutionStage, List<BiomeType>>{
      EvolutionStage.cellular: [
        BiomeType.primordialSoup,
        BiomeType.thermalVents,
        BiomeType.frozenSubsurface,
      ],
      EvolutionStage.multicellular: [
        BiomeType.shallowSea,
        BiomeType.coralReef,
        BiomeType.deepOcean,
      ],
      EvolutionStage.landTransition: [
        BiomeType.coastalWetland,
        BiomeType.rainforest,
        BiomeType.aridScrublands,
        BiomeType.volcanicTerrain,
        BiomeType.iceAgeTundra,
      ],
    };

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'MIGRATE BIOME',
                          style: TextStyle(
                            color: AppColors.accent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3,
                          ),
                        ),
                        Text(
                          'Current: ${currentBiome?.displayName ?? '—'}',
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close, color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),

            const Divider(color: AppColors.border, height: 1),

            // Biome list
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  for (final entry in groups.entries) ...[
                    _StageHeader(stage: entry.key),
                    const Gap(8),
                    for (var i = 0; i < entry.value.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: _BiomeTile(
                          biomeType: entry.value[i],
                          isCurrent: entry.value[i] == currentBiome,
                          checkResult: creatureState is CreatureStateAlive
                              ? _checker(
                                  CheckBiomeTransitionParams(
                                    creature: creatureState.creature,
                                    targetBiome: entry.value[i],
                                    currentFood:
                                        resourceState.resources.food,
                                  ),
                                )
                              : const BiomeTransitionCheckResult(
                                  canTransition: false,
                                  failureReasons: ['No creature'],
                                ),
                          onMigrate: () {
                            final target = entry.value[i];
                            ref
                                .read(biomeProvider.notifier)
                                .transitionTo(target);
                            // Reinitialize resource nodes for new biome
                            ref
                                .read(resourceProvider.notifier)
                                .initializeNodes(target);
                            // Deduct food cost
                            final cost = BiomeTransitionRequirement
                                    .all[entry.value[i]]
                                    ?.foodCost ??
                                0;
                            if (cost > 0) {
                              final rs = ref.read(resourceProvider);
                              ref
                                  .read(resourceProvider.notifier)
                                  .initialize(rs.resources.consumeFood(cost));
                            }
                            Navigator.of(context).pop();
                            onMigrated();
                          },
                        ).animate(delay: Duration(milliseconds: 60 * i)).fadeIn().slideX(begin: 0.2),
                      ),
                    const Gap(8),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StageHeader extends StatelessWidget {
  const _StageHeader({required this.stage});

  final EvolutionStage stage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.surfaceVariant,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.border),
          ),
          child: Text(
            stage.displayName.toUpperCase(),
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 9,
              letterSpacing: 2,
            ),
          ),
        ),
        const Expanded(child: Divider(color: AppColors.border, indent: 8)),
      ],
    );
  }
}

class _BiomeTile extends StatelessWidget {
  const _BiomeTile({
    required this.biomeType,
    required this.isCurrent,
    required this.checkResult,
    required this.onMigrate,
  });

  final BiomeType biomeType;
  final bool isCurrent;
  final BiomeTransitionCheckResult checkResult;
  final VoidCallback onMigrate;

  @override
  Widget build(BuildContext context) {
    final req = BiomeTransitionRequirement.all[biomeType];
    final canMigrate = checkResult.canTransition && !isCurrent;

    Color borderColor;
    if (isCurrent) {
      borderColor = AppColors.accent;
    } else if (canMigrate) {
      borderColor = AppColors.secondary;
    } else {
      borderColor = AppColors.border;
    }

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: isCurrent ? 1.5 : 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(biomeType.emoji, style: const TextStyle(fontSize: 22)),
              const Gap(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      biomeType.displayName,
                      style: TextStyle(
                        color: isCurrent ? AppColors.accent : AppColors.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (isCurrent)
                      const Text(
                        'CURRENT BIOME',
                        style: TextStyle(
                          color: AppColors.accent,
                          fontSize: 9,
                          letterSpacing: 2,
                        ),
                      ),
                  ],
                ),
              ),
              if (req != null && req.foodCost > 0)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceVariant,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '🌿 ${req.foodCost}',
                    style: const TextStyle(
                      color: AppColors.secondary,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          if (!isCurrent) ...[
            const Gap(10),
            if (checkResult.canTransition)
              FilledButton(
                onPressed: onMigrate,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.secondary.withValues(alpha: 0.15),
                  foregroundColor: AppColors.secondary,
                  side: const BorderSide(color: AppColors.secondary),
                  minimumSize: const Size(double.infinity, 36),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'MIGRATE',
                  style: TextStyle(fontSize: 11, letterSpacing: 2),
                ),
              )
            else
              Wrap(
                spacing: 6,
                runSpacing: 4,
                children: checkResult.failureReasons
                    .map(
                      (r) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppColors.hp.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: AppColors.hp.withValues(alpha: 0.3)),
                        ),
                        child: Text(
                          r,
                          style: const TextStyle(
                            color: AppColors.hp,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
          ],
        ],
      ),
    );
  }
}

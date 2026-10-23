import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/enums/biome_type.dart';
import '../../../../core/domain/enums/evolution_stage.dart';

part 'generation_summary.freezed.dart';
part 'generation_summary.g.dart';

/// End-of-generation summary and scoring result.
@freezed
class GenerationSummary with _$GenerationSummary {
  const factory GenerationSummary({
    required int generation,
    required int survivalSeconds,
    required int resourcesGathered,
    required int encountersWon,
    required int evolutionaryPoints,
    required BiomeType lastBiome,
    required EvolutionStage achievedStage,
    required String deathCause,

    /// Traits the creature had at death (for inheritance).
    @Default([]) List<String> traitIds,

    /// EP breakdown by category.
    @Default({}) Map<String, int> epBreakdown,
  }) = _GenerationSummary;

  const GenerationSummary._();

  factory GenerationSummary.fromJson(Map<String, dynamic> json) =>
      _$GenerationSummaryFromJson(json);

  /// Human-readable survival time string.
  String get survivalFormatted {
    final m = survivalSeconds ~/ 60;
    final s = survivalSeconds % 60;
    return '${m}m ${s}s';
  }
}

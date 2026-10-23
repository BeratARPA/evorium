import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/enums/evolution_stage.dart';
import '../../../../core/domain/enums/mutation_rarity.dart';
import '../../../../core/domain/enums/mutation_type.dart';

part 'mutation.freezed.dart';
part 'mutation.g.dart';

/// A mutation card that can be offered to the player during selection.
@freezed
class Mutation with _$Mutation {
  const factory Mutation({
    required String id,
    required String name,
    required String description,
    required MutationRarity rarity,
    required MutationType type,
    required EvolutionStage requiredStage,

    /// Trait granted when this mutation is applied (if any).
    String? grantedTraitId,

    /// Required existing trait (for traitEvolution mutations).
    String? requiredTraitId,

    /// Trait removed (for regressiveMutation).
    String? removedTraitId,

    /// Required traits for synergyUnlock (both must be present).
    @Default([]) List<String> requiredTraitIds,

    /// Direct stat modifications (e.g. {'atk': 3, 'spd': -1}).
    @Default({}) Map<String, int> statModifiers,

    /// Preview of stat changes shown on card (may include trait effects).
    @Default({}) Map<String, int> statPreview,
  }) = _Mutation;

  const Mutation._();

  factory Mutation.fromJson(Map<String, dynamic> json) =>
      _$MutationFromJson(json);

  bool get hasStatChange => statModifiers.isNotEmpty;
  bool get grantsNewTrait => grantedTraitId != null;
  bool get requiresExistingTrait =>
      requiredTraitId != null || requiredTraitIds.isNotEmpty;
}

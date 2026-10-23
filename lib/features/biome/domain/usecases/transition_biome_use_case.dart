import '../../../../core/base/base_use_case.dart';
import '../../../../core/domain/enums/biome_type.dart';
import '../entities/biome.dart';
import '../entities/biome_transition_requirement.dart';
import '../repositories/biome_repository.dart';

class TransitionBiomeParams {
  const TransitionBiomeParams({
    required this.slotId,
    required this.targetBiome,
  });

  final String slotId;
  final BiomeType targetBiome;
}

/// Creates and persists the new biome. Returns it so the caller can update
/// state. Food cost deduction is handled by the caller (ResourceNotifier).
class TransitionBiomeUseCase implements UseCase<Biome, TransitionBiomeParams> {
  const TransitionBiomeUseCase(this._repository);

  final BiomeRepository _repository;

  @override
  Future<Biome> call(TransitionBiomeParams params) async {
    final newBiome = Biome.create(params.targetBiome);
    await _repository.saveBiome(params.slotId, newBiome);
    return newBiome;
  }

  /// Convenience: food cost for the given biome.
  int foodCostFor(BiomeType type) =>
      BiomeTransitionRequirement.all[type]?.foodCost ?? 20;
}

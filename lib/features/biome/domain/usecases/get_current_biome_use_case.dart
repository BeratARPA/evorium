import '../../../../core/base/base_use_case.dart';
import '../entities/biome.dart';
import '../repositories/biome_repository.dart';

class GetCurrentBiomeUseCase implements UseCase<Biome?, String> {
  const GetCurrentBiomeUseCase(this._repository);

  final BiomeRepository _repository;

  @override
  Future<Biome?> call(String slotId) => _repository.getCurrentBiome(slotId);
}

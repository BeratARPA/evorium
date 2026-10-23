import '../../../../core/base/base_use_case.dart';
import '../entities/creature.dart';
import '../repositories/creature_repository.dart';

class GetCreatureUseCase implements UseCase<Creature?, String> {
  const GetCreatureUseCase(this._repository);

  final CreatureRepository _repository;

  @override
  Future<Creature?> call(String slotId) => _repository.getActiveCreature(slotId);
}

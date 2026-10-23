import 'package:uuid/uuid.dart';

import '../../../../core/base/base_use_case.dart';
import '../../../../core/rng/random_service.dart';
import '../entities/creature.dart';
import '../repositories/creature_repository.dart';

class SpawnCreatureParams {
  const SpawnCreatureParams({required this.slotId, this.name});

  final String slotId;
  final String? name;
}

class SpawnCreatureUseCase implements UseCase<Creature, SpawnCreatureParams> {
  const SpawnCreatureUseCase(this._repository, this._rng);

  final CreatureRepository _repository;
  final RandomService _rng;

  static const _defaultNames = [
    'Primordius',
    'Cella',
    'Protovus',
    'Originis',
    'Nascens',
    'Primeval',
    'Organa',
    'Vitalis',
  ];

  @override
  Future<Creature> call(SpawnCreatureParams params) async {
    final String name = params.name ?? _rng.pick(_defaultNames);
    final id = const Uuid().v4();
    final creature = Creature.newGame(id: id, name: name);
    await _repository.saveCreature(params.slotId, creature);
    return creature;
  }
}

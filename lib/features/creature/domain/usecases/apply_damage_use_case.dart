import '../../../../core/base/base_use_case.dart';
import '../entities/creature.dart';
import '../repositories/creature_repository.dart';

class ApplyDamageParams {
  const ApplyDamageParams({
    required this.slotId,
    required this.creature,
    required this.damage,
    this.damageType = 'physical',
  });

  final String slotId;
  final Creature creature;
  final int damage;
  final String damageType;
}

class ApplyDamageUseCase implements UseCase<Creature, ApplyDamageParams> {
  const ApplyDamageUseCase(this._repository);

  final CreatureRepository _repository;

  @override
  Future<Creature> call(ApplyDamageParams params) async {
    final effectiveDamage =
        (params.damage - params.creature.stats.def).clamp(1, params.damage);
    final newHp =
        (params.creature.stats.hp - effectiveDamage).clamp(0, params.creature.stats.maxHp);

    final updated = params.creature.copyWith(
      stats: params.creature.stats.copyWith(hp: newHp),
    );
    await _repository.saveCreature(params.slotId, updated);
    return updated;
  }
}

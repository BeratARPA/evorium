import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/di/injection.dart';
import '../../domain/entities/creature.dart';
import '../../domain/usecases/apply_damage_use_case.dart';
import '../../domain/usecases/get_creature_use_case.dart';
import '../../domain/usecases/spawn_creature_use_case.dart';
import '../states/creature_state.dart';

class CreatureNotifier extends Notifier<CreatureState> {
  static const _slotId = 'slot_0';

  @override
  CreatureState build() => const CreatureState.initial();

  Future<void> loadOrSpawn() async {
    state = const CreatureState.loading();
    try {
      final getUseCase = sl<GetCreatureUseCase>();
      final existing = await getUseCase(_slotId);
      if (existing != null) {
        state = CreatureState.alive(creature: existing);
      } else {
        await spawnNew();
      }
    } catch (e) {
      state = CreatureState.error(e.toString());
    }
  }

  Future<void> spawnNew({String? name}) async {
    try {
      final spawnUseCase = sl<SpawnCreatureUseCase>();
      final creature =
          await spawnUseCase(SpawnCreatureParams(slotId: _slotId, name: name));
      state = CreatureState.alive(creature: creature);
    } catch (e) {
      state = CreatureState.error(e.toString());
    }
  }

  Future<void> applyDamage(int damage, {String damageType = 'physical'}) async {
    final current = state;
    if (current is! CreatureStateAlive) return;
    try {
      final useCase = sl<ApplyDamageUseCase>();
      final updated = await useCase(ApplyDamageParams(
        slotId: _slotId,
        creature: current.creature,
        damage: damage,
        damageType: damageType,
      ));
      if (!updated.isAlive) {
        state = CreatureState.dead(creature: updated, cause: damageType);
      } else {
        state = CreatureState.alive(creature: updated);
      }
    } catch (e) {
      state = CreatureState.error(e.toString());
    }
  }

  void updateCreature(Creature creature) {
    state = CreatureState.alive(creature: creature);
  }
}

final creatureProvider =
    NotifierProvider<CreatureNotifier, CreatureState>(CreatureNotifier.new);

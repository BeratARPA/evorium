import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/storage/storage_keys.dart';
import '../../domain/entities/creature.dart';
import '../../domain/repositories/creature_repository.dart';

class CreatureRepositoryImpl implements CreatureRepository {
  const CreatureRepositoryImpl(this._box);

  final Box<String> _box;

  String _key(String slotId) => '${StorageKeys.activeCreaturePrefix}$slotId';

  @override
  Future<Creature?> getActiveCreature(String slotId) async {
    final raw = _box.get(_key(slotId));
    if (raw == null) return null;
    return Creature.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  @override
  Future<void> saveCreature(String slotId, Creature creature) async {
    await _box.put(_key(slotId), jsonEncode(creature.toJson()));
  }

  @override
  Future<void> deleteActiveCreature(String slotId) async {
    await _box.delete(_key(slotId));
  }
}

import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../../../resource/domain/entities/player_resources.dart';
import '../../../resource/domain/repositories/resource_repository.dart';

class ResourceRepositoryImpl implements ResourceRepository {
  const ResourceRepositoryImpl(this._box);

  final Box<String> _box;

  String _key(String slotId) => 'resources_$slotId';

  @override
  Future<PlayerResources?> getResources(String slotId) async {
    final raw = _box.get(_key(slotId));
    if (raw == null) return null;
    return PlayerResources.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  @override
  Future<void> saveResources(String slotId, PlayerResources resources) async {
    await _box.put(_key(slotId), jsonEncode(resources.toJson()));
  }

  @override
  Future<void> deleteResources(String slotId) async {
    await _box.delete(_key(slotId));
  }
}

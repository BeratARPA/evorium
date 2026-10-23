import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/domain/enums/biome_type.dart';
import '../../../../core/storage/storage_keys.dart';
import '../../domain/entities/biome.dart';
import '../../domain/repositories/biome_repository.dart';

class BiomeRepositoryImpl implements BiomeRepository {
  const BiomeRepositoryImpl(this._box);

  final Box<String> _box;

  String _currentKey(String slotId) =>
      '${StorageKeys.activeBiomePrefix}$slotId';
  String _discoveredKey(String slotId) => 'discovered_biomes_$slotId';

  @override
  Future<Biome?> getCurrentBiome(String slotId) async {
    final raw = _box.get(_currentKey(slotId));
    if (raw == null) return null;
    return Biome.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  @override
  Future<void> saveBiome(String slotId, Biome biome) async {
    await _box.put(_currentKey(slotId), jsonEncode(biome.toJson()));
  }

  @override
  Future<List<BiomeType>> getDiscoveredBiomes(String slotId) async {
    final raw = _box.get(_discoveredKey(slotId));
    if (raw == null) return [BiomeType.primordialSoup];
    final list = jsonDecode(raw) as List<dynamic>;
    return list
        .map((e) => BiomeType.values.firstWhere((b) => b.name == e as String))
        .toList();
  }
}

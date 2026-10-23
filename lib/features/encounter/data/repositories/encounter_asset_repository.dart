import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../../core/domain/enums/encounter_type.dart';
import '../../domain/entities/encounter.dart';
import '../../domain/repositories/encounter_repository.dart';

/// Loads encounters from assets/data/encounters.json.
/// Results are cached after first load.
class EncounterAssetRepository implements EncounterRepository {
  List<Encounter>? _cache;

  @override
  Future<List<Encounter>> getAllEncounters() async {
    if (_cache != null) return _cache!;
    final raw = await rootBundle.loadString('assets/data/encounters.json');
    final list = jsonDecode(raw) as List<dynamic>;
    _cache = list
        .map((e) => Encounter.fromJson(e as Map<String, dynamic>))
        .toList();
    return _cache!;
  }

  @override
  Future<List<Encounter>> getEncountersByType(EncounterType type) async {
    final all = await getAllEncounters();
    return all.where((e) => e.type == type).toList();
  }
}

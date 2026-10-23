import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../../core/domain/enums/evolution_stage.dart';
import '../../domain/entities/mutation.dart';
import '../../domain/repositories/mutation_repository.dart';

/// Loads mutations from assets/data/mutations.json.
class MutationAssetRepository implements MutationRepository {
  List<Mutation>? _cache;

  @override
  Future<List<Mutation>> getAllMutations() async {
    if (_cache != null) return _cache!;
    final raw = await rootBundle.loadString('assets/data/mutations.json');
    final list = jsonDecode(raw) as List<dynamic>;
    _cache = list
        .map((e) => Mutation.fromJson(e as Map<String, dynamic>))
        .toList();
    return _cache!;
  }

  @override
  Future<List<Mutation>> getMutationsForStage(EvolutionStage stage) async {
    final all = await getAllMutations();
    return all.where((m) => m.requiredStage.index <= stage.index).toList();
  }
}

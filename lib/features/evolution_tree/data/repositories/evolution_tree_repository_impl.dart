import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/repositories/evolution_tree_repository.dart';

class EvolutionTreeRepositoryImpl implements EvolutionTreeRepository {
  const EvolutionTreeRepositoryImpl(this._box);

  final Box<String> _box;

  static const _unlockedKey = 'unlocked_nodes';
  static const _epBalanceKey = 'ep_balance';

  @override
  Future<List<String>> getUnlockedNodeIds() async {
    final raw = _box.get(_unlockedKey);
    if (raw == null) return [];
    final list = jsonDecode(raw) as List<dynamic>;
    return list.cast<String>();
  }

  @override
  Future<void> unlockNode(String nodeId) async {
    final current = await getUnlockedNodeIds();
    if (!current.contains(nodeId)) {
      current.add(nodeId);
      await _box.put(_unlockedKey, jsonEncode(current));
    }
  }

  @override
  Future<int> getEpBalance() async {
    final raw = _box.get(_epBalanceKey);
    return raw == null ? 0 : int.tryParse(raw) ?? 0;
  }

  @override
  Future<void> addEp(int ep) async {
    final current = await getEpBalance();
    await _box.put(_epBalanceKey, '${current + ep}');
  }

  @override
  Future<void> spendEp(int ep) async {
    final current = await getEpBalance();
    final newBalance = (current - ep).clamp(0, current);
    await _box.put(_epBalanceKey, '$newBalance');
  }
}

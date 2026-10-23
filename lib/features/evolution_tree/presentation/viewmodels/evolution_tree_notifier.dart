import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/di/injection.dart';
import '../../domain/entities/evolution_node.dart';
import '../../domain/repositories/evolution_tree_repository.dart';
import '../../domain/usecases/get_evolution_tree_use_case.dart';
import '../../domain/usecases/unlock_evolution_node_use_case.dart';

class EvolutionTreeState {
  const EvolutionTreeState({
    this.nodes = const [],
    this.epBalance = 0,
    this.isLoading = true,
    this.lastError,
  });

  final List<EvolutionNode> nodes;
  final int epBalance;
  final bool isLoading;
  final String? lastError;

  EvolutionTreeState copyWith({
    List<EvolutionNode>? nodes,
    int? epBalance,
    bool? isLoading,
    String? lastError,
  }) {
    return EvolutionTreeState(
      nodes: nodes ?? this.nodes,
      epBalance: epBalance ?? this.epBalance,
      isLoading: isLoading ?? this.isLoading,
      lastError: lastError,
    );
  }

  bool canUnlock(EvolutionNode node) {
    if (node.isUnlocked) return false;
    if (epBalance < node.epCost) return false;
    return node.requiredNodeIds.every(
      (id) => nodes.any((n) => n.id == id && n.isUnlocked),
    );
  }

  List<String> get categories {
    final seen = <String>{};
    return nodes.map((n) => n.category).where(seen.add).toList();
  }

  List<EvolutionNode> nodesForCategory(String category) =>
      nodes.where((n) => n.category == category).toList();
}

class EvolutionTreeNotifier extends Notifier<EvolutionTreeState> {
  @override
  EvolutionTreeState build() {
    Future.microtask(load);
    return const EvolutionTreeState();
  }

  Future<void> load() async {
    state = state.copyWith(isLoading: true);
    final nodes = await sl<GetEvolutionTreeUseCase>()(
      const GetEvolutionTreeParams(),
    );
    final balance = await sl<EvolutionTreeRepository>().getEpBalance();
    state = state.copyWith(nodes: nodes, epBalance: balance, isLoading: false);
  }

  Future<UnlockNodeResult> unlock(EvolutionNode node) async {
    final result = await sl<UnlockEvolutionNodeUseCase>()(
      UnlockNodeParams(node: node, allNodes: state.nodes),
    );
    if (result is UnlockNodeSuccess) {
      // Refresh after unlock
      await load();
    } else if (result is UnlockNodeFailure) {
      state = state.copyWith(lastError: result.reason);
    }
    return result;
  }
}

final evolutionTreeProvider =
    NotifierProvider<EvolutionTreeNotifier, EvolutionTreeState>(
  EvolutionTreeNotifier.new,
);

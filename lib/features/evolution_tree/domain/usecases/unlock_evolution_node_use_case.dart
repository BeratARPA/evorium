import '../../../../core/base/base_use_case.dart';
import '../entities/evolution_node.dart';
import '../repositories/evolution_tree_repository.dart';

class UnlockNodeParams {
  const UnlockNodeParams({
    required this.node,
    required this.allNodes,
  });

  final EvolutionNode node;
  final List<EvolutionNode> allNodes;
}

sealed class UnlockNodeResult {}

class UnlockNodeSuccess extends UnlockNodeResult {}

class UnlockNodeFailure extends UnlockNodeResult {
  UnlockNodeFailure(this.reason);
  final String reason;
}

/// Validates prerequisites + EP balance, then unlocks a node.
class UnlockEvolutionNodeUseCase
    implements UseCase<UnlockNodeResult, UnlockNodeParams> {
  const UnlockEvolutionNodeUseCase(this._repository);

  final EvolutionTreeRepository _repository;

  @override
  Future<UnlockNodeResult> call(UnlockNodeParams params) async {
    final node = params.node;
    if (node.isUnlocked) {
      return UnlockNodeFailure('Already unlocked');
    }

    // Check prerequisites
    for (final reqId in node.requiredNodeIds) {
      final prereq = params.allNodes.where((n) => n.id == reqId).firstOrNull;
      if (prereq == null || !prereq.isUnlocked) {
        return UnlockNodeFailure('Prerequisite not met: ${prereq?.name ?? reqId}');
      }
    }

    // Check EP balance
    final balance = await _repository.getEpBalance();
    if (balance < node.epCost) {
      return UnlockNodeFailure('Insufficient EP ($balance / ${node.epCost})');
    }

    await _repository.spendEp(node.epCost);
    await _repository.unlockNode(node.id);
    return UnlockNodeSuccess();
  }
}

import '../../../../core/base/base_use_case.dart';
import '../../data/datasources/evolution_tree_definitions.dart';
import '../entities/evolution_node.dart';
import '../repositories/evolution_tree_repository.dart';

class GetEvolutionTreeParams {
  const GetEvolutionTreeParams();
}

/// Returns all evolution nodes with unlock status populated from the repository.
class GetEvolutionTreeUseCase
    implements UseCase<List<EvolutionNode>, GetEvolutionTreeParams> {
  const GetEvolutionTreeUseCase(this._repository);

  final EvolutionTreeRepository _repository;

  @override
  Future<List<EvolutionNode>> call(GetEvolutionTreeParams params) async {
    final unlockedIds = await _repository.getUnlockedNodeIds();
    final nodes = EvolutionTreeDefinitions.all();
    for (final node in nodes) {
      node.isUnlocked = unlockedIds.contains(node.id);
    }
    return nodes;
  }
}

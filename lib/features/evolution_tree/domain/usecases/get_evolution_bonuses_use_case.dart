import '../../../../core/base/base_use_case.dart';
import '../../data/datasources/evolution_tree_definitions.dart';
import '../entities/applied_evolution_bonuses.dart';
import '../repositories/evolution_tree_repository.dart';

class GetEvolutionBonusesParams {
  const GetEvolutionBonusesParams();
}

/// Returns the aggregated bonuses from all currently unlocked evolution nodes.
class GetEvolutionBonusesUseCase
    implements UseCase<AppliedEvolutionBonuses, GetEvolutionBonusesParams> {
  const GetEvolutionBonusesUseCase(this._repository);

  final EvolutionTreeRepository _repository;

  @override
  Future<AppliedEvolutionBonuses> call(GetEvolutionBonusesParams params) async {
    final unlockedIds = await _repository.getUnlockedNodeIds();
    final nodes = EvolutionTreeDefinitions.all();
    for (final node in nodes) {
      node.isUnlocked = unlockedIds.contains(node.id);
    }
    return AppliedEvolutionBonuses.fromNodes(nodes);
  }
}

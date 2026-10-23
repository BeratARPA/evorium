import '../../../../core/base/base_use_case.dart';
import '../../../../core/domain/enums/evolution_stage.dart';
import '../../../../core/rng/random_service.dart';
import '../entities/mutation.dart';
import '../repositories/mutation_repository.dart';

class DrawMutationsParams {
  const DrawMutationsParams({
    required this.stage,
    required this.existingTraitIds,
    this.drawCount = 3,
  });

  final EvolutionStage stage;
  final List<String> existingTraitIds;
  final int drawCount;
}

class DrawMutationsUseCase
    implements UseCase<List<Mutation>, DrawMutationsParams> {
  const DrawMutationsUseCase(this._repository, this._rng);

  final MutationRepository _repository;
  final RandomService _rng;

  @override
  Future<List<Mutation>> call(DrawMutationsParams params) async {
    final pool = await _repository.getMutationsForStage(params.stage);

    // Filter out mutations the creature can't take
    final eligible = pool.where((m) => _isEligible(m, params)).toList();
    if (eligible.isEmpty) return [];

    // Weighted random selection by rarity
    return _weightedDraw(eligible, params.drawCount);
  }

  bool _isEligible(Mutation m, DrawMutationsParams params) {
    // If requires existing trait, check creature has it
    if (m.requiredTraitId != null &&
        !params.existingTraitIds.contains(m.requiredTraitId)) {
      return false;
    }
    // Synergy unlock: both traits must be present
    if (m.requiredTraitIds.isNotEmpty) {
      return m.requiredTraitIds
          .every((id) => params.existingTraitIds.contains(id));
    }
    // Trait evolution: creature must have the base trait
    if (m.type.name == 'traitEvolution' && m.requiredTraitId != null) {
      return params.existingTraitIds.contains(m.requiredTraitId);
    }
    return true;
  }

  List<Mutation> _weightedDraw(List<Mutation> pool, int count) {
    if (pool.length <= count) return pool;

    // Build weighted list
    final weighted = <Mutation>[];
    for (final m in pool) {
      for (var i = 0; i < m.rarity.weight; i++) {
        weighted.add(m);
      }
    }

    final result = <Mutation>[];
    final used = <String>{};

    while (result.length < count && result.length < pool.length) {
      final candidate = _rng.pick(weighted);
      if (!used.contains(candidate.id)) {
        result.add(candidate);
        used.add(candidate.id);
      }
    }
    return result;
  }
}

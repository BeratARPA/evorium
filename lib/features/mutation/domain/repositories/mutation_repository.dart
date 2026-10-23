import '../../../../core/domain/enums/evolution_stage.dart';
import '../entities/mutation.dart';

abstract interface class MutationRepository {
  /// Load all mutations from the static data source.
  Future<List<Mutation>> getAllMutations();

  /// Get mutations available for a given stage.
  Future<List<Mutation>> getMutationsForStage(EvolutionStage stage);
}

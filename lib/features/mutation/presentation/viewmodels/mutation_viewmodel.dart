import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/di/injection.dart';
import '../../../creature/domain/entities/creature.dart';
import '../../../creature/presentation/viewmodels/creature_viewmodel.dart';
import '../../domain/entities/mutation.dart';
import '../../domain/usecases/apply_mutation_use_case.dart';
import '../../domain/usecases/draw_mutations_use_case.dart';
import '../states/mutation_state.dart';

class MutationNotifier extends Notifier<MutationState> {
  static const _slotId = 'slot_0';

  @override
  MutationState build() => const MutationState.idle();

  /// Draw 3 mutation options for the current creature.
  Future<void> drawOptions(Creature creature) async {
    state = const MutationState.drawing();
    try {
      final options = await sl<DrawMutationsUseCase>()(DrawMutationsParams(
        stage: creature.stage,
        existingTraitIds: creature.traitIds,
      ));
      state = MutationState.selecting(options: options);
    } catch (e) {
      state = MutationState.error(e.toString());
    }
  }

  /// Apply the player's chosen mutation to the creature.
  Future<void> applyMutation(Creature creature, Mutation mutation) async {
    state = const MutationState.applying();
    try {
      final updated = await sl<ApplyMutationUseCase>()(ApplyMutationParams(
        slotId: _slotId,
        creature: creature,
        mutation: mutation,
      ));
      ref.read(creatureProvider.notifier).updateCreature(updated);
      state = MutationState.done(applied: mutation);
    } catch (e) {
      state = MutationState.error(e.toString());
    }
  }

  void reset() => state = const MutationState.idle();
}

final mutationProvider =
    NotifierProvider<MutationNotifier, MutationState>(MutationNotifier.new);

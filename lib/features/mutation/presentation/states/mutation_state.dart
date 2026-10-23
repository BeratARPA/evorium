import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/mutation.dart';

part 'mutation_state.freezed.dart';

@freezed
sealed class MutationState with _$MutationState {
  const factory MutationState.idle() = MutationStateIdle;
  const factory MutationState.drawing() = MutationStateDrawing;
  const factory MutationState.selecting({
    required List<Mutation> options,
  }) = MutationStateSelecting;
  const factory MutationState.applying() = MutationStateApplying;
  const factory MutationState.done({required Mutation applied}) =
      MutationStateDone;
  const factory MutationState.error(String message) = MutationStateError;
}

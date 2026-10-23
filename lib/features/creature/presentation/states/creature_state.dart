import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/creature.dart';

part 'creature_state.freezed.dart';

@freezed
sealed class CreatureState with _$CreatureState {
  /// No creature loaded yet.
  const factory CreatureState.initial() = CreatureStateInitial;

  /// Loading creature from storage.
  const factory CreatureState.loading() = CreatureStateLoading;

  /// Creature is alive and active.
  const factory CreatureState.alive({required Creature creature}) =
      CreatureStateAlive;

  /// Creature has died — generation over.
  const factory CreatureState.dead({
    required Creature creature,
    required String cause,
  }) = CreatureStateDead;

  /// Error state.
  const factory CreatureState.error(String message) = CreatureStateError;
}

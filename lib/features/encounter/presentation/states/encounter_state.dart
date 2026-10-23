import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/encounter.dart';
import '../../domain/entities/encounter_choice.dart';
import '../../domain/entities/encounter_result.dart';

part 'encounter_state.freezed.dart';

@freezed
sealed class EncounterState with _$EncounterState {
  const factory EncounterState.idle() = EncounterStateIdle;

  const factory EncounterState.active({
    required Encounter encounter,
    required List<EncounterChoice> availableChoices,
  }) = EncounterStateActive;

  const factory EncounterState.resolving({
    required Encounter encounter,
    required EncounterChoice choice,
  }) = EncounterStateResolving;

  const factory EncounterState.resolved({
    required Encounter encounter,
    required EncounterResult result,
  }) = EncounterStateResolved;

  const factory EncounterState.error(String message) = EncounterStateError;
}

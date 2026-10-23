import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../generation/domain/entities/generation_summary.dart';

part 'game_shell_state.freezed.dart';

enum GamePhase {
  /// New game — select starting biome / mutation.
  setup,

  /// Main game loop — creature is alive and exploring.
  playing,

  /// Paused.
  paused,

  /// Mutation selection screen active.
  mutationSelection,

  /// Encounter in progress.
  encounter,

  /// Creature has died — showing death summary.
  deathSummary,
}

@freezed
class GameShellState with _$GameShellState {
  const factory GameShellState({
    @Default(GamePhase.setup) GamePhase phase,
    @Default(1) int generation,
    @Default(0) int survivalSeconds,
    @Default(0) int evolutionaryPoints,
    @Default(false) bool isClockRunning,
    GenerationSummary? currentSummary,
  }) = _GameShellState;

  const GameShellState._();

  factory GameShellState.initial() => const GameShellState();

  bool get isPlaying => phase == GamePhase.playing;
  bool get isPaused => phase == GamePhase.paused;
}

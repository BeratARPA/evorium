// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_shell_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GameShellState {
  GamePhase get phase => throw _privateConstructorUsedError;
  int get generation => throw _privateConstructorUsedError;
  int get survivalSeconds => throw _privateConstructorUsedError;
  int get evolutionaryPoints => throw _privateConstructorUsedError;
  bool get isClockRunning => throw _privateConstructorUsedError;
  GenerationSummary? get currentSummary => throw _privateConstructorUsedError;

  /// Create a copy of GameShellState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameShellStateCopyWith<GameShellState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameShellStateCopyWith<$Res> {
  factory $GameShellStateCopyWith(
          GameShellState value, $Res Function(GameShellState) then) =
      _$GameShellStateCopyWithImpl<$Res, GameShellState>;
  @useResult
  $Res call(
      {GamePhase phase,
      int generation,
      int survivalSeconds,
      int evolutionaryPoints,
      bool isClockRunning,
      GenerationSummary? currentSummary});

  $GenerationSummaryCopyWith<$Res>? get currentSummary;
}

/// @nodoc
class _$GameShellStateCopyWithImpl<$Res, $Val extends GameShellState>
    implements $GameShellStateCopyWith<$Res> {
  _$GameShellStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameShellState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phase = null,
    Object? generation = null,
    Object? survivalSeconds = null,
    Object? evolutionaryPoints = null,
    Object? isClockRunning = null,
    Object? currentSummary = freezed,
  }) {
    return _then(_value.copyWith(
      phase: null == phase
          ? _value.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as GamePhase,
      generation: null == generation
          ? _value.generation
          : generation // ignore: cast_nullable_to_non_nullable
              as int,
      survivalSeconds: null == survivalSeconds
          ? _value.survivalSeconds
          : survivalSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      evolutionaryPoints: null == evolutionaryPoints
          ? _value.evolutionaryPoints
          : evolutionaryPoints // ignore: cast_nullable_to_non_nullable
              as int,
      isClockRunning: null == isClockRunning
          ? _value.isClockRunning
          : isClockRunning // ignore: cast_nullable_to_non_nullable
              as bool,
      currentSummary: freezed == currentSummary
          ? _value.currentSummary
          : currentSummary // ignore: cast_nullable_to_non_nullable
              as GenerationSummary?,
    ) as $Val);
  }

  /// Create a copy of GameShellState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GenerationSummaryCopyWith<$Res>? get currentSummary {
    if (_value.currentSummary == null) {
      return null;
    }

    return $GenerationSummaryCopyWith<$Res>(_value.currentSummary!, (value) {
      return _then(_value.copyWith(currentSummary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GameShellStateImplCopyWith<$Res>
    implements $GameShellStateCopyWith<$Res> {
  factory _$$GameShellStateImplCopyWith(_$GameShellStateImpl value,
          $Res Function(_$GameShellStateImpl) then) =
      __$$GameShellStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GamePhase phase,
      int generation,
      int survivalSeconds,
      int evolutionaryPoints,
      bool isClockRunning,
      GenerationSummary? currentSummary});

  @override
  $GenerationSummaryCopyWith<$Res>? get currentSummary;
}

/// @nodoc
class __$$GameShellStateImplCopyWithImpl<$Res>
    extends _$GameShellStateCopyWithImpl<$Res, _$GameShellStateImpl>
    implements _$$GameShellStateImplCopyWith<$Res> {
  __$$GameShellStateImplCopyWithImpl(
      _$GameShellStateImpl _value, $Res Function(_$GameShellStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameShellState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phase = null,
    Object? generation = null,
    Object? survivalSeconds = null,
    Object? evolutionaryPoints = null,
    Object? isClockRunning = null,
    Object? currentSummary = freezed,
  }) {
    return _then(_$GameShellStateImpl(
      phase: null == phase
          ? _value.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as GamePhase,
      generation: null == generation
          ? _value.generation
          : generation // ignore: cast_nullable_to_non_nullable
              as int,
      survivalSeconds: null == survivalSeconds
          ? _value.survivalSeconds
          : survivalSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      evolutionaryPoints: null == evolutionaryPoints
          ? _value.evolutionaryPoints
          : evolutionaryPoints // ignore: cast_nullable_to_non_nullable
              as int,
      isClockRunning: null == isClockRunning
          ? _value.isClockRunning
          : isClockRunning // ignore: cast_nullable_to_non_nullable
              as bool,
      currentSummary: freezed == currentSummary
          ? _value.currentSummary
          : currentSummary // ignore: cast_nullable_to_non_nullable
              as GenerationSummary?,
    ));
  }
}

/// @nodoc

class _$GameShellStateImpl extends _GameShellState {
  const _$GameShellStateImpl(
      {this.phase = GamePhase.setup,
      this.generation = 1,
      this.survivalSeconds = 0,
      this.evolutionaryPoints = 0,
      this.isClockRunning = false,
      this.currentSummary})
      : super._();

  @override
  @JsonKey()
  final GamePhase phase;
  @override
  @JsonKey()
  final int generation;
  @override
  @JsonKey()
  final int survivalSeconds;
  @override
  @JsonKey()
  final int evolutionaryPoints;
  @override
  @JsonKey()
  final bool isClockRunning;
  @override
  final GenerationSummary? currentSummary;

  @override
  String toString() {
    return 'GameShellState(phase: $phase, generation: $generation, survivalSeconds: $survivalSeconds, evolutionaryPoints: $evolutionaryPoints, isClockRunning: $isClockRunning, currentSummary: $currentSummary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameShellStateImpl &&
            (identical(other.phase, phase) || other.phase == phase) &&
            (identical(other.generation, generation) ||
                other.generation == generation) &&
            (identical(other.survivalSeconds, survivalSeconds) ||
                other.survivalSeconds == survivalSeconds) &&
            (identical(other.evolutionaryPoints, evolutionaryPoints) ||
                other.evolutionaryPoints == evolutionaryPoints) &&
            (identical(other.isClockRunning, isClockRunning) ||
                other.isClockRunning == isClockRunning) &&
            (identical(other.currentSummary, currentSummary) ||
                other.currentSummary == currentSummary));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phase, generation,
      survivalSeconds, evolutionaryPoints, isClockRunning, currentSummary);

  /// Create a copy of GameShellState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameShellStateImplCopyWith<_$GameShellStateImpl> get copyWith =>
      __$$GameShellStateImplCopyWithImpl<_$GameShellStateImpl>(
          this, _$identity);
}

abstract class _GameShellState extends GameShellState {
  const factory _GameShellState(
      {final GamePhase phase,
      final int generation,
      final int survivalSeconds,
      final int evolutionaryPoints,
      final bool isClockRunning,
      final GenerationSummary? currentSummary}) = _$GameShellStateImpl;
  const _GameShellState._() : super._();

  @override
  GamePhase get phase;
  @override
  int get generation;
  @override
  int get survivalSeconds;
  @override
  int get evolutionaryPoints;
  @override
  bool get isClockRunning;
  @override
  GenerationSummary? get currentSummary;

  /// Create a copy of GameShellState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameShellStateImplCopyWith<_$GameShellStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

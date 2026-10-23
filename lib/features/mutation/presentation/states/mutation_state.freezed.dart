// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mutation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MutationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() drawing,
    required TResult Function(List<Mutation> options) selecting,
    required TResult Function() applying,
    required TResult Function(Mutation applied) done,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? drawing,
    TResult? Function(List<Mutation> options)? selecting,
    TResult? Function()? applying,
    TResult? Function(Mutation applied)? done,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? drawing,
    TResult Function(List<Mutation> options)? selecting,
    TResult Function()? applying,
    TResult Function(Mutation applied)? done,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MutationStateIdle value) idle,
    required TResult Function(MutationStateDrawing value) drawing,
    required TResult Function(MutationStateSelecting value) selecting,
    required TResult Function(MutationStateApplying value) applying,
    required TResult Function(MutationStateDone value) done,
    required TResult Function(MutationStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MutationStateIdle value)? idle,
    TResult? Function(MutationStateDrawing value)? drawing,
    TResult? Function(MutationStateSelecting value)? selecting,
    TResult? Function(MutationStateApplying value)? applying,
    TResult? Function(MutationStateDone value)? done,
    TResult? Function(MutationStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MutationStateIdle value)? idle,
    TResult Function(MutationStateDrawing value)? drawing,
    TResult Function(MutationStateSelecting value)? selecting,
    TResult Function(MutationStateApplying value)? applying,
    TResult Function(MutationStateDone value)? done,
    TResult Function(MutationStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MutationStateCopyWith<$Res> {
  factory $MutationStateCopyWith(
          MutationState value, $Res Function(MutationState) then) =
      _$MutationStateCopyWithImpl<$Res, MutationState>;
}

/// @nodoc
class _$MutationStateCopyWithImpl<$Res, $Val extends MutationState>
    implements $MutationStateCopyWith<$Res> {
  _$MutationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MutationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$MutationStateIdleImplCopyWith<$Res> {
  factory _$$MutationStateIdleImplCopyWith(_$MutationStateIdleImpl value,
          $Res Function(_$MutationStateIdleImpl) then) =
      __$$MutationStateIdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MutationStateIdleImplCopyWithImpl<$Res>
    extends _$MutationStateCopyWithImpl<$Res, _$MutationStateIdleImpl>
    implements _$$MutationStateIdleImplCopyWith<$Res> {
  __$$MutationStateIdleImplCopyWithImpl(_$MutationStateIdleImpl _value,
      $Res Function(_$MutationStateIdleImpl) _then)
      : super(_value, _then);

  /// Create a copy of MutationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MutationStateIdleImpl implements MutationStateIdle {
  const _$MutationStateIdleImpl();

  @override
  String toString() {
    return 'MutationState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MutationStateIdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() drawing,
    required TResult Function(List<Mutation> options) selecting,
    required TResult Function() applying,
    required TResult Function(Mutation applied) done,
    required TResult Function(String message) error,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? drawing,
    TResult? Function(List<Mutation> options)? selecting,
    TResult? Function()? applying,
    TResult? Function(Mutation applied)? done,
    TResult? Function(String message)? error,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? drawing,
    TResult Function(List<Mutation> options)? selecting,
    TResult Function()? applying,
    TResult Function(Mutation applied)? done,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MutationStateIdle value) idle,
    required TResult Function(MutationStateDrawing value) drawing,
    required TResult Function(MutationStateSelecting value) selecting,
    required TResult Function(MutationStateApplying value) applying,
    required TResult Function(MutationStateDone value) done,
    required TResult Function(MutationStateError value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MutationStateIdle value)? idle,
    TResult? Function(MutationStateDrawing value)? drawing,
    TResult? Function(MutationStateSelecting value)? selecting,
    TResult? Function(MutationStateApplying value)? applying,
    TResult? Function(MutationStateDone value)? done,
    TResult? Function(MutationStateError value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MutationStateIdle value)? idle,
    TResult Function(MutationStateDrawing value)? drawing,
    TResult Function(MutationStateSelecting value)? selecting,
    TResult Function(MutationStateApplying value)? applying,
    TResult Function(MutationStateDone value)? done,
    TResult Function(MutationStateError value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class MutationStateIdle implements MutationState {
  const factory MutationStateIdle() = _$MutationStateIdleImpl;
}

/// @nodoc
abstract class _$$MutationStateDrawingImplCopyWith<$Res> {
  factory _$$MutationStateDrawingImplCopyWith(_$MutationStateDrawingImpl value,
          $Res Function(_$MutationStateDrawingImpl) then) =
      __$$MutationStateDrawingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MutationStateDrawingImplCopyWithImpl<$Res>
    extends _$MutationStateCopyWithImpl<$Res, _$MutationStateDrawingImpl>
    implements _$$MutationStateDrawingImplCopyWith<$Res> {
  __$$MutationStateDrawingImplCopyWithImpl(_$MutationStateDrawingImpl _value,
      $Res Function(_$MutationStateDrawingImpl) _then)
      : super(_value, _then);

  /// Create a copy of MutationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MutationStateDrawingImpl implements MutationStateDrawing {
  const _$MutationStateDrawingImpl();

  @override
  String toString() {
    return 'MutationState.drawing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MutationStateDrawingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() drawing,
    required TResult Function(List<Mutation> options) selecting,
    required TResult Function() applying,
    required TResult Function(Mutation applied) done,
    required TResult Function(String message) error,
  }) {
    return drawing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? drawing,
    TResult? Function(List<Mutation> options)? selecting,
    TResult? Function()? applying,
    TResult? Function(Mutation applied)? done,
    TResult? Function(String message)? error,
  }) {
    return drawing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? drawing,
    TResult Function(List<Mutation> options)? selecting,
    TResult Function()? applying,
    TResult Function(Mutation applied)? done,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (drawing != null) {
      return drawing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MutationStateIdle value) idle,
    required TResult Function(MutationStateDrawing value) drawing,
    required TResult Function(MutationStateSelecting value) selecting,
    required TResult Function(MutationStateApplying value) applying,
    required TResult Function(MutationStateDone value) done,
    required TResult Function(MutationStateError value) error,
  }) {
    return drawing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MutationStateIdle value)? idle,
    TResult? Function(MutationStateDrawing value)? drawing,
    TResult? Function(MutationStateSelecting value)? selecting,
    TResult? Function(MutationStateApplying value)? applying,
    TResult? Function(MutationStateDone value)? done,
    TResult? Function(MutationStateError value)? error,
  }) {
    return drawing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MutationStateIdle value)? idle,
    TResult Function(MutationStateDrawing value)? drawing,
    TResult Function(MutationStateSelecting value)? selecting,
    TResult Function(MutationStateApplying value)? applying,
    TResult Function(MutationStateDone value)? done,
    TResult Function(MutationStateError value)? error,
    required TResult orElse(),
  }) {
    if (drawing != null) {
      return drawing(this);
    }
    return orElse();
  }
}

abstract class MutationStateDrawing implements MutationState {
  const factory MutationStateDrawing() = _$MutationStateDrawingImpl;
}

/// @nodoc
abstract class _$$MutationStateSelectingImplCopyWith<$Res> {
  factory _$$MutationStateSelectingImplCopyWith(
          _$MutationStateSelectingImpl value,
          $Res Function(_$MutationStateSelectingImpl) then) =
      __$$MutationStateSelectingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Mutation> options});
}

/// @nodoc
class __$$MutationStateSelectingImplCopyWithImpl<$Res>
    extends _$MutationStateCopyWithImpl<$Res, _$MutationStateSelectingImpl>
    implements _$$MutationStateSelectingImplCopyWith<$Res> {
  __$$MutationStateSelectingImplCopyWithImpl(
      _$MutationStateSelectingImpl _value,
      $Res Function(_$MutationStateSelectingImpl) _then)
      : super(_value, _then);

  /// Create a copy of MutationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? options = null,
  }) {
    return _then(_$MutationStateSelectingImpl(
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Mutation>,
    ));
  }
}

/// @nodoc

class _$MutationStateSelectingImpl implements MutationStateSelecting {
  const _$MutationStateSelectingImpl({required final List<Mutation> options})
      : _options = options;

  final List<Mutation> _options;
  @override
  List<Mutation> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  String toString() {
    return 'MutationState.selecting(options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MutationStateSelectingImpl &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_options));

  /// Create a copy of MutationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MutationStateSelectingImplCopyWith<_$MutationStateSelectingImpl>
      get copyWith => __$$MutationStateSelectingImplCopyWithImpl<
          _$MutationStateSelectingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() drawing,
    required TResult Function(List<Mutation> options) selecting,
    required TResult Function() applying,
    required TResult Function(Mutation applied) done,
    required TResult Function(String message) error,
  }) {
    return selecting(options);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? drawing,
    TResult? Function(List<Mutation> options)? selecting,
    TResult? Function()? applying,
    TResult? Function(Mutation applied)? done,
    TResult? Function(String message)? error,
  }) {
    return selecting?.call(options);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? drawing,
    TResult Function(List<Mutation> options)? selecting,
    TResult Function()? applying,
    TResult Function(Mutation applied)? done,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (selecting != null) {
      return selecting(options);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MutationStateIdle value) idle,
    required TResult Function(MutationStateDrawing value) drawing,
    required TResult Function(MutationStateSelecting value) selecting,
    required TResult Function(MutationStateApplying value) applying,
    required TResult Function(MutationStateDone value) done,
    required TResult Function(MutationStateError value) error,
  }) {
    return selecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MutationStateIdle value)? idle,
    TResult? Function(MutationStateDrawing value)? drawing,
    TResult? Function(MutationStateSelecting value)? selecting,
    TResult? Function(MutationStateApplying value)? applying,
    TResult? Function(MutationStateDone value)? done,
    TResult? Function(MutationStateError value)? error,
  }) {
    return selecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MutationStateIdle value)? idle,
    TResult Function(MutationStateDrawing value)? drawing,
    TResult Function(MutationStateSelecting value)? selecting,
    TResult Function(MutationStateApplying value)? applying,
    TResult Function(MutationStateDone value)? done,
    TResult Function(MutationStateError value)? error,
    required TResult orElse(),
  }) {
    if (selecting != null) {
      return selecting(this);
    }
    return orElse();
  }
}

abstract class MutationStateSelecting implements MutationState {
  const factory MutationStateSelecting(
      {required final List<Mutation> options}) = _$MutationStateSelectingImpl;

  List<Mutation> get options;

  /// Create a copy of MutationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MutationStateSelectingImplCopyWith<_$MutationStateSelectingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MutationStateApplyingImplCopyWith<$Res> {
  factory _$$MutationStateApplyingImplCopyWith(
          _$MutationStateApplyingImpl value,
          $Res Function(_$MutationStateApplyingImpl) then) =
      __$$MutationStateApplyingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MutationStateApplyingImplCopyWithImpl<$Res>
    extends _$MutationStateCopyWithImpl<$Res, _$MutationStateApplyingImpl>
    implements _$$MutationStateApplyingImplCopyWith<$Res> {
  __$$MutationStateApplyingImplCopyWithImpl(_$MutationStateApplyingImpl _value,
      $Res Function(_$MutationStateApplyingImpl) _then)
      : super(_value, _then);

  /// Create a copy of MutationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MutationStateApplyingImpl implements MutationStateApplying {
  const _$MutationStateApplyingImpl();

  @override
  String toString() {
    return 'MutationState.applying()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MutationStateApplyingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() drawing,
    required TResult Function(List<Mutation> options) selecting,
    required TResult Function() applying,
    required TResult Function(Mutation applied) done,
    required TResult Function(String message) error,
  }) {
    return applying();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? drawing,
    TResult? Function(List<Mutation> options)? selecting,
    TResult? Function()? applying,
    TResult? Function(Mutation applied)? done,
    TResult? Function(String message)? error,
  }) {
    return applying?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? drawing,
    TResult Function(List<Mutation> options)? selecting,
    TResult Function()? applying,
    TResult Function(Mutation applied)? done,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (applying != null) {
      return applying();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MutationStateIdle value) idle,
    required TResult Function(MutationStateDrawing value) drawing,
    required TResult Function(MutationStateSelecting value) selecting,
    required TResult Function(MutationStateApplying value) applying,
    required TResult Function(MutationStateDone value) done,
    required TResult Function(MutationStateError value) error,
  }) {
    return applying(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MutationStateIdle value)? idle,
    TResult? Function(MutationStateDrawing value)? drawing,
    TResult? Function(MutationStateSelecting value)? selecting,
    TResult? Function(MutationStateApplying value)? applying,
    TResult? Function(MutationStateDone value)? done,
    TResult? Function(MutationStateError value)? error,
  }) {
    return applying?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MutationStateIdle value)? idle,
    TResult Function(MutationStateDrawing value)? drawing,
    TResult Function(MutationStateSelecting value)? selecting,
    TResult Function(MutationStateApplying value)? applying,
    TResult Function(MutationStateDone value)? done,
    TResult Function(MutationStateError value)? error,
    required TResult orElse(),
  }) {
    if (applying != null) {
      return applying(this);
    }
    return orElse();
  }
}

abstract class MutationStateApplying implements MutationState {
  const factory MutationStateApplying() = _$MutationStateApplyingImpl;
}

/// @nodoc
abstract class _$$MutationStateDoneImplCopyWith<$Res> {
  factory _$$MutationStateDoneImplCopyWith(_$MutationStateDoneImpl value,
          $Res Function(_$MutationStateDoneImpl) then) =
      __$$MutationStateDoneImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Mutation applied});

  $MutationCopyWith<$Res> get applied;
}

/// @nodoc
class __$$MutationStateDoneImplCopyWithImpl<$Res>
    extends _$MutationStateCopyWithImpl<$Res, _$MutationStateDoneImpl>
    implements _$$MutationStateDoneImplCopyWith<$Res> {
  __$$MutationStateDoneImplCopyWithImpl(_$MutationStateDoneImpl _value,
      $Res Function(_$MutationStateDoneImpl) _then)
      : super(_value, _then);

  /// Create a copy of MutationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applied = null,
  }) {
    return _then(_$MutationStateDoneImpl(
      applied: null == applied
          ? _value.applied
          : applied // ignore: cast_nullable_to_non_nullable
              as Mutation,
    ));
  }

  /// Create a copy of MutationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MutationCopyWith<$Res> get applied {
    return $MutationCopyWith<$Res>(_value.applied, (value) {
      return _then(_value.copyWith(applied: value));
    });
  }
}

/// @nodoc

class _$MutationStateDoneImpl implements MutationStateDone {
  const _$MutationStateDoneImpl({required this.applied});

  @override
  final Mutation applied;

  @override
  String toString() {
    return 'MutationState.done(applied: $applied)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MutationStateDoneImpl &&
            (identical(other.applied, applied) || other.applied == applied));
  }

  @override
  int get hashCode => Object.hash(runtimeType, applied);

  /// Create a copy of MutationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MutationStateDoneImplCopyWith<_$MutationStateDoneImpl> get copyWith =>
      __$$MutationStateDoneImplCopyWithImpl<_$MutationStateDoneImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() drawing,
    required TResult Function(List<Mutation> options) selecting,
    required TResult Function() applying,
    required TResult Function(Mutation applied) done,
    required TResult Function(String message) error,
  }) {
    return done(applied);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? drawing,
    TResult? Function(List<Mutation> options)? selecting,
    TResult? Function()? applying,
    TResult? Function(Mutation applied)? done,
    TResult? Function(String message)? error,
  }) {
    return done?.call(applied);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? drawing,
    TResult Function(List<Mutation> options)? selecting,
    TResult Function()? applying,
    TResult Function(Mutation applied)? done,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(applied);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MutationStateIdle value) idle,
    required TResult Function(MutationStateDrawing value) drawing,
    required TResult Function(MutationStateSelecting value) selecting,
    required TResult Function(MutationStateApplying value) applying,
    required TResult Function(MutationStateDone value) done,
    required TResult Function(MutationStateError value) error,
  }) {
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MutationStateIdle value)? idle,
    TResult? Function(MutationStateDrawing value)? drawing,
    TResult? Function(MutationStateSelecting value)? selecting,
    TResult? Function(MutationStateApplying value)? applying,
    TResult? Function(MutationStateDone value)? done,
    TResult? Function(MutationStateError value)? error,
  }) {
    return done?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MutationStateIdle value)? idle,
    TResult Function(MutationStateDrawing value)? drawing,
    TResult Function(MutationStateSelecting value)? selecting,
    TResult Function(MutationStateApplying value)? applying,
    TResult Function(MutationStateDone value)? done,
    TResult Function(MutationStateError value)? error,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(this);
    }
    return orElse();
  }
}

abstract class MutationStateDone implements MutationState {
  const factory MutationStateDone({required final Mutation applied}) =
      _$MutationStateDoneImpl;

  Mutation get applied;

  /// Create a copy of MutationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MutationStateDoneImplCopyWith<_$MutationStateDoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MutationStateErrorImplCopyWith<$Res> {
  factory _$$MutationStateErrorImplCopyWith(_$MutationStateErrorImpl value,
          $Res Function(_$MutationStateErrorImpl) then) =
      __$$MutationStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$MutationStateErrorImplCopyWithImpl<$Res>
    extends _$MutationStateCopyWithImpl<$Res, _$MutationStateErrorImpl>
    implements _$$MutationStateErrorImplCopyWith<$Res> {
  __$$MutationStateErrorImplCopyWithImpl(_$MutationStateErrorImpl _value,
      $Res Function(_$MutationStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of MutationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$MutationStateErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MutationStateErrorImpl implements MutationStateError {
  const _$MutationStateErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'MutationState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MutationStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of MutationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MutationStateErrorImplCopyWith<_$MutationStateErrorImpl> get copyWith =>
      __$$MutationStateErrorImplCopyWithImpl<_$MutationStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() drawing,
    required TResult Function(List<Mutation> options) selecting,
    required TResult Function() applying,
    required TResult Function(Mutation applied) done,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? drawing,
    TResult? Function(List<Mutation> options)? selecting,
    TResult? Function()? applying,
    TResult? Function(Mutation applied)? done,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? drawing,
    TResult Function(List<Mutation> options)? selecting,
    TResult Function()? applying,
    TResult Function(Mutation applied)? done,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MutationStateIdle value) idle,
    required TResult Function(MutationStateDrawing value) drawing,
    required TResult Function(MutationStateSelecting value) selecting,
    required TResult Function(MutationStateApplying value) applying,
    required TResult Function(MutationStateDone value) done,
    required TResult Function(MutationStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MutationStateIdle value)? idle,
    TResult? Function(MutationStateDrawing value)? drawing,
    TResult? Function(MutationStateSelecting value)? selecting,
    TResult? Function(MutationStateApplying value)? applying,
    TResult? Function(MutationStateDone value)? done,
    TResult? Function(MutationStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MutationStateIdle value)? idle,
    TResult Function(MutationStateDrawing value)? drawing,
    TResult Function(MutationStateSelecting value)? selecting,
    TResult Function(MutationStateApplying value)? applying,
    TResult Function(MutationStateDone value)? done,
    TResult Function(MutationStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class MutationStateError implements MutationState {
  const factory MutationStateError(final String message) =
      _$MutationStateErrorImpl;

  String get message;

  /// Create a copy of MutationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MutationStateErrorImplCopyWith<_$MutationStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

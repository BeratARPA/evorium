// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'creature_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreatureState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Creature creature) alive,
    required TResult Function(Creature creature, String cause) dead,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Creature creature)? alive,
    TResult? Function(Creature creature, String cause)? dead,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Creature creature)? alive,
    TResult Function(Creature creature, String cause)? dead,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreatureStateInitial value) initial,
    required TResult Function(CreatureStateLoading value) loading,
    required TResult Function(CreatureStateAlive value) alive,
    required TResult Function(CreatureStateDead value) dead,
    required TResult Function(CreatureStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreatureStateInitial value)? initial,
    TResult? Function(CreatureStateLoading value)? loading,
    TResult? Function(CreatureStateAlive value)? alive,
    TResult? Function(CreatureStateDead value)? dead,
    TResult? Function(CreatureStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreatureStateInitial value)? initial,
    TResult Function(CreatureStateLoading value)? loading,
    TResult Function(CreatureStateAlive value)? alive,
    TResult Function(CreatureStateDead value)? dead,
    TResult Function(CreatureStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatureStateCopyWith<$Res> {
  factory $CreatureStateCopyWith(
          CreatureState value, $Res Function(CreatureState) then) =
      _$CreatureStateCopyWithImpl<$Res, CreatureState>;
}

/// @nodoc
class _$CreatureStateCopyWithImpl<$Res, $Val extends CreatureState>
    implements $CreatureStateCopyWith<$Res> {
  _$CreatureStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatureState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CreatureStateInitialImplCopyWith<$Res> {
  factory _$$CreatureStateInitialImplCopyWith(_$CreatureStateInitialImpl value,
          $Res Function(_$CreatureStateInitialImpl) then) =
      __$$CreatureStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreatureStateInitialImplCopyWithImpl<$Res>
    extends _$CreatureStateCopyWithImpl<$Res, _$CreatureStateInitialImpl>
    implements _$$CreatureStateInitialImplCopyWith<$Res> {
  __$$CreatureStateInitialImplCopyWithImpl(_$CreatureStateInitialImpl _value,
      $Res Function(_$CreatureStateInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreatureState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CreatureStateInitialImpl implements CreatureStateInitial {
  const _$CreatureStateInitialImpl();

  @override
  String toString() {
    return 'CreatureState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatureStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Creature creature) alive,
    required TResult Function(Creature creature, String cause) dead,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Creature creature)? alive,
    TResult? Function(Creature creature, String cause)? dead,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Creature creature)? alive,
    TResult Function(Creature creature, String cause)? dead,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreatureStateInitial value) initial,
    required TResult Function(CreatureStateLoading value) loading,
    required TResult Function(CreatureStateAlive value) alive,
    required TResult Function(CreatureStateDead value) dead,
    required TResult Function(CreatureStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreatureStateInitial value)? initial,
    TResult? Function(CreatureStateLoading value)? loading,
    TResult? Function(CreatureStateAlive value)? alive,
    TResult? Function(CreatureStateDead value)? dead,
    TResult? Function(CreatureStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreatureStateInitial value)? initial,
    TResult Function(CreatureStateLoading value)? loading,
    TResult Function(CreatureStateAlive value)? alive,
    TResult Function(CreatureStateDead value)? dead,
    TResult Function(CreatureStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CreatureStateInitial implements CreatureState {
  const factory CreatureStateInitial() = _$CreatureStateInitialImpl;
}

/// @nodoc
abstract class _$$CreatureStateLoadingImplCopyWith<$Res> {
  factory _$$CreatureStateLoadingImplCopyWith(_$CreatureStateLoadingImpl value,
          $Res Function(_$CreatureStateLoadingImpl) then) =
      __$$CreatureStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreatureStateLoadingImplCopyWithImpl<$Res>
    extends _$CreatureStateCopyWithImpl<$Res, _$CreatureStateLoadingImpl>
    implements _$$CreatureStateLoadingImplCopyWith<$Res> {
  __$$CreatureStateLoadingImplCopyWithImpl(_$CreatureStateLoadingImpl _value,
      $Res Function(_$CreatureStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreatureState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CreatureStateLoadingImpl implements CreatureStateLoading {
  const _$CreatureStateLoadingImpl();

  @override
  String toString() {
    return 'CreatureState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatureStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Creature creature) alive,
    required TResult Function(Creature creature, String cause) dead,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Creature creature)? alive,
    TResult? Function(Creature creature, String cause)? dead,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Creature creature)? alive,
    TResult Function(Creature creature, String cause)? dead,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreatureStateInitial value) initial,
    required TResult Function(CreatureStateLoading value) loading,
    required TResult Function(CreatureStateAlive value) alive,
    required TResult Function(CreatureStateDead value) dead,
    required TResult Function(CreatureStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreatureStateInitial value)? initial,
    TResult? Function(CreatureStateLoading value)? loading,
    TResult? Function(CreatureStateAlive value)? alive,
    TResult? Function(CreatureStateDead value)? dead,
    TResult? Function(CreatureStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreatureStateInitial value)? initial,
    TResult Function(CreatureStateLoading value)? loading,
    TResult Function(CreatureStateAlive value)? alive,
    TResult Function(CreatureStateDead value)? dead,
    TResult Function(CreatureStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CreatureStateLoading implements CreatureState {
  const factory CreatureStateLoading() = _$CreatureStateLoadingImpl;
}

/// @nodoc
abstract class _$$CreatureStateAliveImplCopyWith<$Res> {
  factory _$$CreatureStateAliveImplCopyWith(_$CreatureStateAliveImpl value,
          $Res Function(_$CreatureStateAliveImpl) then) =
      __$$CreatureStateAliveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Creature creature});

  $CreatureCopyWith<$Res> get creature;
}

/// @nodoc
class __$$CreatureStateAliveImplCopyWithImpl<$Res>
    extends _$CreatureStateCopyWithImpl<$Res, _$CreatureStateAliveImpl>
    implements _$$CreatureStateAliveImplCopyWith<$Res> {
  __$$CreatureStateAliveImplCopyWithImpl(_$CreatureStateAliveImpl _value,
      $Res Function(_$CreatureStateAliveImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreatureState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creature = null,
  }) {
    return _then(_$CreatureStateAliveImpl(
      creature: null == creature
          ? _value.creature
          : creature // ignore: cast_nullable_to_non_nullable
              as Creature,
    ));
  }

  /// Create a copy of CreatureState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreatureCopyWith<$Res> get creature {
    return $CreatureCopyWith<$Res>(_value.creature, (value) {
      return _then(_value.copyWith(creature: value));
    });
  }
}

/// @nodoc

class _$CreatureStateAliveImpl implements CreatureStateAlive {
  const _$CreatureStateAliveImpl({required this.creature});

  @override
  final Creature creature;

  @override
  String toString() {
    return 'CreatureState.alive(creature: $creature)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatureStateAliveImpl &&
            (identical(other.creature, creature) ||
                other.creature == creature));
  }

  @override
  int get hashCode => Object.hash(runtimeType, creature);

  /// Create a copy of CreatureState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatureStateAliveImplCopyWith<_$CreatureStateAliveImpl> get copyWith =>
      __$$CreatureStateAliveImplCopyWithImpl<_$CreatureStateAliveImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Creature creature) alive,
    required TResult Function(Creature creature, String cause) dead,
    required TResult Function(String message) error,
  }) {
    return alive(creature);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Creature creature)? alive,
    TResult? Function(Creature creature, String cause)? dead,
    TResult? Function(String message)? error,
  }) {
    return alive?.call(creature);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Creature creature)? alive,
    TResult Function(Creature creature, String cause)? dead,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (alive != null) {
      return alive(creature);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreatureStateInitial value) initial,
    required TResult Function(CreatureStateLoading value) loading,
    required TResult Function(CreatureStateAlive value) alive,
    required TResult Function(CreatureStateDead value) dead,
    required TResult Function(CreatureStateError value) error,
  }) {
    return alive(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreatureStateInitial value)? initial,
    TResult? Function(CreatureStateLoading value)? loading,
    TResult? Function(CreatureStateAlive value)? alive,
    TResult? Function(CreatureStateDead value)? dead,
    TResult? Function(CreatureStateError value)? error,
  }) {
    return alive?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreatureStateInitial value)? initial,
    TResult Function(CreatureStateLoading value)? loading,
    TResult Function(CreatureStateAlive value)? alive,
    TResult Function(CreatureStateDead value)? dead,
    TResult Function(CreatureStateError value)? error,
    required TResult orElse(),
  }) {
    if (alive != null) {
      return alive(this);
    }
    return orElse();
  }
}

abstract class CreatureStateAlive implements CreatureState {
  const factory CreatureStateAlive({required final Creature creature}) =
      _$CreatureStateAliveImpl;

  Creature get creature;

  /// Create a copy of CreatureState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatureStateAliveImplCopyWith<_$CreatureStateAliveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreatureStateDeadImplCopyWith<$Res> {
  factory _$$CreatureStateDeadImplCopyWith(_$CreatureStateDeadImpl value,
          $Res Function(_$CreatureStateDeadImpl) then) =
      __$$CreatureStateDeadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Creature creature, String cause});

  $CreatureCopyWith<$Res> get creature;
}

/// @nodoc
class __$$CreatureStateDeadImplCopyWithImpl<$Res>
    extends _$CreatureStateCopyWithImpl<$Res, _$CreatureStateDeadImpl>
    implements _$$CreatureStateDeadImplCopyWith<$Res> {
  __$$CreatureStateDeadImplCopyWithImpl(_$CreatureStateDeadImpl _value,
      $Res Function(_$CreatureStateDeadImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreatureState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creature = null,
    Object? cause = null,
  }) {
    return _then(_$CreatureStateDeadImpl(
      creature: null == creature
          ? _value.creature
          : creature // ignore: cast_nullable_to_non_nullable
              as Creature,
      cause: null == cause
          ? _value.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of CreatureState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreatureCopyWith<$Res> get creature {
    return $CreatureCopyWith<$Res>(_value.creature, (value) {
      return _then(_value.copyWith(creature: value));
    });
  }
}

/// @nodoc

class _$CreatureStateDeadImpl implements CreatureStateDead {
  const _$CreatureStateDeadImpl({required this.creature, required this.cause});

  @override
  final Creature creature;
  @override
  final String cause;

  @override
  String toString() {
    return 'CreatureState.dead(creature: $creature, cause: $cause)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatureStateDeadImpl &&
            (identical(other.creature, creature) ||
                other.creature == creature) &&
            (identical(other.cause, cause) || other.cause == cause));
  }

  @override
  int get hashCode => Object.hash(runtimeType, creature, cause);

  /// Create a copy of CreatureState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatureStateDeadImplCopyWith<_$CreatureStateDeadImpl> get copyWith =>
      __$$CreatureStateDeadImplCopyWithImpl<_$CreatureStateDeadImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Creature creature) alive,
    required TResult Function(Creature creature, String cause) dead,
    required TResult Function(String message) error,
  }) {
    return dead(creature, cause);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Creature creature)? alive,
    TResult? Function(Creature creature, String cause)? dead,
    TResult? Function(String message)? error,
  }) {
    return dead?.call(creature, cause);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Creature creature)? alive,
    TResult Function(Creature creature, String cause)? dead,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (dead != null) {
      return dead(creature, cause);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreatureStateInitial value) initial,
    required TResult Function(CreatureStateLoading value) loading,
    required TResult Function(CreatureStateAlive value) alive,
    required TResult Function(CreatureStateDead value) dead,
    required TResult Function(CreatureStateError value) error,
  }) {
    return dead(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreatureStateInitial value)? initial,
    TResult? Function(CreatureStateLoading value)? loading,
    TResult? Function(CreatureStateAlive value)? alive,
    TResult? Function(CreatureStateDead value)? dead,
    TResult? Function(CreatureStateError value)? error,
  }) {
    return dead?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreatureStateInitial value)? initial,
    TResult Function(CreatureStateLoading value)? loading,
    TResult Function(CreatureStateAlive value)? alive,
    TResult Function(CreatureStateDead value)? dead,
    TResult Function(CreatureStateError value)? error,
    required TResult orElse(),
  }) {
    if (dead != null) {
      return dead(this);
    }
    return orElse();
  }
}

abstract class CreatureStateDead implements CreatureState {
  const factory CreatureStateDead(
      {required final Creature creature,
      required final String cause}) = _$CreatureStateDeadImpl;

  Creature get creature;
  String get cause;

  /// Create a copy of CreatureState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatureStateDeadImplCopyWith<_$CreatureStateDeadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreatureStateErrorImplCopyWith<$Res> {
  factory _$$CreatureStateErrorImplCopyWith(_$CreatureStateErrorImpl value,
          $Res Function(_$CreatureStateErrorImpl) then) =
      __$$CreatureStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CreatureStateErrorImplCopyWithImpl<$Res>
    extends _$CreatureStateCopyWithImpl<$Res, _$CreatureStateErrorImpl>
    implements _$$CreatureStateErrorImplCopyWith<$Res> {
  __$$CreatureStateErrorImplCopyWithImpl(_$CreatureStateErrorImpl _value,
      $Res Function(_$CreatureStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreatureState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$CreatureStateErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreatureStateErrorImpl implements CreatureStateError {
  const _$CreatureStateErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'CreatureState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatureStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of CreatureState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatureStateErrorImplCopyWith<_$CreatureStateErrorImpl> get copyWith =>
      __$$CreatureStateErrorImplCopyWithImpl<_$CreatureStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Creature creature) alive,
    required TResult Function(Creature creature, String cause) dead,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Creature creature)? alive,
    TResult? Function(Creature creature, String cause)? dead,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Creature creature)? alive,
    TResult Function(Creature creature, String cause)? dead,
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
    required TResult Function(CreatureStateInitial value) initial,
    required TResult Function(CreatureStateLoading value) loading,
    required TResult Function(CreatureStateAlive value) alive,
    required TResult Function(CreatureStateDead value) dead,
    required TResult Function(CreatureStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreatureStateInitial value)? initial,
    TResult? Function(CreatureStateLoading value)? loading,
    TResult? Function(CreatureStateAlive value)? alive,
    TResult? Function(CreatureStateDead value)? dead,
    TResult? Function(CreatureStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreatureStateInitial value)? initial,
    TResult Function(CreatureStateLoading value)? loading,
    TResult Function(CreatureStateAlive value)? alive,
    TResult Function(CreatureStateDead value)? dead,
    TResult Function(CreatureStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CreatureStateError implements CreatureState {
  const factory CreatureStateError(final String message) =
      _$CreatureStateErrorImpl;

  String get message;

  /// Create a copy of CreatureState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatureStateErrorImplCopyWith<_$CreatureStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

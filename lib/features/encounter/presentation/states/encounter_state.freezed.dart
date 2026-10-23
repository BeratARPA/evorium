// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'encounter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EncounterState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
            Encounter encounter, List<EncounterChoice> availableChoices)
        active,
    required TResult Function(Encounter encounter, EncounterChoice choice)
        resolving,
    required TResult Function(Encounter encounter, EncounterResult result)
        resolved,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(
            Encounter encounter, List<EncounterChoice> availableChoices)?
        active,
    TResult? Function(Encounter encounter, EncounterChoice choice)? resolving,
    TResult? Function(Encounter encounter, EncounterResult result)? resolved,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
            Encounter encounter, List<EncounterChoice> availableChoices)?
        active,
    TResult Function(Encounter encounter, EncounterChoice choice)? resolving,
    TResult Function(Encounter encounter, EncounterResult result)? resolved,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EncounterStateIdle value) idle,
    required TResult Function(EncounterStateActive value) active,
    required TResult Function(EncounterStateResolving value) resolving,
    required TResult Function(EncounterStateResolved value) resolved,
    required TResult Function(EncounterStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EncounterStateIdle value)? idle,
    TResult? Function(EncounterStateActive value)? active,
    TResult? Function(EncounterStateResolving value)? resolving,
    TResult? Function(EncounterStateResolved value)? resolved,
    TResult? Function(EncounterStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EncounterStateIdle value)? idle,
    TResult Function(EncounterStateActive value)? active,
    TResult Function(EncounterStateResolving value)? resolving,
    TResult Function(EncounterStateResolved value)? resolved,
    TResult Function(EncounterStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EncounterStateCopyWith<$Res> {
  factory $EncounterStateCopyWith(
          EncounterState value, $Res Function(EncounterState) then) =
      _$EncounterStateCopyWithImpl<$Res, EncounterState>;
}

/// @nodoc
class _$EncounterStateCopyWithImpl<$Res, $Val extends EncounterState>
    implements $EncounterStateCopyWith<$Res> {
  _$EncounterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EncounterState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$EncounterStateIdleImplCopyWith<$Res> {
  factory _$$EncounterStateIdleImplCopyWith(_$EncounterStateIdleImpl value,
          $Res Function(_$EncounterStateIdleImpl) then) =
      __$$EncounterStateIdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EncounterStateIdleImplCopyWithImpl<$Res>
    extends _$EncounterStateCopyWithImpl<$Res, _$EncounterStateIdleImpl>
    implements _$$EncounterStateIdleImplCopyWith<$Res> {
  __$$EncounterStateIdleImplCopyWithImpl(_$EncounterStateIdleImpl _value,
      $Res Function(_$EncounterStateIdleImpl) _then)
      : super(_value, _then);

  /// Create a copy of EncounterState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EncounterStateIdleImpl implements EncounterStateIdle {
  const _$EncounterStateIdleImpl();

  @override
  String toString() {
    return 'EncounterState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EncounterStateIdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
            Encounter encounter, List<EncounterChoice> availableChoices)
        active,
    required TResult Function(Encounter encounter, EncounterChoice choice)
        resolving,
    required TResult Function(Encounter encounter, EncounterResult result)
        resolved,
    required TResult Function(String message) error,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(
            Encounter encounter, List<EncounterChoice> availableChoices)?
        active,
    TResult? Function(Encounter encounter, EncounterChoice choice)? resolving,
    TResult? Function(Encounter encounter, EncounterResult result)? resolved,
    TResult? Function(String message)? error,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
            Encounter encounter, List<EncounterChoice> availableChoices)?
        active,
    TResult Function(Encounter encounter, EncounterChoice choice)? resolving,
    TResult Function(Encounter encounter, EncounterResult result)? resolved,
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
    required TResult Function(EncounterStateIdle value) idle,
    required TResult Function(EncounterStateActive value) active,
    required TResult Function(EncounterStateResolving value) resolving,
    required TResult Function(EncounterStateResolved value) resolved,
    required TResult Function(EncounterStateError value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EncounterStateIdle value)? idle,
    TResult? Function(EncounterStateActive value)? active,
    TResult? Function(EncounterStateResolving value)? resolving,
    TResult? Function(EncounterStateResolved value)? resolved,
    TResult? Function(EncounterStateError value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EncounterStateIdle value)? idle,
    TResult Function(EncounterStateActive value)? active,
    TResult Function(EncounterStateResolving value)? resolving,
    TResult Function(EncounterStateResolved value)? resolved,
    TResult Function(EncounterStateError value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class EncounterStateIdle implements EncounterState {
  const factory EncounterStateIdle() = _$EncounterStateIdleImpl;
}

/// @nodoc
abstract class _$$EncounterStateActiveImplCopyWith<$Res> {
  factory _$$EncounterStateActiveImplCopyWith(_$EncounterStateActiveImpl value,
          $Res Function(_$EncounterStateActiveImpl) then) =
      __$$EncounterStateActiveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Encounter encounter, List<EncounterChoice> availableChoices});
}

/// @nodoc
class __$$EncounterStateActiveImplCopyWithImpl<$Res>
    extends _$EncounterStateCopyWithImpl<$Res, _$EncounterStateActiveImpl>
    implements _$$EncounterStateActiveImplCopyWith<$Res> {
  __$$EncounterStateActiveImplCopyWithImpl(_$EncounterStateActiveImpl _value,
      $Res Function(_$EncounterStateActiveImpl) _then)
      : super(_value, _then);

  /// Create a copy of EncounterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? encounter = null,
    Object? availableChoices = null,
  }) {
    return _then(_$EncounterStateActiveImpl(
      encounter: null == encounter
          ? _value.encounter
          : encounter // ignore: cast_nullable_to_non_nullable
              as Encounter,
      availableChoices: null == availableChoices
          ? _value._availableChoices
          : availableChoices // ignore: cast_nullable_to_non_nullable
              as List<EncounterChoice>,
    ));
  }
}

/// @nodoc

class _$EncounterStateActiveImpl implements EncounterStateActive {
  const _$EncounterStateActiveImpl(
      {required this.encounter,
      required final List<EncounterChoice> availableChoices})
      : _availableChoices = availableChoices;

  @override
  final Encounter encounter;
  final List<EncounterChoice> _availableChoices;
  @override
  List<EncounterChoice> get availableChoices {
    if (_availableChoices is EqualUnmodifiableListView)
      return _availableChoices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableChoices);
  }

  @override
  String toString() {
    return 'EncounterState.active(encounter: $encounter, availableChoices: $availableChoices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EncounterStateActiveImpl &&
            (identical(other.encounter, encounter) ||
                other.encounter == encounter) &&
            const DeepCollectionEquality()
                .equals(other._availableChoices, _availableChoices));
  }

  @override
  int get hashCode => Object.hash(runtimeType, encounter,
      const DeepCollectionEquality().hash(_availableChoices));

  /// Create a copy of EncounterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EncounterStateActiveImplCopyWith<_$EncounterStateActiveImpl>
      get copyWith =>
          __$$EncounterStateActiveImplCopyWithImpl<_$EncounterStateActiveImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
            Encounter encounter, List<EncounterChoice> availableChoices)
        active,
    required TResult Function(Encounter encounter, EncounterChoice choice)
        resolving,
    required TResult Function(Encounter encounter, EncounterResult result)
        resolved,
    required TResult Function(String message) error,
  }) {
    return active(encounter, availableChoices);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(
            Encounter encounter, List<EncounterChoice> availableChoices)?
        active,
    TResult? Function(Encounter encounter, EncounterChoice choice)? resolving,
    TResult? Function(Encounter encounter, EncounterResult result)? resolved,
    TResult? Function(String message)? error,
  }) {
    return active?.call(encounter, availableChoices);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
            Encounter encounter, List<EncounterChoice> availableChoices)?
        active,
    TResult Function(Encounter encounter, EncounterChoice choice)? resolving,
    TResult Function(Encounter encounter, EncounterResult result)? resolved,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active(encounter, availableChoices);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EncounterStateIdle value) idle,
    required TResult Function(EncounterStateActive value) active,
    required TResult Function(EncounterStateResolving value) resolving,
    required TResult Function(EncounterStateResolved value) resolved,
    required TResult Function(EncounterStateError value) error,
  }) {
    return active(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EncounterStateIdle value)? idle,
    TResult? Function(EncounterStateActive value)? active,
    TResult? Function(EncounterStateResolving value)? resolving,
    TResult? Function(EncounterStateResolved value)? resolved,
    TResult? Function(EncounterStateError value)? error,
  }) {
    return active?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EncounterStateIdle value)? idle,
    TResult Function(EncounterStateActive value)? active,
    TResult Function(EncounterStateResolving value)? resolving,
    TResult Function(EncounterStateResolved value)? resolved,
    TResult Function(EncounterStateError value)? error,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active(this);
    }
    return orElse();
  }
}

abstract class EncounterStateActive implements EncounterState {
  const factory EncounterStateActive(
          {required final Encounter encounter,
          required final List<EncounterChoice> availableChoices}) =
      _$EncounterStateActiveImpl;

  Encounter get encounter;
  List<EncounterChoice> get availableChoices;

  /// Create a copy of EncounterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EncounterStateActiveImplCopyWith<_$EncounterStateActiveImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EncounterStateResolvingImplCopyWith<$Res> {
  factory _$$EncounterStateResolvingImplCopyWith(
          _$EncounterStateResolvingImpl value,
          $Res Function(_$EncounterStateResolvingImpl) then) =
      __$$EncounterStateResolvingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Encounter encounter, EncounterChoice choice});
}

/// @nodoc
class __$$EncounterStateResolvingImplCopyWithImpl<$Res>
    extends _$EncounterStateCopyWithImpl<$Res, _$EncounterStateResolvingImpl>
    implements _$$EncounterStateResolvingImplCopyWith<$Res> {
  __$$EncounterStateResolvingImplCopyWithImpl(
      _$EncounterStateResolvingImpl _value,
      $Res Function(_$EncounterStateResolvingImpl) _then)
      : super(_value, _then);

  /// Create a copy of EncounterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? encounter = null,
    Object? choice = null,
  }) {
    return _then(_$EncounterStateResolvingImpl(
      encounter: null == encounter
          ? _value.encounter
          : encounter // ignore: cast_nullable_to_non_nullable
              as Encounter,
      choice: null == choice
          ? _value.choice
          : choice // ignore: cast_nullable_to_non_nullable
              as EncounterChoice,
    ));
  }
}

/// @nodoc

class _$EncounterStateResolvingImpl implements EncounterStateResolving {
  const _$EncounterStateResolvingImpl(
      {required this.encounter, required this.choice});

  @override
  final Encounter encounter;
  @override
  final EncounterChoice choice;

  @override
  String toString() {
    return 'EncounterState.resolving(encounter: $encounter, choice: $choice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EncounterStateResolvingImpl &&
            (identical(other.encounter, encounter) ||
                other.encounter == encounter) &&
            (identical(other.choice, choice) || other.choice == choice));
  }

  @override
  int get hashCode => Object.hash(runtimeType, encounter, choice);

  /// Create a copy of EncounterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EncounterStateResolvingImplCopyWith<_$EncounterStateResolvingImpl>
      get copyWith => __$$EncounterStateResolvingImplCopyWithImpl<
          _$EncounterStateResolvingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
            Encounter encounter, List<EncounterChoice> availableChoices)
        active,
    required TResult Function(Encounter encounter, EncounterChoice choice)
        resolving,
    required TResult Function(Encounter encounter, EncounterResult result)
        resolved,
    required TResult Function(String message) error,
  }) {
    return resolving(encounter, choice);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(
            Encounter encounter, List<EncounterChoice> availableChoices)?
        active,
    TResult? Function(Encounter encounter, EncounterChoice choice)? resolving,
    TResult? Function(Encounter encounter, EncounterResult result)? resolved,
    TResult? Function(String message)? error,
  }) {
    return resolving?.call(encounter, choice);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
            Encounter encounter, List<EncounterChoice> availableChoices)?
        active,
    TResult Function(Encounter encounter, EncounterChoice choice)? resolving,
    TResult Function(Encounter encounter, EncounterResult result)? resolved,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (resolving != null) {
      return resolving(encounter, choice);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EncounterStateIdle value) idle,
    required TResult Function(EncounterStateActive value) active,
    required TResult Function(EncounterStateResolving value) resolving,
    required TResult Function(EncounterStateResolved value) resolved,
    required TResult Function(EncounterStateError value) error,
  }) {
    return resolving(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EncounterStateIdle value)? idle,
    TResult? Function(EncounterStateActive value)? active,
    TResult? Function(EncounterStateResolving value)? resolving,
    TResult? Function(EncounterStateResolved value)? resolved,
    TResult? Function(EncounterStateError value)? error,
  }) {
    return resolving?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EncounterStateIdle value)? idle,
    TResult Function(EncounterStateActive value)? active,
    TResult Function(EncounterStateResolving value)? resolving,
    TResult Function(EncounterStateResolved value)? resolved,
    TResult Function(EncounterStateError value)? error,
    required TResult orElse(),
  }) {
    if (resolving != null) {
      return resolving(this);
    }
    return orElse();
  }
}

abstract class EncounterStateResolving implements EncounterState {
  const factory EncounterStateResolving(
      {required final Encounter encounter,
      required final EncounterChoice choice}) = _$EncounterStateResolvingImpl;

  Encounter get encounter;
  EncounterChoice get choice;

  /// Create a copy of EncounterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EncounterStateResolvingImplCopyWith<_$EncounterStateResolvingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EncounterStateResolvedImplCopyWith<$Res> {
  factory _$$EncounterStateResolvedImplCopyWith(
          _$EncounterStateResolvedImpl value,
          $Res Function(_$EncounterStateResolvedImpl) then) =
      __$$EncounterStateResolvedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Encounter encounter, EncounterResult result});
}

/// @nodoc
class __$$EncounterStateResolvedImplCopyWithImpl<$Res>
    extends _$EncounterStateCopyWithImpl<$Res, _$EncounterStateResolvedImpl>
    implements _$$EncounterStateResolvedImplCopyWith<$Res> {
  __$$EncounterStateResolvedImplCopyWithImpl(
      _$EncounterStateResolvedImpl _value,
      $Res Function(_$EncounterStateResolvedImpl) _then)
      : super(_value, _then);

  /// Create a copy of EncounterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? encounter = null,
    Object? result = null,
  }) {
    return _then(_$EncounterStateResolvedImpl(
      encounter: null == encounter
          ? _value.encounter
          : encounter // ignore: cast_nullable_to_non_nullable
              as Encounter,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as EncounterResult,
    ));
  }
}

/// @nodoc

class _$EncounterStateResolvedImpl implements EncounterStateResolved {
  const _$EncounterStateResolvedImpl(
      {required this.encounter, required this.result});

  @override
  final Encounter encounter;
  @override
  final EncounterResult result;

  @override
  String toString() {
    return 'EncounterState.resolved(encounter: $encounter, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EncounterStateResolvedImpl &&
            (identical(other.encounter, encounter) ||
                other.encounter == encounter) &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, encounter, result);

  /// Create a copy of EncounterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EncounterStateResolvedImplCopyWith<_$EncounterStateResolvedImpl>
      get copyWith => __$$EncounterStateResolvedImplCopyWithImpl<
          _$EncounterStateResolvedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
            Encounter encounter, List<EncounterChoice> availableChoices)
        active,
    required TResult Function(Encounter encounter, EncounterChoice choice)
        resolving,
    required TResult Function(Encounter encounter, EncounterResult result)
        resolved,
    required TResult Function(String message) error,
  }) {
    return resolved(encounter, result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(
            Encounter encounter, List<EncounterChoice> availableChoices)?
        active,
    TResult? Function(Encounter encounter, EncounterChoice choice)? resolving,
    TResult? Function(Encounter encounter, EncounterResult result)? resolved,
    TResult? Function(String message)? error,
  }) {
    return resolved?.call(encounter, result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
            Encounter encounter, List<EncounterChoice> availableChoices)?
        active,
    TResult Function(Encounter encounter, EncounterChoice choice)? resolving,
    TResult Function(Encounter encounter, EncounterResult result)? resolved,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (resolved != null) {
      return resolved(encounter, result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EncounterStateIdle value) idle,
    required TResult Function(EncounterStateActive value) active,
    required TResult Function(EncounterStateResolving value) resolving,
    required TResult Function(EncounterStateResolved value) resolved,
    required TResult Function(EncounterStateError value) error,
  }) {
    return resolved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EncounterStateIdle value)? idle,
    TResult? Function(EncounterStateActive value)? active,
    TResult? Function(EncounterStateResolving value)? resolving,
    TResult? Function(EncounterStateResolved value)? resolved,
    TResult? Function(EncounterStateError value)? error,
  }) {
    return resolved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EncounterStateIdle value)? idle,
    TResult Function(EncounterStateActive value)? active,
    TResult Function(EncounterStateResolving value)? resolving,
    TResult Function(EncounterStateResolved value)? resolved,
    TResult Function(EncounterStateError value)? error,
    required TResult orElse(),
  }) {
    if (resolved != null) {
      return resolved(this);
    }
    return orElse();
  }
}

abstract class EncounterStateResolved implements EncounterState {
  const factory EncounterStateResolved(
      {required final Encounter encounter,
      required final EncounterResult result}) = _$EncounterStateResolvedImpl;

  Encounter get encounter;
  EncounterResult get result;

  /// Create a copy of EncounterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EncounterStateResolvedImplCopyWith<_$EncounterStateResolvedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EncounterStateErrorImplCopyWith<$Res> {
  factory _$$EncounterStateErrorImplCopyWith(_$EncounterStateErrorImpl value,
          $Res Function(_$EncounterStateErrorImpl) then) =
      __$$EncounterStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$EncounterStateErrorImplCopyWithImpl<$Res>
    extends _$EncounterStateCopyWithImpl<$Res, _$EncounterStateErrorImpl>
    implements _$$EncounterStateErrorImplCopyWith<$Res> {
  __$$EncounterStateErrorImplCopyWithImpl(_$EncounterStateErrorImpl _value,
      $Res Function(_$EncounterStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of EncounterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$EncounterStateErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EncounterStateErrorImpl implements EncounterStateError {
  const _$EncounterStateErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'EncounterState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EncounterStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of EncounterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EncounterStateErrorImplCopyWith<_$EncounterStateErrorImpl> get copyWith =>
      __$$EncounterStateErrorImplCopyWithImpl<_$EncounterStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
            Encounter encounter, List<EncounterChoice> availableChoices)
        active,
    required TResult Function(Encounter encounter, EncounterChoice choice)
        resolving,
    required TResult Function(Encounter encounter, EncounterResult result)
        resolved,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(
            Encounter encounter, List<EncounterChoice> availableChoices)?
        active,
    TResult? Function(Encounter encounter, EncounterChoice choice)? resolving,
    TResult? Function(Encounter encounter, EncounterResult result)? resolved,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
            Encounter encounter, List<EncounterChoice> availableChoices)?
        active,
    TResult Function(Encounter encounter, EncounterChoice choice)? resolving,
    TResult Function(Encounter encounter, EncounterResult result)? resolved,
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
    required TResult Function(EncounterStateIdle value) idle,
    required TResult Function(EncounterStateActive value) active,
    required TResult Function(EncounterStateResolving value) resolving,
    required TResult Function(EncounterStateResolved value) resolved,
    required TResult Function(EncounterStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EncounterStateIdle value)? idle,
    TResult? Function(EncounterStateActive value)? active,
    TResult? Function(EncounterStateResolving value)? resolving,
    TResult? Function(EncounterStateResolved value)? resolved,
    TResult? Function(EncounterStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EncounterStateIdle value)? idle,
    TResult Function(EncounterStateActive value)? active,
    TResult Function(EncounterStateResolving value)? resolving,
    TResult Function(EncounterStateResolved value)? resolved,
    TResult Function(EncounterStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class EncounterStateError implements EncounterState {
  const factory EncounterStateError(final String message) =
      _$EncounterStateErrorImpl;

  String get message;

  /// Create a copy of EncounterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EncounterStateErrorImplCopyWith<_$EncounterStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

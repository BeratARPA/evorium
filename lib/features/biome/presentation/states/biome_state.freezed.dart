// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'biome_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BiomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Biome biome) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Biome biome)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Biome biome)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BiomeStateInitial value) initial,
    required TResult Function(BiomeStateLoading value) loading,
    required TResult Function(BiomeStateLoaded value) loaded,
    required TResult Function(BiomeStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BiomeStateInitial value)? initial,
    TResult? Function(BiomeStateLoading value)? loading,
    TResult? Function(BiomeStateLoaded value)? loaded,
    TResult? Function(BiomeStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BiomeStateInitial value)? initial,
    TResult Function(BiomeStateLoading value)? loading,
    TResult Function(BiomeStateLoaded value)? loaded,
    TResult Function(BiomeStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BiomeStateCopyWith<$Res> {
  factory $BiomeStateCopyWith(
          BiomeState value, $Res Function(BiomeState) then) =
      _$BiomeStateCopyWithImpl<$Res, BiomeState>;
}

/// @nodoc
class _$BiomeStateCopyWithImpl<$Res, $Val extends BiomeState>
    implements $BiomeStateCopyWith<$Res> {
  _$BiomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BiomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$BiomeStateInitialImplCopyWith<$Res> {
  factory _$$BiomeStateInitialImplCopyWith(_$BiomeStateInitialImpl value,
          $Res Function(_$BiomeStateInitialImpl) then) =
      __$$BiomeStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BiomeStateInitialImplCopyWithImpl<$Res>
    extends _$BiomeStateCopyWithImpl<$Res, _$BiomeStateInitialImpl>
    implements _$$BiomeStateInitialImplCopyWith<$Res> {
  __$$BiomeStateInitialImplCopyWithImpl(_$BiomeStateInitialImpl _value,
      $Res Function(_$BiomeStateInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of BiomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BiomeStateInitialImpl implements BiomeStateInitial {
  const _$BiomeStateInitialImpl();

  @override
  String toString() {
    return 'BiomeState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BiomeStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Biome biome) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Biome biome)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Biome biome)? loaded,
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
    required TResult Function(BiomeStateInitial value) initial,
    required TResult Function(BiomeStateLoading value) loading,
    required TResult Function(BiomeStateLoaded value) loaded,
    required TResult Function(BiomeStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BiomeStateInitial value)? initial,
    TResult? Function(BiomeStateLoading value)? loading,
    TResult? Function(BiomeStateLoaded value)? loaded,
    TResult? Function(BiomeStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BiomeStateInitial value)? initial,
    TResult Function(BiomeStateLoading value)? loading,
    TResult Function(BiomeStateLoaded value)? loaded,
    TResult Function(BiomeStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class BiomeStateInitial implements BiomeState {
  const factory BiomeStateInitial() = _$BiomeStateInitialImpl;
}

/// @nodoc
abstract class _$$BiomeStateLoadingImplCopyWith<$Res> {
  factory _$$BiomeStateLoadingImplCopyWith(_$BiomeStateLoadingImpl value,
          $Res Function(_$BiomeStateLoadingImpl) then) =
      __$$BiomeStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BiomeStateLoadingImplCopyWithImpl<$Res>
    extends _$BiomeStateCopyWithImpl<$Res, _$BiomeStateLoadingImpl>
    implements _$$BiomeStateLoadingImplCopyWith<$Res> {
  __$$BiomeStateLoadingImplCopyWithImpl(_$BiomeStateLoadingImpl _value,
      $Res Function(_$BiomeStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of BiomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BiomeStateLoadingImpl implements BiomeStateLoading {
  const _$BiomeStateLoadingImpl();

  @override
  String toString() {
    return 'BiomeState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BiomeStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Biome biome) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Biome biome)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Biome biome)? loaded,
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
    required TResult Function(BiomeStateInitial value) initial,
    required TResult Function(BiomeStateLoading value) loading,
    required TResult Function(BiomeStateLoaded value) loaded,
    required TResult Function(BiomeStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BiomeStateInitial value)? initial,
    TResult? Function(BiomeStateLoading value)? loading,
    TResult? Function(BiomeStateLoaded value)? loaded,
    TResult? Function(BiomeStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BiomeStateInitial value)? initial,
    TResult Function(BiomeStateLoading value)? loading,
    TResult Function(BiomeStateLoaded value)? loaded,
    TResult Function(BiomeStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class BiomeStateLoading implements BiomeState {
  const factory BiomeStateLoading() = _$BiomeStateLoadingImpl;
}

/// @nodoc
abstract class _$$BiomeStateLoadedImplCopyWith<$Res> {
  factory _$$BiomeStateLoadedImplCopyWith(_$BiomeStateLoadedImpl value,
          $Res Function(_$BiomeStateLoadedImpl) then) =
      __$$BiomeStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Biome biome});

  $BiomeCopyWith<$Res> get biome;
}

/// @nodoc
class __$$BiomeStateLoadedImplCopyWithImpl<$Res>
    extends _$BiomeStateCopyWithImpl<$Res, _$BiomeStateLoadedImpl>
    implements _$$BiomeStateLoadedImplCopyWith<$Res> {
  __$$BiomeStateLoadedImplCopyWithImpl(_$BiomeStateLoadedImpl _value,
      $Res Function(_$BiomeStateLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of BiomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? biome = null,
  }) {
    return _then(_$BiomeStateLoadedImpl(
      biome: null == biome
          ? _value.biome
          : biome // ignore: cast_nullable_to_non_nullable
              as Biome,
    ));
  }

  /// Create a copy of BiomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BiomeCopyWith<$Res> get biome {
    return $BiomeCopyWith<$Res>(_value.biome, (value) {
      return _then(_value.copyWith(biome: value));
    });
  }
}

/// @nodoc

class _$BiomeStateLoadedImpl implements BiomeStateLoaded {
  const _$BiomeStateLoadedImpl({required this.biome});

  @override
  final Biome biome;

  @override
  String toString() {
    return 'BiomeState.loaded(biome: $biome)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BiomeStateLoadedImpl &&
            (identical(other.biome, biome) || other.biome == biome));
  }

  @override
  int get hashCode => Object.hash(runtimeType, biome);

  /// Create a copy of BiomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BiomeStateLoadedImplCopyWith<_$BiomeStateLoadedImpl> get copyWith =>
      __$$BiomeStateLoadedImplCopyWithImpl<_$BiomeStateLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Biome biome) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(biome);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Biome biome)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(biome);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Biome biome)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(biome);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BiomeStateInitial value) initial,
    required TResult Function(BiomeStateLoading value) loading,
    required TResult Function(BiomeStateLoaded value) loaded,
    required TResult Function(BiomeStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BiomeStateInitial value)? initial,
    TResult? Function(BiomeStateLoading value)? loading,
    TResult? Function(BiomeStateLoaded value)? loaded,
    TResult? Function(BiomeStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BiomeStateInitial value)? initial,
    TResult Function(BiomeStateLoading value)? loading,
    TResult Function(BiomeStateLoaded value)? loaded,
    TResult Function(BiomeStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class BiomeStateLoaded implements BiomeState {
  const factory BiomeStateLoaded({required final Biome biome}) =
      _$BiomeStateLoadedImpl;

  Biome get biome;

  /// Create a copy of BiomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BiomeStateLoadedImplCopyWith<_$BiomeStateLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BiomeStateErrorImplCopyWith<$Res> {
  factory _$$BiomeStateErrorImplCopyWith(_$BiomeStateErrorImpl value,
          $Res Function(_$BiomeStateErrorImpl) then) =
      __$$BiomeStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$BiomeStateErrorImplCopyWithImpl<$Res>
    extends _$BiomeStateCopyWithImpl<$Res, _$BiomeStateErrorImpl>
    implements _$$BiomeStateErrorImplCopyWith<$Res> {
  __$$BiomeStateErrorImplCopyWithImpl(
      _$BiomeStateErrorImpl _value, $Res Function(_$BiomeStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of BiomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$BiomeStateErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BiomeStateErrorImpl implements BiomeStateError {
  const _$BiomeStateErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'BiomeState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BiomeStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of BiomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BiomeStateErrorImplCopyWith<_$BiomeStateErrorImpl> get copyWith =>
      __$$BiomeStateErrorImplCopyWithImpl<_$BiomeStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Biome biome) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Biome biome)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Biome biome)? loaded,
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
    required TResult Function(BiomeStateInitial value) initial,
    required TResult Function(BiomeStateLoading value) loading,
    required TResult Function(BiomeStateLoaded value) loaded,
    required TResult Function(BiomeStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BiomeStateInitial value)? initial,
    TResult? Function(BiomeStateLoading value)? loading,
    TResult? Function(BiomeStateLoaded value)? loaded,
    TResult? Function(BiomeStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BiomeStateInitial value)? initial,
    TResult Function(BiomeStateLoading value)? loading,
    TResult Function(BiomeStateLoaded value)? loaded,
    TResult Function(BiomeStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class BiomeStateError implements BiomeState {
  const factory BiomeStateError(final String message) = _$BiomeStateErrorImpl;

  String get message;

  /// Create a copy of BiomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BiomeStateErrorImplCopyWith<_$BiomeStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

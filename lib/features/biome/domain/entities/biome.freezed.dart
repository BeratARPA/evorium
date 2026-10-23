// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'biome.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Biome _$BiomeFromJson(Map<String, dynamic> json) {
  return _Biome.fromJson(json);
}

/// @nodoc
mixin _$Biome {
  String get id => throw _privateConstructorUsedError;
  BiomeType get type => throw _privateConstructorUsedError;
  EvolutionStage get requiredStage => throw _privateConstructorUsedError;

  /// Current live conditions (changes over time via ARE events).
  BiomeCondition get condition => throw _privateConstructorUsedError;

  /// Whether this biome has been discovered (unlocked for transition).
  bool get isDiscovered => throw _privateConstructorUsedError;

  /// Time the creature has spent in this biome (seconds).
  int get timeSpentSeconds => throw _privateConstructorUsedError;

  /// Serializes this Biome to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Biome
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BiomeCopyWith<Biome> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BiomeCopyWith<$Res> {
  factory $BiomeCopyWith(Biome value, $Res Function(Biome) then) =
      _$BiomeCopyWithImpl<$Res, Biome>;
  @useResult
  $Res call(
      {String id,
      BiomeType type,
      EvolutionStage requiredStage,
      BiomeCondition condition,
      bool isDiscovered,
      int timeSpentSeconds});

  $BiomeConditionCopyWith<$Res> get condition;
}

/// @nodoc
class _$BiomeCopyWithImpl<$Res, $Val extends Biome>
    implements $BiomeCopyWith<$Res> {
  _$BiomeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Biome
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? requiredStage = null,
    Object? condition = null,
    Object? isDiscovered = null,
    Object? timeSpentSeconds = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BiomeType,
      requiredStage: null == requiredStage
          ? _value.requiredStage
          : requiredStage // ignore: cast_nullable_to_non_nullable
              as EvolutionStage,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as BiomeCondition,
      isDiscovered: null == isDiscovered
          ? _value.isDiscovered
          : isDiscovered // ignore: cast_nullable_to_non_nullable
              as bool,
      timeSpentSeconds: null == timeSpentSeconds
          ? _value.timeSpentSeconds
          : timeSpentSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of Biome
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BiomeConditionCopyWith<$Res> get condition {
    return $BiomeConditionCopyWith<$Res>(_value.condition, (value) {
      return _then(_value.copyWith(condition: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BiomeImplCopyWith<$Res> implements $BiomeCopyWith<$Res> {
  factory _$$BiomeImplCopyWith(
          _$BiomeImpl value, $Res Function(_$BiomeImpl) then) =
      __$$BiomeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      BiomeType type,
      EvolutionStage requiredStage,
      BiomeCondition condition,
      bool isDiscovered,
      int timeSpentSeconds});

  @override
  $BiomeConditionCopyWith<$Res> get condition;
}

/// @nodoc
class __$$BiomeImplCopyWithImpl<$Res>
    extends _$BiomeCopyWithImpl<$Res, _$BiomeImpl>
    implements _$$BiomeImplCopyWith<$Res> {
  __$$BiomeImplCopyWithImpl(
      _$BiomeImpl _value, $Res Function(_$BiomeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Biome
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? requiredStage = null,
    Object? condition = null,
    Object? isDiscovered = null,
    Object? timeSpentSeconds = null,
  }) {
    return _then(_$BiomeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BiomeType,
      requiredStage: null == requiredStage
          ? _value.requiredStage
          : requiredStage // ignore: cast_nullable_to_non_nullable
              as EvolutionStage,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as BiomeCondition,
      isDiscovered: null == isDiscovered
          ? _value.isDiscovered
          : isDiscovered // ignore: cast_nullable_to_non_nullable
              as bool,
      timeSpentSeconds: null == timeSpentSeconds
          ? _value.timeSpentSeconds
          : timeSpentSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BiomeImpl extends _Biome {
  const _$BiomeImpl(
      {required this.id,
      required this.type,
      required this.requiredStage,
      required this.condition,
      this.isDiscovered = false,
      this.timeSpentSeconds = 0})
      : super._();

  factory _$BiomeImpl.fromJson(Map<String, dynamic> json) =>
      _$$BiomeImplFromJson(json);

  @override
  final String id;
  @override
  final BiomeType type;
  @override
  final EvolutionStage requiredStage;

  /// Current live conditions (changes over time via ARE events).
  @override
  final BiomeCondition condition;

  /// Whether this biome has been discovered (unlocked for transition).
  @override
  @JsonKey()
  final bool isDiscovered;

  /// Time the creature has spent in this biome (seconds).
  @override
  @JsonKey()
  final int timeSpentSeconds;

  @override
  String toString() {
    return 'Biome(id: $id, type: $type, requiredStage: $requiredStage, condition: $condition, isDiscovered: $isDiscovered, timeSpentSeconds: $timeSpentSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BiomeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.requiredStage, requiredStage) ||
                other.requiredStage == requiredStage) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.isDiscovered, isDiscovered) ||
                other.isDiscovered == isDiscovered) &&
            (identical(other.timeSpentSeconds, timeSpentSeconds) ||
                other.timeSpentSeconds == timeSpentSeconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, requiredStage,
      condition, isDiscovered, timeSpentSeconds);

  /// Create a copy of Biome
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BiomeImplCopyWith<_$BiomeImpl> get copyWith =>
      __$$BiomeImplCopyWithImpl<_$BiomeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BiomeImplToJson(
      this,
    );
  }
}

abstract class _Biome extends Biome {
  const factory _Biome(
      {required final String id,
      required final BiomeType type,
      required final EvolutionStage requiredStage,
      required final BiomeCondition condition,
      final bool isDiscovered,
      final int timeSpentSeconds}) = _$BiomeImpl;
  const _Biome._() : super._();

  factory _Biome.fromJson(Map<String, dynamic> json) = _$BiomeImpl.fromJson;

  @override
  String get id;
  @override
  BiomeType get type;
  @override
  EvolutionStage get requiredStage;

  /// Current live conditions (changes over time via ARE events).
  @override
  BiomeCondition get condition;

  /// Whether this biome has been discovered (unlocked for transition).
  @override
  bool get isDiscovered;

  /// Time the creature has spent in this biome (seconds).
  @override
  int get timeSpentSeconds;

  /// Create a copy of Biome
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BiomeImplCopyWith<_$BiomeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

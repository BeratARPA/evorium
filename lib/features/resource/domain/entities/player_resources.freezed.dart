// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_resources.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlayerResources _$PlayerResourcesFromJson(Map<String, dynamic> json) {
  return _PlayerResources.fromJson(json);
}

/// @nodoc
mixin _$PlayerResources {
  int get food => throw _privateConstructorUsedError;
  int get minerals => throw _privateConstructorUsedError;
  int get biochemical => throw _privateConstructorUsedError;
  int get evolutionaryPoints => throw _privateConstructorUsedError;

  /// Carrying limits (can be expanded by Evolution Tree).
  int get maxFood => throw _privateConstructorUsedError;
  int get maxMinerals => throw _privateConstructorUsedError;
  int get maxBiochemical => throw _privateConstructorUsedError;

  /// Serializes this PlayerResources to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlayerResources
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlayerResourcesCopyWith<PlayerResources> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerResourcesCopyWith<$Res> {
  factory $PlayerResourcesCopyWith(
          PlayerResources value, $Res Function(PlayerResources) then) =
      _$PlayerResourcesCopyWithImpl<$Res, PlayerResources>;
  @useResult
  $Res call(
      {int food,
      int minerals,
      int biochemical,
      int evolutionaryPoints,
      int maxFood,
      int maxMinerals,
      int maxBiochemical});
}

/// @nodoc
class _$PlayerResourcesCopyWithImpl<$Res, $Val extends PlayerResources>
    implements $PlayerResourcesCopyWith<$Res> {
  _$PlayerResourcesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlayerResources
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
    Object? minerals = null,
    Object? biochemical = null,
    Object? evolutionaryPoints = null,
    Object? maxFood = null,
    Object? maxMinerals = null,
    Object? maxBiochemical = null,
  }) {
    return _then(_value.copyWith(
      food: null == food
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as int,
      minerals: null == minerals
          ? _value.minerals
          : minerals // ignore: cast_nullable_to_non_nullable
              as int,
      biochemical: null == biochemical
          ? _value.biochemical
          : biochemical // ignore: cast_nullable_to_non_nullable
              as int,
      evolutionaryPoints: null == evolutionaryPoints
          ? _value.evolutionaryPoints
          : evolutionaryPoints // ignore: cast_nullable_to_non_nullable
              as int,
      maxFood: null == maxFood
          ? _value.maxFood
          : maxFood // ignore: cast_nullable_to_non_nullable
              as int,
      maxMinerals: null == maxMinerals
          ? _value.maxMinerals
          : maxMinerals // ignore: cast_nullable_to_non_nullable
              as int,
      maxBiochemical: null == maxBiochemical
          ? _value.maxBiochemical
          : maxBiochemical // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayerResourcesImplCopyWith<$Res>
    implements $PlayerResourcesCopyWith<$Res> {
  factory _$$PlayerResourcesImplCopyWith(_$PlayerResourcesImpl value,
          $Res Function(_$PlayerResourcesImpl) then) =
      __$$PlayerResourcesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int food,
      int minerals,
      int biochemical,
      int evolutionaryPoints,
      int maxFood,
      int maxMinerals,
      int maxBiochemical});
}

/// @nodoc
class __$$PlayerResourcesImplCopyWithImpl<$Res>
    extends _$PlayerResourcesCopyWithImpl<$Res, _$PlayerResourcesImpl>
    implements _$$PlayerResourcesImplCopyWith<$Res> {
  __$$PlayerResourcesImplCopyWithImpl(
      _$PlayerResourcesImpl _value, $Res Function(_$PlayerResourcesImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerResources
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
    Object? minerals = null,
    Object? biochemical = null,
    Object? evolutionaryPoints = null,
    Object? maxFood = null,
    Object? maxMinerals = null,
    Object? maxBiochemical = null,
  }) {
    return _then(_$PlayerResourcesImpl(
      food: null == food
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as int,
      minerals: null == minerals
          ? _value.minerals
          : minerals // ignore: cast_nullable_to_non_nullable
              as int,
      biochemical: null == biochemical
          ? _value.biochemical
          : biochemical // ignore: cast_nullable_to_non_nullable
              as int,
      evolutionaryPoints: null == evolutionaryPoints
          ? _value.evolutionaryPoints
          : evolutionaryPoints // ignore: cast_nullable_to_non_nullable
              as int,
      maxFood: null == maxFood
          ? _value.maxFood
          : maxFood // ignore: cast_nullable_to_non_nullable
              as int,
      maxMinerals: null == maxMinerals
          ? _value.maxMinerals
          : maxMinerals // ignore: cast_nullable_to_non_nullable
              as int,
      maxBiochemical: null == maxBiochemical
          ? _value.maxBiochemical
          : maxBiochemical // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerResourcesImpl extends _PlayerResources {
  const _$PlayerResourcesImpl(
      {this.food = 20,
      this.minerals = 0,
      this.biochemical = 0,
      this.evolutionaryPoints = 0,
      this.maxFood = 100,
      this.maxMinerals = 50,
      this.maxBiochemical = 50})
      : super._();

  factory _$PlayerResourcesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerResourcesImplFromJson(json);

  @override
  @JsonKey()
  final int food;
  @override
  @JsonKey()
  final int minerals;
  @override
  @JsonKey()
  final int biochemical;
  @override
  @JsonKey()
  final int evolutionaryPoints;

  /// Carrying limits (can be expanded by Evolution Tree).
  @override
  @JsonKey()
  final int maxFood;
  @override
  @JsonKey()
  final int maxMinerals;
  @override
  @JsonKey()
  final int maxBiochemical;

  @override
  String toString() {
    return 'PlayerResources(food: $food, minerals: $minerals, biochemical: $biochemical, evolutionaryPoints: $evolutionaryPoints, maxFood: $maxFood, maxMinerals: $maxMinerals, maxBiochemical: $maxBiochemical)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerResourcesImpl &&
            (identical(other.food, food) || other.food == food) &&
            (identical(other.minerals, minerals) ||
                other.minerals == minerals) &&
            (identical(other.biochemical, biochemical) ||
                other.biochemical == biochemical) &&
            (identical(other.evolutionaryPoints, evolutionaryPoints) ||
                other.evolutionaryPoints == evolutionaryPoints) &&
            (identical(other.maxFood, maxFood) || other.maxFood == maxFood) &&
            (identical(other.maxMinerals, maxMinerals) ||
                other.maxMinerals == maxMinerals) &&
            (identical(other.maxBiochemical, maxBiochemical) ||
                other.maxBiochemical == maxBiochemical));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, food, minerals, biochemical,
      evolutionaryPoints, maxFood, maxMinerals, maxBiochemical);

  /// Create a copy of PlayerResources
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerResourcesImplCopyWith<_$PlayerResourcesImpl> get copyWith =>
      __$$PlayerResourcesImplCopyWithImpl<_$PlayerResourcesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerResourcesImplToJson(
      this,
    );
  }
}

abstract class _PlayerResources extends PlayerResources {
  const factory _PlayerResources(
      {final int food,
      final int minerals,
      final int biochemical,
      final int evolutionaryPoints,
      final int maxFood,
      final int maxMinerals,
      final int maxBiochemical}) = _$PlayerResourcesImpl;
  const _PlayerResources._() : super._();

  factory _PlayerResources.fromJson(Map<String, dynamic> json) =
      _$PlayerResourcesImpl.fromJson;

  @override
  int get food;
  @override
  int get minerals;
  @override
  int get biochemical;
  @override
  int get evolutionaryPoints;

  /// Carrying limits (can be expanded by Evolution Tree).
  @override
  int get maxFood;
  @override
  int get maxMinerals;
  @override
  int get maxBiochemical;

  /// Create a copy of PlayerResources
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerResourcesImplCopyWith<_$PlayerResourcesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'biome_condition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BiomeCondition _$BiomeConditionFromJson(Map<String, dynamic> json) {
  return _BiomeCondition.fromJson(json);
}

/// @nodoc
mixin _$BiomeCondition {
  /// Temperature in Celsius. Creature ADP reduces biome penalties.
  double get temperature => throw _privateConstructorUsedError;

  /// Humidity 0–100%.
  double get humidity => throw _privateConstructorUsedError;

  /// Light level 0–100% (low at night, full during day).
  double get lightLevel => throw _privateConstructorUsedError;

  /// Pressure in atm (relevant for deep ocean / high altitude).
  double get pressure => throw _privateConstructorUsedError;

  /// Current season.
  Season get season => throw _privateConstructorUsedError;

  /// Whether it is currently nighttime.
  bool get isNight => throw _privateConstructorUsedError;

  /// Food resource multiplier (modified by seasons/disasters).
  double get foodMultiplier => throw _privateConstructorUsedError;

  /// Whether water resources are available.
  bool get hasWater => throw _privateConstructorUsedError;

  /// Active disaster name, or null if none.
  String? get activeDisaster => throw _privateConstructorUsedError;

  /// Serializes this BiomeCondition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BiomeCondition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BiomeConditionCopyWith<BiomeCondition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BiomeConditionCopyWith<$Res> {
  factory $BiomeConditionCopyWith(
          BiomeCondition value, $Res Function(BiomeCondition) then) =
      _$BiomeConditionCopyWithImpl<$Res, BiomeCondition>;
  @useResult
  $Res call(
      {double temperature,
      double humidity,
      double lightLevel,
      double pressure,
      Season season,
      bool isNight,
      double foodMultiplier,
      bool hasWater,
      String? activeDisaster});
}

/// @nodoc
class _$BiomeConditionCopyWithImpl<$Res, $Val extends BiomeCondition>
    implements $BiomeConditionCopyWith<$Res> {
  _$BiomeConditionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BiomeCondition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
    Object? humidity = null,
    Object? lightLevel = null,
    Object? pressure = null,
    Object? season = null,
    Object? isNight = null,
    Object? foodMultiplier = null,
    Object? hasWater = null,
    Object? activeDisaster = freezed,
  }) {
    return _then(_value.copyWith(
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      lightLevel: null == lightLevel
          ? _value.lightLevel
          : lightLevel // ignore: cast_nullable_to_non_nullable
              as double,
      pressure: null == pressure
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as double,
      season: null == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as Season,
      isNight: null == isNight
          ? _value.isNight
          : isNight // ignore: cast_nullable_to_non_nullable
              as bool,
      foodMultiplier: null == foodMultiplier
          ? _value.foodMultiplier
          : foodMultiplier // ignore: cast_nullable_to_non_nullable
              as double,
      hasWater: null == hasWater
          ? _value.hasWater
          : hasWater // ignore: cast_nullable_to_non_nullable
              as bool,
      activeDisaster: freezed == activeDisaster
          ? _value.activeDisaster
          : activeDisaster // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BiomeConditionImplCopyWith<$Res>
    implements $BiomeConditionCopyWith<$Res> {
  factory _$$BiomeConditionImplCopyWith(_$BiomeConditionImpl value,
          $Res Function(_$BiomeConditionImpl) then) =
      __$$BiomeConditionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double temperature,
      double humidity,
      double lightLevel,
      double pressure,
      Season season,
      bool isNight,
      double foodMultiplier,
      bool hasWater,
      String? activeDisaster});
}

/// @nodoc
class __$$BiomeConditionImplCopyWithImpl<$Res>
    extends _$BiomeConditionCopyWithImpl<$Res, _$BiomeConditionImpl>
    implements _$$BiomeConditionImplCopyWith<$Res> {
  __$$BiomeConditionImplCopyWithImpl(
      _$BiomeConditionImpl _value, $Res Function(_$BiomeConditionImpl) _then)
      : super(_value, _then);

  /// Create a copy of BiomeCondition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
    Object? humidity = null,
    Object? lightLevel = null,
    Object? pressure = null,
    Object? season = null,
    Object? isNight = null,
    Object? foodMultiplier = null,
    Object? hasWater = null,
    Object? activeDisaster = freezed,
  }) {
    return _then(_$BiomeConditionImpl(
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      lightLevel: null == lightLevel
          ? _value.lightLevel
          : lightLevel // ignore: cast_nullable_to_non_nullable
              as double,
      pressure: null == pressure
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as double,
      season: null == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as Season,
      isNight: null == isNight
          ? _value.isNight
          : isNight // ignore: cast_nullable_to_non_nullable
              as bool,
      foodMultiplier: null == foodMultiplier
          ? _value.foodMultiplier
          : foodMultiplier // ignore: cast_nullable_to_non_nullable
              as double,
      hasWater: null == hasWater
          ? _value.hasWater
          : hasWater // ignore: cast_nullable_to_non_nullable
              as bool,
      activeDisaster: freezed == activeDisaster
          ? _value.activeDisaster
          : activeDisaster // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BiomeConditionImpl extends _BiomeCondition {
  const _$BiomeConditionImpl(
      {required this.temperature,
      required this.humidity,
      required this.lightLevel,
      this.pressure = 1.0,
      this.season = Season.spring,
      this.isNight = false,
      this.foodMultiplier = 1.0,
      this.hasWater = true,
      this.activeDisaster})
      : super._();

  factory _$BiomeConditionImpl.fromJson(Map<String, dynamic> json) =>
      _$$BiomeConditionImplFromJson(json);

  /// Temperature in Celsius. Creature ADP reduces biome penalties.
  @override
  final double temperature;

  /// Humidity 0–100%.
  @override
  final double humidity;

  /// Light level 0–100% (low at night, full during day).
  @override
  final double lightLevel;

  /// Pressure in atm (relevant for deep ocean / high altitude).
  @override
  @JsonKey()
  final double pressure;

  /// Current season.
  @override
  @JsonKey()
  final Season season;

  /// Whether it is currently nighttime.
  @override
  @JsonKey()
  final bool isNight;

  /// Food resource multiplier (modified by seasons/disasters).
  @override
  @JsonKey()
  final double foodMultiplier;

  /// Whether water resources are available.
  @override
  @JsonKey()
  final bool hasWater;

  /// Active disaster name, or null if none.
  @override
  final String? activeDisaster;

  @override
  String toString() {
    return 'BiomeCondition(temperature: $temperature, humidity: $humidity, lightLevel: $lightLevel, pressure: $pressure, season: $season, isNight: $isNight, foodMultiplier: $foodMultiplier, hasWater: $hasWater, activeDisaster: $activeDisaster)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BiomeConditionImpl &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.lightLevel, lightLevel) ||
                other.lightLevel == lightLevel) &&
            (identical(other.pressure, pressure) ||
                other.pressure == pressure) &&
            (identical(other.season, season) || other.season == season) &&
            (identical(other.isNight, isNight) || other.isNight == isNight) &&
            (identical(other.foodMultiplier, foodMultiplier) ||
                other.foodMultiplier == foodMultiplier) &&
            (identical(other.hasWater, hasWater) ||
                other.hasWater == hasWater) &&
            (identical(other.activeDisaster, activeDisaster) ||
                other.activeDisaster == activeDisaster));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      temperature,
      humidity,
      lightLevel,
      pressure,
      season,
      isNight,
      foodMultiplier,
      hasWater,
      activeDisaster);

  /// Create a copy of BiomeCondition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BiomeConditionImplCopyWith<_$BiomeConditionImpl> get copyWith =>
      __$$BiomeConditionImplCopyWithImpl<_$BiomeConditionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BiomeConditionImplToJson(
      this,
    );
  }
}

abstract class _BiomeCondition extends BiomeCondition {
  const factory _BiomeCondition(
      {required final double temperature,
      required final double humidity,
      required final double lightLevel,
      final double pressure,
      final Season season,
      final bool isNight,
      final double foodMultiplier,
      final bool hasWater,
      final String? activeDisaster}) = _$BiomeConditionImpl;
  const _BiomeCondition._() : super._();

  factory _BiomeCondition.fromJson(Map<String, dynamic> json) =
      _$BiomeConditionImpl.fromJson;

  /// Temperature in Celsius. Creature ADP reduces biome penalties.
  @override
  double get temperature;

  /// Humidity 0–100%.
  @override
  double get humidity;

  /// Light level 0–100% (low at night, full during day).
  @override
  double get lightLevel;

  /// Pressure in atm (relevant for deep ocean / high altitude).
  @override
  double get pressure;

  /// Current season.
  @override
  Season get season;

  /// Whether it is currently nighttime.
  @override
  bool get isNight;

  /// Food resource multiplier (modified by seasons/disasters).
  @override
  double get foodMultiplier;

  /// Whether water resources are available.
  @override
  bool get hasWater;

  /// Active disaster name, or null if none.
  @override
  String? get activeDisaster;

  /// Create a copy of BiomeCondition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BiomeConditionImplCopyWith<_$BiomeConditionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

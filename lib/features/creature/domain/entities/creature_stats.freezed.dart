// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'creature_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreatureStats _$CreatureStatsFromJson(Map<String, dynamic> json) {
  return _CreatureStats.fromJson(json);
}

/// @nodoc
mixin _$CreatureStats {
  /// Current HP. Reaching 0 ends the generation.
  int get hp => throw _privateConstructorUsedError;

  /// Maximum HP ceiling.
  int get maxHp => throw _privateConstructorUsedError;

  /// Physical/chemical attack power.
  int get atk => throw _privateConstructorUsedError;

  /// Physical protection (shell, armor, thickness).
  int get def => throw _privateConstructorUsedError;

  /// Movement and reaction speed.
  int get spd => throw _privateConstructorUsedError;

  /// Sensory capacity (sight, smell, vibration).
  int get per => throw _privateConstructorUsedError;

  /// Environmental fit capacity.
  int get adp => throw _privateConstructorUsedError;

  /// Current energy units.
  double get energy => throw _privateConstructorUsedError;

  /// Max energy = base + (adp * 2).
  double get maxEnergy => throw _privateConstructorUsedError;

  /// How fast energy regenerates per tick.
  double get energyRenewalRate => throw _privateConstructorUsedError;

  /// Resource consumption rate — high SPD = fast metabolism.
  double get metabolismSpeed => throw _privateConstructorUsedError;

  /// Serializes this CreatureStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreatureStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatureStatsCopyWith<CreatureStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatureStatsCopyWith<$Res> {
  factory $CreatureStatsCopyWith(
          CreatureStats value, $Res Function(CreatureStats) then) =
      _$CreatureStatsCopyWithImpl<$Res, CreatureStats>;
  @useResult
  $Res call(
      {int hp,
      int maxHp,
      int atk,
      int def,
      int spd,
      int per,
      int adp,
      double energy,
      double maxEnergy,
      double energyRenewalRate,
      double metabolismSpeed});
}

/// @nodoc
class _$CreatureStatsCopyWithImpl<$Res, $Val extends CreatureStats>
    implements $CreatureStatsCopyWith<$Res> {
  _$CreatureStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatureStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hp = null,
    Object? maxHp = null,
    Object? atk = null,
    Object? def = null,
    Object? spd = null,
    Object? per = null,
    Object? adp = null,
    Object? energy = null,
    Object? maxEnergy = null,
    Object? energyRenewalRate = null,
    Object? metabolismSpeed = null,
  }) {
    return _then(_value.copyWith(
      hp: null == hp
          ? _value.hp
          : hp // ignore: cast_nullable_to_non_nullable
              as int,
      maxHp: null == maxHp
          ? _value.maxHp
          : maxHp // ignore: cast_nullable_to_non_nullable
              as int,
      atk: null == atk
          ? _value.atk
          : atk // ignore: cast_nullable_to_non_nullable
              as int,
      def: null == def
          ? _value.def
          : def // ignore: cast_nullable_to_non_nullable
              as int,
      spd: null == spd
          ? _value.spd
          : spd // ignore: cast_nullable_to_non_nullable
              as int,
      per: null == per
          ? _value.per
          : per // ignore: cast_nullable_to_non_nullable
              as int,
      adp: null == adp
          ? _value.adp
          : adp // ignore: cast_nullable_to_non_nullable
              as int,
      energy: null == energy
          ? _value.energy
          : energy // ignore: cast_nullable_to_non_nullable
              as double,
      maxEnergy: null == maxEnergy
          ? _value.maxEnergy
          : maxEnergy // ignore: cast_nullable_to_non_nullable
              as double,
      energyRenewalRate: null == energyRenewalRate
          ? _value.energyRenewalRate
          : energyRenewalRate // ignore: cast_nullable_to_non_nullable
              as double,
      metabolismSpeed: null == metabolismSpeed
          ? _value.metabolismSpeed
          : metabolismSpeed // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreatureStatsImplCopyWith<$Res>
    implements $CreatureStatsCopyWith<$Res> {
  factory _$$CreatureStatsImplCopyWith(
          _$CreatureStatsImpl value, $Res Function(_$CreatureStatsImpl) then) =
      __$$CreatureStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int hp,
      int maxHp,
      int atk,
      int def,
      int spd,
      int per,
      int adp,
      double energy,
      double maxEnergy,
      double energyRenewalRate,
      double metabolismSpeed});
}

/// @nodoc
class __$$CreatureStatsImplCopyWithImpl<$Res>
    extends _$CreatureStatsCopyWithImpl<$Res, _$CreatureStatsImpl>
    implements _$$CreatureStatsImplCopyWith<$Res> {
  __$$CreatureStatsImplCopyWithImpl(
      _$CreatureStatsImpl _value, $Res Function(_$CreatureStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreatureStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hp = null,
    Object? maxHp = null,
    Object? atk = null,
    Object? def = null,
    Object? spd = null,
    Object? per = null,
    Object? adp = null,
    Object? energy = null,
    Object? maxEnergy = null,
    Object? energyRenewalRate = null,
    Object? metabolismSpeed = null,
  }) {
    return _then(_$CreatureStatsImpl(
      hp: null == hp
          ? _value.hp
          : hp // ignore: cast_nullable_to_non_nullable
              as int,
      maxHp: null == maxHp
          ? _value.maxHp
          : maxHp // ignore: cast_nullable_to_non_nullable
              as int,
      atk: null == atk
          ? _value.atk
          : atk // ignore: cast_nullable_to_non_nullable
              as int,
      def: null == def
          ? _value.def
          : def // ignore: cast_nullable_to_non_nullable
              as int,
      spd: null == spd
          ? _value.spd
          : spd // ignore: cast_nullable_to_non_nullable
              as int,
      per: null == per
          ? _value.per
          : per // ignore: cast_nullable_to_non_nullable
              as int,
      adp: null == adp
          ? _value.adp
          : adp // ignore: cast_nullable_to_non_nullable
              as int,
      energy: null == energy
          ? _value.energy
          : energy // ignore: cast_nullable_to_non_nullable
              as double,
      maxEnergy: null == maxEnergy
          ? _value.maxEnergy
          : maxEnergy // ignore: cast_nullable_to_non_nullable
              as double,
      energyRenewalRate: null == energyRenewalRate
          ? _value.energyRenewalRate
          : energyRenewalRate // ignore: cast_nullable_to_non_nullable
              as double,
      metabolismSpeed: null == metabolismSpeed
          ? _value.metabolismSpeed
          : metabolismSpeed // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatureStatsImpl extends _CreatureStats {
  const _$CreatureStatsImpl(
      {required this.hp,
      required this.maxHp,
      required this.atk,
      required this.def,
      required this.spd,
      required this.per,
      required this.adp,
      this.energy = 100.0,
      this.maxEnergy = 100.0,
      this.energyRenewalRate = 5.0,
      this.metabolismSpeed = 1.0})
      : super._();

  factory _$CreatureStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatureStatsImplFromJson(json);

  /// Current HP. Reaching 0 ends the generation.
  @override
  final int hp;

  /// Maximum HP ceiling.
  @override
  final int maxHp;

  /// Physical/chemical attack power.
  @override
  final int atk;

  /// Physical protection (shell, armor, thickness).
  @override
  final int def;

  /// Movement and reaction speed.
  @override
  final int spd;

  /// Sensory capacity (sight, smell, vibration).
  @override
  final int per;

  /// Environmental fit capacity.
  @override
  final int adp;

  /// Current energy units.
  @override
  @JsonKey()
  final double energy;

  /// Max energy = base + (adp * 2).
  @override
  @JsonKey()
  final double maxEnergy;

  /// How fast energy regenerates per tick.
  @override
  @JsonKey()
  final double energyRenewalRate;

  /// Resource consumption rate — high SPD = fast metabolism.
  @override
  @JsonKey()
  final double metabolismSpeed;

  @override
  String toString() {
    return 'CreatureStats(hp: $hp, maxHp: $maxHp, atk: $atk, def: $def, spd: $spd, per: $per, adp: $adp, energy: $energy, maxEnergy: $maxEnergy, energyRenewalRate: $energyRenewalRate, metabolismSpeed: $metabolismSpeed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatureStatsImpl &&
            (identical(other.hp, hp) || other.hp == hp) &&
            (identical(other.maxHp, maxHp) || other.maxHp == maxHp) &&
            (identical(other.atk, atk) || other.atk == atk) &&
            (identical(other.def, def) || other.def == def) &&
            (identical(other.spd, spd) || other.spd == spd) &&
            (identical(other.per, per) || other.per == per) &&
            (identical(other.adp, adp) || other.adp == adp) &&
            (identical(other.energy, energy) || other.energy == energy) &&
            (identical(other.maxEnergy, maxEnergy) ||
                other.maxEnergy == maxEnergy) &&
            (identical(other.energyRenewalRate, energyRenewalRate) ||
                other.energyRenewalRate == energyRenewalRate) &&
            (identical(other.metabolismSpeed, metabolismSpeed) ||
                other.metabolismSpeed == metabolismSpeed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hp, maxHp, atk, def, spd, per,
      adp, energy, maxEnergy, energyRenewalRate, metabolismSpeed);

  /// Create a copy of CreatureStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatureStatsImplCopyWith<_$CreatureStatsImpl> get copyWith =>
      __$$CreatureStatsImplCopyWithImpl<_$CreatureStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatureStatsImplToJson(
      this,
    );
  }
}

abstract class _CreatureStats extends CreatureStats {
  const factory _CreatureStats(
      {required final int hp,
      required final int maxHp,
      required final int atk,
      required final int def,
      required final int spd,
      required final int per,
      required final int adp,
      final double energy,
      final double maxEnergy,
      final double energyRenewalRate,
      final double metabolismSpeed}) = _$CreatureStatsImpl;
  const _CreatureStats._() : super._();

  factory _CreatureStats.fromJson(Map<String, dynamic> json) =
      _$CreatureStatsImpl.fromJson;

  /// Current HP. Reaching 0 ends the generation.
  @override
  int get hp;

  /// Maximum HP ceiling.
  @override
  int get maxHp;

  /// Physical/chemical attack power.
  @override
  int get atk;

  /// Physical protection (shell, armor, thickness).
  @override
  int get def;

  /// Movement and reaction speed.
  @override
  int get spd;

  /// Sensory capacity (sight, smell, vibration).
  @override
  int get per;

  /// Environmental fit capacity.
  @override
  int get adp;

  /// Current energy units.
  @override
  double get energy;

  /// Max energy = base + (adp * 2).
  @override
  double get maxEnergy;

  /// How fast energy regenerates per tick.
  @override
  double get energyRenewalRate;

  /// Resource consumption rate — high SPD = fast metabolism.
  @override
  double get metabolismSpeed;

  /// Create a copy of CreatureStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatureStatsImplCopyWith<_$CreatureStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

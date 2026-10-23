// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'creature.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Creature _$CreatureFromJson(Map<String, dynamic> json) {
  return _Creature.fromJson(json);
}

/// @nodoc
mixin _$Creature {
  /// Unique instance ID (UUID).
  String get id => throw _privateConstructorUsedError;

  /// Descriptive name (generated or player-chosen).
  String get name => throw _privateConstructorUsedError;

  /// Current generation number (starts at 1).
  int get generation => throw _privateConstructorUsedError;

  /// Primary and derived stats.
  CreatureStats get stats => throw _privateConstructorUsedError;

  /// All currently active traits.
  List<CreatureTrait> get traits => throw _privateConstructorUsedError;

  /// Current evolutionary stage.
  EvolutionStage get stage => throw _privateConstructorUsedError;

  /// Current biome the creature inhabits.
  BiomeType get currentBiome => throw _privateConstructorUsedError;

  /// Total survival time this generation (in seconds).
  int get survivalSeconds => throw _privateConstructorUsedError;

  /// Resources gathered this generation.
  int get resourcesGathered => throw _privateConstructorUsedError;

  /// Encounters won this generation.
  int get encountersWon => throw _privateConstructorUsedError;

  /// Evolutionary Points accumulated this generation.
  int get evolutionaryPoints => throw _privateConstructorUsedError;

  /// Serializes this Creature to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Creature
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatureCopyWith<Creature> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatureCopyWith<$Res> {
  factory $CreatureCopyWith(Creature value, $Res Function(Creature) then) =
      _$CreatureCopyWithImpl<$Res, Creature>;
  @useResult
  $Res call(
      {String id,
      String name,
      int generation,
      CreatureStats stats,
      List<CreatureTrait> traits,
      EvolutionStage stage,
      BiomeType currentBiome,
      int survivalSeconds,
      int resourcesGathered,
      int encountersWon,
      int evolutionaryPoints});

  $CreatureStatsCopyWith<$Res> get stats;
}

/// @nodoc
class _$CreatureCopyWithImpl<$Res, $Val extends Creature>
    implements $CreatureCopyWith<$Res> {
  _$CreatureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Creature
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? generation = null,
    Object? stats = null,
    Object? traits = null,
    Object? stage = null,
    Object? currentBiome = null,
    Object? survivalSeconds = null,
    Object? resourcesGathered = null,
    Object? encountersWon = null,
    Object? evolutionaryPoints = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      generation: null == generation
          ? _value.generation
          : generation // ignore: cast_nullable_to_non_nullable
              as int,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as CreatureStats,
      traits: null == traits
          ? _value.traits
          : traits // ignore: cast_nullable_to_non_nullable
              as List<CreatureTrait>,
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as EvolutionStage,
      currentBiome: null == currentBiome
          ? _value.currentBiome
          : currentBiome // ignore: cast_nullable_to_non_nullable
              as BiomeType,
      survivalSeconds: null == survivalSeconds
          ? _value.survivalSeconds
          : survivalSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      resourcesGathered: null == resourcesGathered
          ? _value.resourcesGathered
          : resourcesGathered // ignore: cast_nullable_to_non_nullable
              as int,
      encountersWon: null == encountersWon
          ? _value.encountersWon
          : encountersWon // ignore: cast_nullable_to_non_nullable
              as int,
      evolutionaryPoints: null == evolutionaryPoints
          ? _value.evolutionaryPoints
          : evolutionaryPoints // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of Creature
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreatureStatsCopyWith<$Res> get stats {
    return $CreatureStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreatureImplCopyWith<$Res>
    implements $CreatureCopyWith<$Res> {
  factory _$$CreatureImplCopyWith(
          _$CreatureImpl value, $Res Function(_$CreatureImpl) then) =
      __$$CreatureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int generation,
      CreatureStats stats,
      List<CreatureTrait> traits,
      EvolutionStage stage,
      BiomeType currentBiome,
      int survivalSeconds,
      int resourcesGathered,
      int encountersWon,
      int evolutionaryPoints});

  @override
  $CreatureStatsCopyWith<$Res> get stats;
}

/// @nodoc
class __$$CreatureImplCopyWithImpl<$Res>
    extends _$CreatureCopyWithImpl<$Res, _$CreatureImpl>
    implements _$$CreatureImplCopyWith<$Res> {
  __$$CreatureImplCopyWithImpl(
      _$CreatureImpl _value, $Res Function(_$CreatureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Creature
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? generation = null,
    Object? stats = null,
    Object? traits = null,
    Object? stage = null,
    Object? currentBiome = null,
    Object? survivalSeconds = null,
    Object? resourcesGathered = null,
    Object? encountersWon = null,
    Object? evolutionaryPoints = null,
  }) {
    return _then(_$CreatureImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      generation: null == generation
          ? _value.generation
          : generation // ignore: cast_nullable_to_non_nullable
              as int,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as CreatureStats,
      traits: null == traits
          ? _value._traits
          : traits // ignore: cast_nullable_to_non_nullable
              as List<CreatureTrait>,
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as EvolutionStage,
      currentBiome: null == currentBiome
          ? _value.currentBiome
          : currentBiome // ignore: cast_nullable_to_non_nullable
              as BiomeType,
      survivalSeconds: null == survivalSeconds
          ? _value.survivalSeconds
          : survivalSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      resourcesGathered: null == resourcesGathered
          ? _value.resourcesGathered
          : resourcesGathered // ignore: cast_nullable_to_non_nullable
              as int,
      encountersWon: null == encountersWon
          ? _value.encountersWon
          : encountersWon // ignore: cast_nullable_to_non_nullable
              as int,
      evolutionaryPoints: null == evolutionaryPoints
          ? _value.evolutionaryPoints
          : evolutionaryPoints // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatureImpl extends _Creature {
  const _$CreatureImpl(
      {required this.id,
      required this.name,
      required this.generation,
      required this.stats,
      final List<CreatureTrait> traits = const [],
      this.stage = EvolutionStage.cellular,
      this.currentBiome = BiomeType.primordialSoup,
      this.survivalSeconds = 0,
      this.resourcesGathered = 0,
      this.encountersWon = 0,
      this.evolutionaryPoints = 0})
      : _traits = traits,
        super._();

  factory _$CreatureImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatureImplFromJson(json);

  /// Unique instance ID (UUID).
  @override
  final String id;

  /// Descriptive name (generated or player-chosen).
  @override
  final String name;

  /// Current generation number (starts at 1).
  @override
  final int generation;

  /// Primary and derived stats.
  @override
  final CreatureStats stats;

  /// All currently active traits.
  final List<CreatureTrait> _traits;

  /// All currently active traits.
  @override
  @JsonKey()
  List<CreatureTrait> get traits {
    if (_traits is EqualUnmodifiableListView) return _traits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_traits);
  }

  /// Current evolutionary stage.
  @override
  @JsonKey()
  final EvolutionStage stage;

  /// Current biome the creature inhabits.
  @override
  @JsonKey()
  final BiomeType currentBiome;

  /// Total survival time this generation (in seconds).
  @override
  @JsonKey()
  final int survivalSeconds;

  /// Resources gathered this generation.
  @override
  @JsonKey()
  final int resourcesGathered;

  /// Encounters won this generation.
  @override
  @JsonKey()
  final int encountersWon;

  /// Evolutionary Points accumulated this generation.
  @override
  @JsonKey()
  final int evolutionaryPoints;

  @override
  String toString() {
    return 'Creature(id: $id, name: $name, generation: $generation, stats: $stats, traits: $traits, stage: $stage, currentBiome: $currentBiome, survivalSeconds: $survivalSeconds, resourcesGathered: $resourcesGathered, encountersWon: $encountersWon, evolutionaryPoints: $evolutionaryPoints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatureImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.generation, generation) ||
                other.generation == generation) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            const DeepCollectionEquality().equals(other._traits, _traits) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.currentBiome, currentBiome) ||
                other.currentBiome == currentBiome) &&
            (identical(other.survivalSeconds, survivalSeconds) ||
                other.survivalSeconds == survivalSeconds) &&
            (identical(other.resourcesGathered, resourcesGathered) ||
                other.resourcesGathered == resourcesGathered) &&
            (identical(other.encountersWon, encountersWon) ||
                other.encountersWon == encountersWon) &&
            (identical(other.evolutionaryPoints, evolutionaryPoints) ||
                other.evolutionaryPoints == evolutionaryPoints));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      generation,
      stats,
      const DeepCollectionEquality().hash(_traits),
      stage,
      currentBiome,
      survivalSeconds,
      resourcesGathered,
      encountersWon,
      evolutionaryPoints);

  /// Create a copy of Creature
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatureImplCopyWith<_$CreatureImpl> get copyWith =>
      __$$CreatureImplCopyWithImpl<_$CreatureImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatureImplToJson(
      this,
    );
  }
}

abstract class _Creature extends Creature {
  const factory _Creature(
      {required final String id,
      required final String name,
      required final int generation,
      required final CreatureStats stats,
      final List<CreatureTrait> traits,
      final EvolutionStage stage,
      final BiomeType currentBiome,
      final int survivalSeconds,
      final int resourcesGathered,
      final int encountersWon,
      final int evolutionaryPoints}) = _$CreatureImpl;
  const _Creature._() : super._();

  factory _Creature.fromJson(Map<String, dynamic> json) =
      _$CreatureImpl.fromJson;

  /// Unique instance ID (UUID).
  @override
  String get id;

  /// Descriptive name (generated or player-chosen).
  @override
  String get name;

  /// Current generation number (starts at 1).
  @override
  int get generation;

  /// Primary and derived stats.
  @override
  CreatureStats get stats;

  /// All currently active traits.
  @override
  List<CreatureTrait> get traits;

  /// Current evolutionary stage.
  @override
  EvolutionStage get stage;

  /// Current biome the creature inhabits.
  @override
  BiomeType get currentBiome;

  /// Total survival time this generation (in seconds).
  @override
  int get survivalSeconds;

  /// Resources gathered this generation.
  @override
  int get resourcesGathered;

  /// Encounters won this generation.
  @override
  int get encountersWon;

  /// Evolutionary Points accumulated this generation.
  @override
  int get evolutionaryPoints;

  /// Create a copy of Creature
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatureImplCopyWith<_$CreatureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

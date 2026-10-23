// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generation_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GenerationSummary _$GenerationSummaryFromJson(Map<String, dynamic> json) {
  return _GenerationSummary.fromJson(json);
}

/// @nodoc
mixin _$GenerationSummary {
  int get generation => throw _privateConstructorUsedError;
  int get survivalSeconds => throw _privateConstructorUsedError;
  int get resourcesGathered => throw _privateConstructorUsedError;
  int get encountersWon => throw _privateConstructorUsedError;
  int get evolutionaryPoints => throw _privateConstructorUsedError;
  BiomeType get lastBiome => throw _privateConstructorUsedError;
  EvolutionStage get achievedStage => throw _privateConstructorUsedError;
  String get deathCause => throw _privateConstructorUsedError;

  /// Traits the creature had at death (for inheritance).
  List<String> get traitIds => throw _privateConstructorUsedError;

  /// EP breakdown by category.
  Map<String, int> get epBreakdown => throw _privateConstructorUsedError;

  /// Serializes this GenerationSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenerationSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenerationSummaryCopyWith<GenerationSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerationSummaryCopyWith<$Res> {
  factory $GenerationSummaryCopyWith(
          GenerationSummary value, $Res Function(GenerationSummary) then) =
      _$GenerationSummaryCopyWithImpl<$Res, GenerationSummary>;
  @useResult
  $Res call(
      {int generation,
      int survivalSeconds,
      int resourcesGathered,
      int encountersWon,
      int evolutionaryPoints,
      BiomeType lastBiome,
      EvolutionStage achievedStage,
      String deathCause,
      List<String> traitIds,
      Map<String, int> epBreakdown});
}

/// @nodoc
class _$GenerationSummaryCopyWithImpl<$Res, $Val extends GenerationSummary>
    implements $GenerationSummaryCopyWith<$Res> {
  _$GenerationSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenerationSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generation = null,
    Object? survivalSeconds = null,
    Object? resourcesGathered = null,
    Object? encountersWon = null,
    Object? evolutionaryPoints = null,
    Object? lastBiome = null,
    Object? achievedStage = null,
    Object? deathCause = null,
    Object? traitIds = null,
    Object? epBreakdown = null,
  }) {
    return _then(_value.copyWith(
      generation: null == generation
          ? _value.generation
          : generation // ignore: cast_nullable_to_non_nullable
              as int,
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
      lastBiome: null == lastBiome
          ? _value.lastBiome
          : lastBiome // ignore: cast_nullable_to_non_nullable
              as BiomeType,
      achievedStage: null == achievedStage
          ? _value.achievedStage
          : achievedStage // ignore: cast_nullable_to_non_nullable
              as EvolutionStage,
      deathCause: null == deathCause
          ? _value.deathCause
          : deathCause // ignore: cast_nullable_to_non_nullable
              as String,
      traitIds: null == traitIds
          ? _value.traitIds
          : traitIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      epBreakdown: null == epBreakdown
          ? _value.epBreakdown
          : epBreakdown // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenerationSummaryImplCopyWith<$Res>
    implements $GenerationSummaryCopyWith<$Res> {
  factory _$$GenerationSummaryImplCopyWith(_$GenerationSummaryImpl value,
          $Res Function(_$GenerationSummaryImpl) then) =
      __$$GenerationSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int generation,
      int survivalSeconds,
      int resourcesGathered,
      int encountersWon,
      int evolutionaryPoints,
      BiomeType lastBiome,
      EvolutionStage achievedStage,
      String deathCause,
      List<String> traitIds,
      Map<String, int> epBreakdown});
}

/// @nodoc
class __$$GenerationSummaryImplCopyWithImpl<$Res>
    extends _$GenerationSummaryCopyWithImpl<$Res, _$GenerationSummaryImpl>
    implements _$$GenerationSummaryImplCopyWith<$Res> {
  __$$GenerationSummaryImplCopyWithImpl(_$GenerationSummaryImpl _value,
      $Res Function(_$GenerationSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenerationSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generation = null,
    Object? survivalSeconds = null,
    Object? resourcesGathered = null,
    Object? encountersWon = null,
    Object? evolutionaryPoints = null,
    Object? lastBiome = null,
    Object? achievedStage = null,
    Object? deathCause = null,
    Object? traitIds = null,
    Object? epBreakdown = null,
  }) {
    return _then(_$GenerationSummaryImpl(
      generation: null == generation
          ? _value.generation
          : generation // ignore: cast_nullable_to_non_nullable
              as int,
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
      lastBiome: null == lastBiome
          ? _value.lastBiome
          : lastBiome // ignore: cast_nullable_to_non_nullable
              as BiomeType,
      achievedStage: null == achievedStage
          ? _value.achievedStage
          : achievedStage // ignore: cast_nullable_to_non_nullable
              as EvolutionStage,
      deathCause: null == deathCause
          ? _value.deathCause
          : deathCause // ignore: cast_nullable_to_non_nullable
              as String,
      traitIds: null == traitIds
          ? _value._traitIds
          : traitIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      epBreakdown: null == epBreakdown
          ? _value._epBreakdown
          : epBreakdown // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerationSummaryImpl extends _GenerationSummary {
  const _$GenerationSummaryImpl(
      {required this.generation,
      required this.survivalSeconds,
      required this.resourcesGathered,
      required this.encountersWon,
      required this.evolutionaryPoints,
      required this.lastBiome,
      required this.achievedStage,
      required this.deathCause,
      final List<String> traitIds = const [],
      final Map<String, int> epBreakdown = const {}})
      : _traitIds = traitIds,
        _epBreakdown = epBreakdown,
        super._();

  factory _$GenerationSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerationSummaryImplFromJson(json);

  @override
  final int generation;
  @override
  final int survivalSeconds;
  @override
  final int resourcesGathered;
  @override
  final int encountersWon;
  @override
  final int evolutionaryPoints;
  @override
  final BiomeType lastBiome;
  @override
  final EvolutionStage achievedStage;
  @override
  final String deathCause;

  /// Traits the creature had at death (for inheritance).
  final List<String> _traitIds;

  /// Traits the creature had at death (for inheritance).
  @override
  @JsonKey()
  List<String> get traitIds {
    if (_traitIds is EqualUnmodifiableListView) return _traitIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_traitIds);
  }

  /// EP breakdown by category.
  final Map<String, int> _epBreakdown;

  /// EP breakdown by category.
  @override
  @JsonKey()
  Map<String, int> get epBreakdown {
    if (_epBreakdown is EqualUnmodifiableMapView) return _epBreakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_epBreakdown);
  }

  @override
  String toString() {
    return 'GenerationSummary(generation: $generation, survivalSeconds: $survivalSeconds, resourcesGathered: $resourcesGathered, encountersWon: $encountersWon, evolutionaryPoints: $evolutionaryPoints, lastBiome: $lastBiome, achievedStage: $achievedStage, deathCause: $deathCause, traitIds: $traitIds, epBreakdown: $epBreakdown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerationSummaryImpl &&
            (identical(other.generation, generation) ||
                other.generation == generation) &&
            (identical(other.survivalSeconds, survivalSeconds) ||
                other.survivalSeconds == survivalSeconds) &&
            (identical(other.resourcesGathered, resourcesGathered) ||
                other.resourcesGathered == resourcesGathered) &&
            (identical(other.encountersWon, encountersWon) ||
                other.encountersWon == encountersWon) &&
            (identical(other.evolutionaryPoints, evolutionaryPoints) ||
                other.evolutionaryPoints == evolutionaryPoints) &&
            (identical(other.lastBiome, lastBiome) ||
                other.lastBiome == lastBiome) &&
            (identical(other.achievedStage, achievedStage) ||
                other.achievedStage == achievedStage) &&
            (identical(other.deathCause, deathCause) ||
                other.deathCause == deathCause) &&
            const DeepCollectionEquality().equals(other._traitIds, _traitIds) &&
            const DeepCollectionEquality()
                .equals(other._epBreakdown, _epBreakdown));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      generation,
      survivalSeconds,
      resourcesGathered,
      encountersWon,
      evolutionaryPoints,
      lastBiome,
      achievedStage,
      deathCause,
      const DeepCollectionEquality().hash(_traitIds),
      const DeepCollectionEquality().hash(_epBreakdown));

  /// Create a copy of GenerationSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerationSummaryImplCopyWith<_$GenerationSummaryImpl> get copyWith =>
      __$$GenerationSummaryImplCopyWithImpl<_$GenerationSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerationSummaryImplToJson(
      this,
    );
  }
}

abstract class _GenerationSummary extends GenerationSummary {
  const factory _GenerationSummary(
      {required final int generation,
      required final int survivalSeconds,
      required final int resourcesGathered,
      required final int encountersWon,
      required final int evolutionaryPoints,
      required final BiomeType lastBiome,
      required final EvolutionStage achievedStage,
      required final String deathCause,
      final List<String> traitIds,
      final Map<String, int> epBreakdown}) = _$GenerationSummaryImpl;
  const _GenerationSummary._() : super._();

  factory _GenerationSummary.fromJson(Map<String, dynamic> json) =
      _$GenerationSummaryImpl.fromJson;

  @override
  int get generation;
  @override
  int get survivalSeconds;
  @override
  int get resourcesGathered;
  @override
  int get encountersWon;
  @override
  int get evolutionaryPoints;
  @override
  BiomeType get lastBiome;
  @override
  EvolutionStage get achievedStage;
  @override
  String get deathCause;

  /// Traits the creature had at death (for inheritance).
  @override
  List<String> get traitIds;

  /// EP breakdown by category.
  @override
  Map<String, int> get epBreakdown;

  /// Create a copy of GenerationSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerationSummaryImplCopyWith<_$GenerationSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

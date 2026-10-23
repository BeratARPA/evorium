// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mutation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Mutation _$MutationFromJson(Map<String, dynamic> json) {
  return _Mutation.fromJson(json);
}

/// @nodoc
mixin _$Mutation {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  MutationRarity get rarity => throw _privateConstructorUsedError;
  MutationType get type => throw _privateConstructorUsedError;
  EvolutionStage get requiredStage => throw _privateConstructorUsedError;

  /// Trait granted when this mutation is applied (if any).
  String? get grantedTraitId => throw _privateConstructorUsedError;

  /// Required existing trait (for traitEvolution mutations).
  String? get requiredTraitId => throw _privateConstructorUsedError;

  /// Trait removed (for regressiveMutation).
  String? get removedTraitId => throw _privateConstructorUsedError;

  /// Required traits for synergyUnlock (both must be present).
  List<String> get requiredTraitIds => throw _privateConstructorUsedError;

  /// Direct stat modifications (e.g. {'atk': 3, 'spd': -1}).
  Map<String, int> get statModifiers => throw _privateConstructorUsedError;

  /// Preview of stat changes shown on card (may include trait effects).
  Map<String, int> get statPreview => throw _privateConstructorUsedError;

  /// Serializes this Mutation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Mutation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MutationCopyWith<Mutation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MutationCopyWith<$Res> {
  factory $MutationCopyWith(Mutation value, $Res Function(Mutation) then) =
      _$MutationCopyWithImpl<$Res, Mutation>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      MutationRarity rarity,
      MutationType type,
      EvolutionStage requiredStage,
      String? grantedTraitId,
      String? requiredTraitId,
      String? removedTraitId,
      List<String> requiredTraitIds,
      Map<String, int> statModifiers,
      Map<String, int> statPreview});
}

/// @nodoc
class _$MutationCopyWithImpl<$Res, $Val extends Mutation>
    implements $MutationCopyWith<$Res> {
  _$MutationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Mutation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? rarity = null,
    Object? type = null,
    Object? requiredStage = null,
    Object? grantedTraitId = freezed,
    Object? requiredTraitId = freezed,
    Object? removedTraitId = freezed,
    Object? requiredTraitIds = null,
    Object? statModifiers = null,
    Object? statPreview = null,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      rarity: null == rarity
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as MutationRarity,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MutationType,
      requiredStage: null == requiredStage
          ? _value.requiredStage
          : requiredStage // ignore: cast_nullable_to_non_nullable
              as EvolutionStage,
      grantedTraitId: freezed == grantedTraitId
          ? _value.grantedTraitId
          : grantedTraitId // ignore: cast_nullable_to_non_nullable
              as String?,
      requiredTraitId: freezed == requiredTraitId
          ? _value.requiredTraitId
          : requiredTraitId // ignore: cast_nullable_to_non_nullable
              as String?,
      removedTraitId: freezed == removedTraitId
          ? _value.removedTraitId
          : removedTraitId // ignore: cast_nullable_to_non_nullable
              as String?,
      requiredTraitIds: null == requiredTraitIds
          ? _value.requiredTraitIds
          : requiredTraitIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      statModifiers: null == statModifiers
          ? _value.statModifiers
          : statModifiers // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      statPreview: null == statPreview
          ? _value.statPreview
          : statPreview // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MutationImplCopyWith<$Res>
    implements $MutationCopyWith<$Res> {
  factory _$$MutationImplCopyWith(
          _$MutationImpl value, $Res Function(_$MutationImpl) then) =
      __$$MutationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      MutationRarity rarity,
      MutationType type,
      EvolutionStage requiredStage,
      String? grantedTraitId,
      String? requiredTraitId,
      String? removedTraitId,
      List<String> requiredTraitIds,
      Map<String, int> statModifiers,
      Map<String, int> statPreview});
}

/// @nodoc
class __$$MutationImplCopyWithImpl<$Res>
    extends _$MutationCopyWithImpl<$Res, _$MutationImpl>
    implements _$$MutationImplCopyWith<$Res> {
  __$$MutationImplCopyWithImpl(
      _$MutationImpl _value, $Res Function(_$MutationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Mutation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? rarity = null,
    Object? type = null,
    Object? requiredStage = null,
    Object? grantedTraitId = freezed,
    Object? requiredTraitId = freezed,
    Object? removedTraitId = freezed,
    Object? requiredTraitIds = null,
    Object? statModifiers = null,
    Object? statPreview = null,
  }) {
    return _then(_$MutationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      rarity: null == rarity
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as MutationRarity,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MutationType,
      requiredStage: null == requiredStage
          ? _value.requiredStage
          : requiredStage // ignore: cast_nullable_to_non_nullable
              as EvolutionStage,
      grantedTraitId: freezed == grantedTraitId
          ? _value.grantedTraitId
          : grantedTraitId // ignore: cast_nullable_to_non_nullable
              as String?,
      requiredTraitId: freezed == requiredTraitId
          ? _value.requiredTraitId
          : requiredTraitId // ignore: cast_nullable_to_non_nullable
              as String?,
      removedTraitId: freezed == removedTraitId
          ? _value.removedTraitId
          : removedTraitId // ignore: cast_nullable_to_non_nullable
              as String?,
      requiredTraitIds: null == requiredTraitIds
          ? _value._requiredTraitIds
          : requiredTraitIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      statModifiers: null == statModifiers
          ? _value._statModifiers
          : statModifiers // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      statPreview: null == statPreview
          ? _value._statPreview
          : statPreview // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MutationImpl extends _Mutation {
  const _$MutationImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.rarity,
      required this.type,
      required this.requiredStage,
      this.grantedTraitId,
      this.requiredTraitId,
      this.removedTraitId,
      final List<String> requiredTraitIds = const [],
      final Map<String, int> statModifiers = const {},
      final Map<String, int> statPreview = const {}})
      : _requiredTraitIds = requiredTraitIds,
        _statModifiers = statModifiers,
        _statPreview = statPreview,
        super._();

  factory _$MutationImpl.fromJson(Map<String, dynamic> json) =>
      _$$MutationImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final MutationRarity rarity;
  @override
  final MutationType type;
  @override
  final EvolutionStage requiredStage;

  /// Trait granted when this mutation is applied (if any).
  @override
  final String? grantedTraitId;

  /// Required existing trait (for traitEvolution mutations).
  @override
  final String? requiredTraitId;

  /// Trait removed (for regressiveMutation).
  @override
  final String? removedTraitId;

  /// Required traits for synergyUnlock (both must be present).
  final List<String> _requiredTraitIds;

  /// Required traits for synergyUnlock (both must be present).
  @override
  @JsonKey()
  List<String> get requiredTraitIds {
    if (_requiredTraitIds is EqualUnmodifiableListView)
      return _requiredTraitIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requiredTraitIds);
  }

  /// Direct stat modifications (e.g. {'atk': 3, 'spd': -1}).
  final Map<String, int> _statModifiers;

  /// Direct stat modifications (e.g. {'atk': 3, 'spd': -1}).
  @override
  @JsonKey()
  Map<String, int> get statModifiers {
    if (_statModifiers is EqualUnmodifiableMapView) return _statModifiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_statModifiers);
  }

  /// Preview of stat changes shown on card (may include trait effects).
  final Map<String, int> _statPreview;

  /// Preview of stat changes shown on card (may include trait effects).
  @override
  @JsonKey()
  Map<String, int> get statPreview {
    if (_statPreview is EqualUnmodifiableMapView) return _statPreview;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_statPreview);
  }

  @override
  String toString() {
    return 'Mutation(id: $id, name: $name, description: $description, rarity: $rarity, type: $type, requiredStage: $requiredStage, grantedTraitId: $grantedTraitId, requiredTraitId: $requiredTraitId, removedTraitId: $removedTraitId, requiredTraitIds: $requiredTraitIds, statModifiers: $statModifiers, statPreview: $statPreview)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MutationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.rarity, rarity) || other.rarity == rarity) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.requiredStage, requiredStage) ||
                other.requiredStage == requiredStage) &&
            (identical(other.grantedTraitId, grantedTraitId) ||
                other.grantedTraitId == grantedTraitId) &&
            (identical(other.requiredTraitId, requiredTraitId) ||
                other.requiredTraitId == requiredTraitId) &&
            (identical(other.removedTraitId, removedTraitId) ||
                other.removedTraitId == removedTraitId) &&
            const DeepCollectionEquality()
                .equals(other._requiredTraitIds, _requiredTraitIds) &&
            const DeepCollectionEquality()
                .equals(other._statModifiers, _statModifiers) &&
            const DeepCollectionEquality()
                .equals(other._statPreview, _statPreview));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      rarity,
      type,
      requiredStage,
      grantedTraitId,
      requiredTraitId,
      removedTraitId,
      const DeepCollectionEquality().hash(_requiredTraitIds),
      const DeepCollectionEquality().hash(_statModifiers),
      const DeepCollectionEquality().hash(_statPreview));

  /// Create a copy of Mutation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MutationImplCopyWith<_$MutationImpl> get copyWith =>
      __$$MutationImplCopyWithImpl<_$MutationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MutationImplToJson(
      this,
    );
  }
}

abstract class _Mutation extends Mutation {
  const factory _Mutation(
      {required final String id,
      required final String name,
      required final String description,
      required final MutationRarity rarity,
      required final MutationType type,
      required final EvolutionStage requiredStage,
      final String? grantedTraitId,
      final String? requiredTraitId,
      final String? removedTraitId,
      final List<String> requiredTraitIds,
      final Map<String, int> statModifiers,
      final Map<String, int> statPreview}) = _$MutationImpl;
  const _Mutation._() : super._();

  factory _Mutation.fromJson(Map<String, dynamic> json) =
      _$MutationImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  MutationRarity get rarity;
  @override
  MutationType get type;
  @override
  EvolutionStage get requiredStage;

  /// Trait granted when this mutation is applied (if any).
  @override
  String? get grantedTraitId;

  /// Required existing trait (for traitEvolution mutations).
  @override
  String? get requiredTraitId;

  /// Trait removed (for regressiveMutation).
  @override
  String? get removedTraitId;

  /// Required traits for synergyUnlock (both must be present).
  @override
  List<String> get requiredTraitIds;

  /// Direct stat modifications (e.g. {'atk': 3, 'spd': -1}).
  @override
  Map<String, int> get statModifiers;

  /// Preview of stat changes shown on card (may include trait effects).
  @override
  Map<String, int> get statPreview;

  /// Create a copy of Mutation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MutationImplCopyWith<_$MutationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

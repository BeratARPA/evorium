// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'creature_trait.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreatureTrait _$CreatureTraitFromJson(Map<String, dynamic> json) {
  return _CreatureTrait.fromJson(json);
}

/// @nodoc
mixin _$CreatureTrait {
  /// Unique trait identifier (e.g. 'compound_eye').
  String get id => throw _privateConstructorUsedError;

  /// Display name (e.g. 'Compound Eye').
  String get name => throw _privateConstructorUsedError;

  /// Trait category.
  TraitCategory get category => throw _privateConstructorUsedError;

  /// Current level of this trait (1 = base, 2+ = evolved).
  int get level => throw _privateConstructorUsedError;

  /// Stat modifier deltas applied to CreatureStats.
  /// Keys: 'atk', 'def', 'spd', 'per', 'adp', 'hp'
  Map<String, int> get statModifiers => throw _privateConstructorUsedError;

  /// IDs of traits this one synergises with.
  List<String> get synergyTraitIds => throw _privateConstructorUsedError;

  /// IDs of traits this one conflicts with.
  List<String> get conflictTraitIds => throw _privateConstructorUsedError;

  /// Whether this trait has been actively used this generation
  /// (increases inheritance chance).
  bool get isMarked => throw _privateConstructorUsedError;

  /// Serializes this CreatureTrait to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreatureTrait
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatureTraitCopyWith<CreatureTrait> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatureTraitCopyWith<$Res> {
  factory $CreatureTraitCopyWith(
          CreatureTrait value, $Res Function(CreatureTrait) then) =
      _$CreatureTraitCopyWithImpl<$Res, CreatureTrait>;
  @useResult
  $Res call(
      {String id,
      String name,
      TraitCategory category,
      int level,
      Map<String, int> statModifiers,
      List<String> synergyTraitIds,
      List<String> conflictTraitIds,
      bool isMarked});
}

/// @nodoc
class _$CreatureTraitCopyWithImpl<$Res, $Val extends CreatureTrait>
    implements $CreatureTraitCopyWith<$Res> {
  _$CreatureTraitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatureTrait
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? level = null,
    Object? statModifiers = null,
    Object? synergyTraitIds = null,
    Object? conflictTraitIds = null,
    Object? isMarked = null,
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TraitCategory,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      statModifiers: null == statModifiers
          ? _value.statModifiers
          : statModifiers // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      synergyTraitIds: null == synergyTraitIds
          ? _value.synergyTraitIds
          : synergyTraitIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      conflictTraitIds: null == conflictTraitIds
          ? _value.conflictTraitIds
          : conflictTraitIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isMarked: null == isMarked
          ? _value.isMarked
          : isMarked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreatureTraitImplCopyWith<$Res>
    implements $CreatureTraitCopyWith<$Res> {
  factory _$$CreatureTraitImplCopyWith(
          _$CreatureTraitImpl value, $Res Function(_$CreatureTraitImpl) then) =
      __$$CreatureTraitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      TraitCategory category,
      int level,
      Map<String, int> statModifiers,
      List<String> synergyTraitIds,
      List<String> conflictTraitIds,
      bool isMarked});
}

/// @nodoc
class __$$CreatureTraitImplCopyWithImpl<$Res>
    extends _$CreatureTraitCopyWithImpl<$Res, _$CreatureTraitImpl>
    implements _$$CreatureTraitImplCopyWith<$Res> {
  __$$CreatureTraitImplCopyWithImpl(
      _$CreatureTraitImpl _value, $Res Function(_$CreatureTraitImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreatureTrait
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? level = null,
    Object? statModifiers = null,
    Object? synergyTraitIds = null,
    Object? conflictTraitIds = null,
    Object? isMarked = null,
  }) {
    return _then(_$CreatureTraitImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TraitCategory,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      statModifiers: null == statModifiers
          ? _value._statModifiers
          : statModifiers // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      synergyTraitIds: null == synergyTraitIds
          ? _value._synergyTraitIds
          : synergyTraitIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      conflictTraitIds: null == conflictTraitIds
          ? _value._conflictTraitIds
          : conflictTraitIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isMarked: null == isMarked
          ? _value.isMarked
          : isMarked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatureTraitImpl extends _CreatureTrait {
  const _$CreatureTraitImpl(
      {required this.id,
      required this.name,
      required this.category,
      this.level = 1,
      final Map<String, int> statModifiers = const {},
      final List<String> synergyTraitIds = const [],
      final List<String> conflictTraitIds = const [],
      this.isMarked = false})
      : _statModifiers = statModifiers,
        _synergyTraitIds = synergyTraitIds,
        _conflictTraitIds = conflictTraitIds,
        super._();

  factory _$CreatureTraitImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatureTraitImplFromJson(json);

  /// Unique trait identifier (e.g. 'compound_eye').
  @override
  final String id;

  /// Display name (e.g. 'Compound Eye').
  @override
  final String name;

  /// Trait category.
  @override
  final TraitCategory category;

  /// Current level of this trait (1 = base, 2+ = evolved).
  @override
  @JsonKey()
  final int level;

  /// Stat modifier deltas applied to CreatureStats.
  /// Keys: 'atk', 'def', 'spd', 'per', 'adp', 'hp'
  final Map<String, int> _statModifiers;

  /// Stat modifier deltas applied to CreatureStats.
  /// Keys: 'atk', 'def', 'spd', 'per', 'adp', 'hp'
  @override
  @JsonKey()
  Map<String, int> get statModifiers {
    if (_statModifiers is EqualUnmodifiableMapView) return _statModifiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_statModifiers);
  }

  /// IDs of traits this one synergises with.
  final List<String> _synergyTraitIds;

  /// IDs of traits this one synergises with.
  @override
  @JsonKey()
  List<String> get synergyTraitIds {
    if (_synergyTraitIds is EqualUnmodifiableListView) return _synergyTraitIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_synergyTraitIds);
  }

  /// IDs of traits this one conflicts with.
  final List<String> _conflictTraitIds;

  /// IDs of traits this one conflicts with.
  @override
  @JsonKey()
  List<String> get conflictTraitIds {
    if (_conflictTraitIds is EqualUnmodifiableListView)
      return _conflictTraitIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conflictTraitIds);
  }

  /// Whether this trait has been actively used this generation
  /// (increases inheritance chance).
  @override
  @JsonKey()
  final bool isMarked;

  @override
  String toString() {
    return 'CreatureTrait(id: $id, name: $name, category: $category, level: $level, statModifiers: $statModifiers, synergyTraitIds: $synergyTraitIds, conflictTraitIds: $conflictTraitIds, isMarked: $isMarked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatureTraitImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.level, level) || other.level == level) &&
            const DeepCollectionEquality()
                .equals(other._statModifiers, _statModifiers) &&
            const DeepCollectionEquality()
                .equals(other._synergyTraitIds, _synergyTraitIds) &&
            const DeepCollectionEquality()
                .equals(other._conflictTraitIds, _conflictTraitIds) &&
            (identical(other.isMarked, isMarked) ||
                other.isMarked == isMarked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      category,
      level,
      const DeepCollectionEquality().hash(_statModifiers),
      const DeepCollectionEquality().hash(_synergyTraitIds),
      const DeepCollectionEquality().hash(_conflictTraitIds),
      isMarked);

  /// Create a copy of CreatureTrait
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatureTraitImplCopyWith<_$CreatureTraitImpl> get copyWith =>
      __$$CreatureTraitImplCopyWithImpl<_$CreatureTraitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatureTraitImplToJson(
      this,
    );
  }
}

abstract class _CreatureTrait extends CreatureTrait {
  const factory _CreatureTrait(
      {required final String id,
      required final String name,
      required final TraitCategory category,
      final int level,
      final Map<String, int> statModifiers,
      final List<String> synergyTraitIds,
      final List<String> conflictTraitIds,
      final bool isMarked}) = _$CreatureTraitImpl;
  const _CreatureTrait._() : super._();

  factory _CreatureTrait.fromJson(Map<String, dynamic> json) =
      _$CreatureTraitImpl.fromJson;

  /// Unique trait identifier (e.g. 'compound_eye').
  @override
  String get id;

  /// Display name (e.g. 'Compound Eye').
  @override
  String get name;

  /// Trait category.
  @override
  TraitCategory get category;

  /// Current level of this trait (1 = base, 2+ = evolved).
  @override
  int get level;

  /// Stat modifier deltas applied to CreatureStats.
  /// Keys: 'atk', 'def', 'spd', 'per', 'adp', 'hp'
  @override
  Map<String, int> get statModifiers;

  /// IDs of traits this one synergises with.
  @override
  List<String> get synergyTraitIds;

  /// IDs of traits this one conflicts with.
  @override
  List<String> get conflictTraitIds;

  /// Whether this trait has been actively used this generation
  /// (increases inheritance chance).
  @override
  bool get isMarked;

  /// Create a copy of CreatureTrait
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatureTraitImplCopyWith<_$CreatureTraitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

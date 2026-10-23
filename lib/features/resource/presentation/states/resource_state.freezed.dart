// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resource_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResourceState {
  PlayerResources get resources => throw _privateConstructorUsedError;
  bool get isGathering => throw _privateConstructorUsedError;

  /// Global gather cooldown for the BottomActions Gather button.
  int get gatherCooldown => throw _privateConstructorUsedError;

  /// Active resource nodes in the current biome.
  List<ResourceNode> get nodes => throw _privateConstructorUsedError;

  /// Create a copy of ResourceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResourceStateCopyWith<ResourceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResourceStateCopyWith<$Res> {
  factory $ResourceStateCopyWith(
          ResourceState value, $Res Function(ResourceState) then) =
      _$ResourceStateCopyWithImpl<$Res, ResourceState>;
  @useResult
  $Res call(
      {PlayerResources resources,
      bool isGathering,
      int gatherCooldown,
      List<ResourceNode> nodes});

  $PlayerResourcesCopyWith<$Res> get resources;
}

/// @nodoc
class _$ResourceStateCopyWithImpl<$Res, $Val extends ResourceState>
    implements $ResourceStateCopyWith<$Res> {
  _$ResourceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResourceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resources = null,
    Object? isGathering = null,
    Object? gatherCooldown = null,
    Object? nodes = null,
  }) {
    return _then(_value.copyWith(
      resources: null == resources
          ? _value.resources
          : resources // ignore: cast_nullable_to_non_nullable
              as PlayerResources,
      isGathering: null == isGathering
          ? _value.isGathering
          : isGathering // ignore: cast_nullable_to_non_nullable
              as bool,
      gatherCooldown: null == gatherCooldown
          ? _value.gatherCooldown
          : gatherCooldown // ignore: cast_nullable_to_non_nullable
              as int,
      nodes: null == nodes
          ? _value.nodes
          : nodes // ignore: cast_nullable_to_non_nullable
              as List<ResourceNode>,
    ) as $Val);
  }

  /// Create a copy of ResourceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlayerResourcesCopyWith<$Res> get resources {
    return $PlayerResourcesCopyWith<$Res>(_value.resources, (value) {
      return _then(_value.copyWith(resources: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResourceStateImplCopyWith<$Res>
    implements $ResourceStateCopyWith<$Res> {
  factory _$$ResourceStateImplCopyWith(
          _$ResourceStateImpl value, $Res Function(_$ResourceStateImpl) then) =
      __$$ResourceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PlayerResources resources,
      bool isGathering,
      int gatherCooldown,
      List<ResourceNode> nodes});

  @override
  $PlayerResourcesCopyWith<$Res> get resources;
}

/// @nodoc
class __$$ResourceStateImplCopyWithImpl<$Res>
    extends _$ResourceStateCopyWithImpl<$Res, _$ResourceStateImpl>
    implements _$$ResourceStateImplCopyWith<$Res> {
  __$$ResourceStateImplCopyWithImpl(
      _$ResourceStateImpl _value, $Res Function(_$ResourceStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResourceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resources = null,
    Object? isGathering = null,
    Object? gatherCooldown = null,
    Object? nodes = null,
  }) {
    return _then(_$ResourceStateImpl(
      resources: null == resources
          ? _value.resources
          : resources // ignore: cast_nullable_to_non_nullable
              as PlayerResources,
      isGathering: null == isGathering
          ? _value.isGathering
          : isGathering // ignore: cast_nullable_to_non_nullable
              as bool,
      gatherCooldown: null == gatherCooldown
          ? _value.gatherCooldown
          : gatherCooldown // ignore: cast_nullable_to_non_nullable
              as int,
      nodes: null == nodes
          ? _value._nodes
          : nodes // ignore: cast_nullable_to_non_nullable
              as List<ResourceNode>,
    ));
  }
}

/// @nodoc

class _$ResourceStateImpl extends _ResourceState {
  const _$ResourceStateImpl(
      {required this.resources,
      this.isGathering = false,
      this.gatherCooldown = 0,
      final List<ResourceNode> nodes = const []})
      : _nodes = nodes,
        super._();

  @override
  final PlayerResources resources;
  @override
  @JsonKey()
  final bool isGathering;

  /// Global gather cooldown for the BottomActions Gather button.
  @override
  @JsonKey()
  final int gatherCooldown;

  /// Active resource nodes in the current biome.
  final List<ResourceNode> _nodes;

  /// Active resource nodes in the current biome.
  @override
  @JsonKey()
  List<ResourceNode> get nodes {
    if (_nodes is EqualUnmodifiableListView) return _nodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nodes);
  }

  @override
  String toString() {
    return 'ResourceState(resources: $resources, isGathering: $isGathering, gatherCooldown: $gatherCooldown, nodes: $nodes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResourceStateImpl &&
            (identical(other.resources, resources) ||
                other.resources == resources) &&
            (identical(other.isGathering, isGathering) ||
                other.isGathering == isGathering) &&
            (identical(other.gatherCooldown, gatherCooldown) ||
                other.gatherCooldown == gatherCooldown) &&
            const DeepCollectionEquality().equals(other._nodes, _nodes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, resources, isGathering,
      gatherCooldown, const DeepCollectionEquality().hash(_nodes));

  /// Create a copy of ResourceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResourceStateImplCopyWith<_$ResourceStateImpl> get copyWith =>
      __$$ResourceStateImplCopyWithImpl<_$ResourceStateImpl>(this, _$identity);
}

abstract class _ResourceState extends ResourceState {
  const factory _ResourceState(
      {required final PlayerResources resources,
      final bool isGathering,
      final int gatherCooldown,
      final List<ResourceNode> nodes}) = _$ResourceStateImpl;
  const _ResourceState._() : super._();

  @override
  PlayerResources get resources;
  @override
  bool get isGathering;

  /// Global gather cooldown for the BottomActions Gather button.
  @override
  int get gatherCooldown;

  /// Active resource nodes in the current biome.
  @override
  List<ResourceNode> get nodes;

  /// Create a copy of ResourceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResourceStateImplCopyWith<_$ResourceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

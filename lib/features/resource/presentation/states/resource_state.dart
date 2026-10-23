import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/player_resources.dart';
import '../../domain/entities/resource_node.dart';

part 'resource_state.freezed.dart';

@freezed
class ResourceState with _$ResourceState {
  const factory ResourceState({
    required PlayerResources resources,
    @Default(false) bool isGathering,

    /// Global gather cooldown for the BottomActions Gather button.
    @Default(0) int gatherCooldown,

    /// Active resource nodes in the current biome.
    @Default([]) List<ResourceNode> nodes,
  }) = _ResourceState;

  const ResourceState._();

  factory ResourceState.initial() =>
      ResourceState(resources: PlayerResources.initial());

  bool get canGather => !isGathering && gatherCooldown <= 0;
  bool get hasAnyNodeAvailable => nodes.any((n) => n.isAvailable);
}

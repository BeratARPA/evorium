import 'dart:math';

import 'package:are_engine_core/are_engine_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/di/injection.dart';
import '../../../../core/domain/enums/biome_type.dart';
import '../../../../core/domain/enums/resource_type.dart';
import '../../../../core/rules/game_events.dart';
import '../../domain/entities/player_resources.dart';
import '../../domain/entities/resource_node.dart';
import '../../domain/usecases/gather_resources_use_case.dart';
import '../states/resource_state.dart';

class ResourceNotifier extends Notifier<ResourceState> {
  static const _slotId = 'slot_0';
  static const _gatherCooldownTicks = 3;

  /// Ticks a node stays depleted after gathering.
  static const _nodeCooldownTicks = 15;

  @override
  ResourceState build() => ResourceState.initial();

  // ── Lifecycle ─────────────────────────────────────────────────────────────

  void initialize([PlayerResources? initial]) {
    state = ResourceState(
      resources: initial ?? PlayerResources.initial(),
      nodes: state.nodes,
    );
  }

  /// Set resource nodes for the given biome. Call when biome loads or changes.
  void initializeNodes(BiomeType biome) {
    state = state.copyWith(nodes: ResourceNode.nodesFor(biome));
  }

  // ── Tick ─────────────────────────────────────────────────────────────────

  void onTick() {
    final newCooldown =
        state.gatherCooldown > 0 ? state.gatherCooldown - 1 : 0;
    final newNodes = state.nodes.map((n) => n.tick()).toList();
    state = state.copyWith(gatherCooldown: newCooldown, nodes: newNodes);
  }

  // ── Global Gather (BottomActions button) ──────────────────────────────────

  Future<GatherResult?> gather({
    required BiomeType biome,
    required int gatheringSpeed,
  }) async {
    if (!state.canGather) return null;
    state = state.copyWith(isGathering: true);
    try {
      final result = await sl<GatherResourcesUseCase>()(GatherResourcesParams(
        slotId: _slotId,
        resources: state.resources,
        biome: biome,
        gatheringSpeed: gatheringSpeed,
      ));
      state = state.copyWith(
        resources: result.resources,
        isGathering: false,
        gatherCooldown: _gatherCooldownTicks,
      );
      _fireCollectedEvents(result.gains);
      return result;
    } catch (_) {
      state = state.copyWith(isGathering: false);
      return null;
    }
  }

  // ── Node Gather (tap a node in the game area) ─────────────────────────────

  void gatherNode(int nodeIndex, int gatheringSpeed) {
    final nodes = state.nodes;
    if (nodeIndex < 0 || nodeIndex >= nodes.length) return;
    final node = nodes[nodeIndex];
    if (!node.isAvailable) return;

    final base = 5 + (gatheringSpeed / 2).round();
    final amount = (base + Random().nextInt(5) - 1).clamp(1, base + 4);

    PlayerResources updated = state.resources;
    switch (node.type) {
      case ResourceType.food:
        updated = updated.addFood(amount);
      case ResourceType.minerals:
        updated = updated.addMinerals(amount);
      case ResourceType.biochemical:
        updated = updated.addBiochemical(amount);
      default:
        break;
    }

    final newNodes = [...nodes];
    newNodes[nodeIndex] = node.withCooldown(_nodeCooldownTicks);
    state = state.copyWith(resources: updated, nodes: newNodes);

    sl<AreEngine>().fire(
      GameEvents.resourceCollected,
      (e) => e
        ..set('resource_type', node.type.name)
        ..set('amount', amount),
    );

    final allDepleted = newNodes
        .where((n) => n.type == node.type)
        .every((n) => !n.isAvailable);
    if (allDepleted) {
      sl<AreEngine>().fire(
        GameEvents.resourceDepleted,
        (e) => e..set('resource_type', node.type.name),
      );
    }
  }

  // ── Metabolic Consumption ─────────────────────────────────────────────────

  bool consumeFood(double metabolismSpeed) {
    final consumption = metabolismSpeed.round().clamp(1, 5);
    if (state.resources.food >= consumption) {
      state = state.copyWith(
        resources: state.resources.consumeFood(consumption),
      );
      return true;
    }
    state = state.copyWith(resources: state.resources.copyWith(food: 0));
    return false;
  }

  // ── Currency ──────────────────────────────────────────────────────────────

  void addEP(int amount) {
    state = state.copyWith(resources: state.resources.addEP(amount));
  }

  void reset() => state = ResourceState.initial();

  // ── Helpers ───────────────────────────────────────────────────────────────

  void _fireCollectedEvents(Map<ResourceType, int> gains) {
    for (final entry in gains.entries) {
      if (entry.value > 0) {
        sl<AreEngine>().fire(
          GameEvents.resourceCollected,
          (e) => e
            ..set('resource_type', entry.key.name)
            ..set('amount', entry.value),
        );
      }
    }
  }
}

final resourceProvider =
    NotifierProvider<ResourceNotifier, ResourceState>(ResourceNotifier.new);

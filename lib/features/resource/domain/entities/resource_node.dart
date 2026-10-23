import 'dart:ui';

import '../../../../core/domain/enums/biome_type.dart';
import '../../../../core/domain/enums/resource_type.dart';

/// A gatherable resource node positioned in the biome area.
///
/// Positions use relative coordinates (0.0–1.0) so they scale to any
/// widget size at render time.
class ResourceNode {
  const ResourceNode({
    required this.type,
    required this.relativePos,
    this.cooldownTicks = 0,
  });

  final ResourceType type;

  /// Position relative to the game area. Both axes are 0.0–1.0.
  final Offset relativePos;

  /// Ticks remaining before this node can be gathered again.
  final int cooldownTicks;

  bool get isAvailable => cooldownTicks <= 0;

  ResourceNode withCooldown(int ticks) =>
      ResourceNode(type: type, relativePos: relativePos, cooldownTicks: ticks);

  ResourceNode tick() => cooldownTicks > 0
      ? ResourceNode(
          type: type,
          relativePos: relativePos,
          cooldownTicks: cooldownTicks - 1,
        )
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResourceNode &&
          type == other.type &&
          relativePos == other.relativePos &&
          cooldownTicks == other.cooldownTicks;

  @override
  int get hashCode => Object.hash(type, relativePos, cooldownTicks);

  // ── Biome node configurations ─────────────────────────────────────────────

  /// Returns the resource nodes for a given biome (fresh, zero cooldown).
  static List<ResourceNode> nodesFor(BiomeType biome) => switch (biome) {
        BiomeType.primordialSoup => const [
            ResourceNode(
              type: ResourceType.food,
              relativePos: Offset(0.22, 0.38),
            ),
            ResourceNode(
              type: ResourceType.food,
              relativePos: Offset(0.72, 0.58),
            ),
            ResourceNode(
              type: ResourceType.biochemical,
              relativePos: Offset(0.48, 0.26),
            ),
          ],
        BiomeType.thermalVents => const [
            ResourceNode(
              type: ResourceType.minerals,
              relativePos: Offset(0.20, 0.52),
            ),
            ResourceNode(
              type: ResourceType.minerals,
              relativePos: Offset(0.76, 0.40),
            ),
            ResourceNode(
              type: ResourceType.biochemical,
              relativePos: Offset(0.46, 0.68),
            ),
          ],
        BiomeType.frozenSubsurface => const [
            ResourceNode(
              type: ResourceType.minerals,
              relativePos: Offset(0.24, 0.48),
            ),
            ResourceNode(
              type: ResourceType.food,
              relativePos: Offset(0.68, 0.60),
            ),
            ResourceNode(
              type: ResourceType.biochemical,
              relativePos: Offset(0.50, 0.30),
            ),
          ],
        BiomeType.shallowSea => const [
            ResourceNode(
              type: ResourceType.food,
              relativePos: Offset(0.22, 0.40),
            ),
            ResourceNode(
              type: ResourceType.food,
              relativePos: Offset(0.68, 0.62),
            ),
            ResourceNode(
              type: ResourceType.biochemical,
              relativePos: Offset(0.44, 0.26),
            ),
            ResourceNode(
              type: ResourceType.minerals,
              relativePos: Offset(0.80, 0.45),
            ),
          ],
        BiomeType.coralReef => const [
            ResourceNode(
              type: ResourceType.food,
              relativePos: Offset(0.20, 0.50),
            ),
            ResourceNode(
              type: ResourceType.biochemical,
              relativePos: Offset(0.58, 0.28),
            ),
            ResourceNode(
              type: ResourceType.biochemical,
              relativePos: Offset(0.75, 0.65),
            ),
          ],
        BiomeType.deepOcean => const [
            ResourceNode(
              type: ResourceType.minerals,
              relativePos: Offset(0.28, 0.55),
            ),
            ResourceNode(
              type: ResourceType.food,
              relativePos: Offset(0.70, 0.42),
            ),
            ResourceNode(
              type: ResourceType.biochemical,
              relativePos: Offset(0.50, 0.70),
            ),
          ],
        BiomeType.coastalWetland => const [
            ResourceNode(
              type: ResourceType.food,
              relativePos: Offset(0.22, 0.44),
            ),
            ResourceNode(
              type: ResourceType.food,
              relativePos: Offset(0.68, 0.58),
            ),
            ResourceNode(
              type: ResourceType.biochemical,
              relativePos: Offset(0.46, 0.72),
            ),
          ],
        BiomeType.rainforest => const [
            ResourceNode(
              type: ResourceType.food,
              relativePos: Offset(0.18, 0.40),
            ),
            ResourceNode(
              type: ResourceType.food,
              relativePos: Offset(0.72, 0.56),
            ),
            ResourceNode(
              type: ResourceType.biochemical,
              relativePos: Offset(0.48, 0.26),
            ),
            ResourceNode(
              type: ResourceType.minerals,
              relativePos: Offset(0.34, 0.68),
            ),
          ],
        BiomeType.aridScrublands => const [
            ResourceNode(
              type: ResourceType.minerals,
              relativePos: Offset(0.25, 0.50),
            ),
            ResourceNode(
              type: ResourceType.minerals,
              relativePos: Offset(0.74, 0.42),
            ),
            ResourceNode(
              type: ResourceType.food,
              relativePos: Offset(0.50, 0.66),
            ),
          ],
        BiomeType.volcanicTerrain => const [
            ResourceNode(
              type: ResourceType.minerals,
              relativePos: Offset(0.20, 0.48),
            ),
            ResourceNode(
              type: ResourceType.minerals,
              relativePos: Offset(0.76, 0.44),
            ),
            ResourceNode(
              type: ResourceType.biochemical,
              relativePos: Offset(0.48, 0.28),
            ),
            ResourceNode(
              type: ResourceType.biochemical,
              relativePos: Offset(0.62, 0.70),
            ),
          ],
        BiomeType.iceAgeTundra => const [
            ResourceNode(
              type: ResourceType.minerals,
              relativePos: Offset(0.28, 0.46),
            ),
            ResourceNode(
              type: ResourceType.food,
              relativePos: Offset(0.68, 0.60),
            ),
            ResourceNode(
              type: ResourceType.biochemical,
              relativePos: Offset(0.48, 0.30),
            ),
          ],
      };
}

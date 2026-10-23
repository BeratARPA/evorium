import 'evolution_node.dart';

/// Pre-computed totals of all active evolution tree bonuses.
class AppliedEvolutionBonuses {
  const AppliedEvolutionBonuses({
    this.inheritanceRatioBonus = 0.0,
    this.extraTraitInheritance = 0,
    this.hpBonus = 0,
    this.foodReductionPercent = 0.0,
    this.encounterAtkPercent = 0.0,
    this.encounterDefPercent = 0.0,
    this.resourceGatherPercent = 0.0,
    this.extraResourceNodes = 0,
    this.epGainPercent = 0.0,
    this.keepEvolutionStage = false,
    this.guaranteedLegendary = false,
  });

  final double inheritanceRatioBonus;
  final int extraTraitInheritance;
  final int hpBonus;
  final double foodReductionPercent;
  final double encounterAtkPercent;
  final double encounterDefPercent;
  final double resourceGatherPercent;
  final int extraResourceNodes;
  final double epGainPercent;
  final bool keepEvolutionStage;
  final bool guaranteedLegendary;

  static const empty = AppliedEvolutionBonuses();

  /// Aggregates bonuses from all unlocked nodes.
  factory AppliedEvolutionBonuses.fromNodes(List<EvolutionNode> nodes) {
    final unlocked = nodes.where((n) => n.isUnlocked);
    var b = const AppliedEvolutionBonuses();

    for (final node in unlocked) {
      final v = node.bonus.value;
      switch (node.bonus.type) {
        case EvolutionBonusType.inheritanceRatioBonus:
          b = AppliedEvolutionBonuses(
            inheritanceRatioBonus: b.inheritanceRatioBonus + v,
            extraTraitInheritance: b.extraTraitInheritance,
            hpBonus: b.hpBonus,
            foodReductionPercent: b.foodReductionPercent,
            encounterAtkPercent: b.encounterAtkPercent,
            encounterDefPercent: b.encounterDefPercent,
            resourceGatherPercent: b.resourceGatherPercent,
            extraResourceNodes: b.extraResourceNodes,
            epGainPercent: b.epGainPercent,
            keepEvolutionStage: b.keepEvolutionStage,
            guaranteedLegendary: b.guaranteedLegendary,
          );
        case EvolutionBonusType.extraTraitInheritance:
          b = AppliedEvolutionBonuses(
            inheritanceRatioBonus: b.inheritanceRatioBonus,
            extraTraitInheritance: b.extraTraitInheritance + v.toInt(),
            hpBonus: b.hpBonus,
            foodReductionPercent: b.foodReductionPercent,
            encounterAtkPercent: b.encounterAtkPercent,
            encounterDefPercent: b.encounterDefPercent,
            resourceGatherPercent: b.resourceGatherPercent,
            extraResourceNodes: b.extraResourceNodes,
            epGainPercent: b.epGainPercent,
            keepEvolutionStage: b.keepEvolutionStage,
            guaranteedLegendary: b.guaranteedLegendary,
          );
        case EvolutionBonusType.hpBonus:
          b = AppliedEvolutionBonuses(
            inheritanceRatioBonus: b.inheritanceRatioBonus,
            extraTraitInheritance: b.extraTraitInheritance,
            hpBonus: b.hpBonus + v.toInt(),
            foodReductionPercent: b.foodReductionPercent,
            encounterAtkPercent: b.encounterAtkPercent,
            encounterDefPercent: b.encounterDefPercent,
            resourceGatherPercent: b.resourceGatherPercent,
            extraResourceNodes: b.extraResourceNodes,
            epGainPercent: b.epGainPercent,
            keepEvolutionStage: b.keepEvolutionStage,
            guaranteedLegendary: b.guaranteedLegendary,
          );
        case EvolutionBonusType.foodReductionPercent:
          b = AppliedEvolutionBonuses(
            inheritanceRatioBonus: b.inheritanceRatioBonus,
            extraTraitInheritance: b.extraTraitInheritance,
            hpBonus: b.hpBonus,
            foodReductionPercent: b.foodReductionPercent + v,
            encounterAtkPercent: b.encounterAtkPercent,
            encounterDefPercent: b.encounterDefPercent,
            resourceGatherPercent: b.resourceGatherPercent,
            extraResourceNodes: b.extraResourceNodes,
            epGainPercent: b.epGainPercent,
            keepEvolutionStage: b.keepEvolutionStage,
            guaranteedLegendary: b.guaranteedLegendary,
          );
        case EvolutionBonusType.encounterAtkPercent:
          b = AppliedEvolutionBonuses(
            inheritanceRatioBonus: b.inheritanceRatioBonus,
            extraTraitInheritance: b.extraTraitInheritance,
            hpBonus: b.hpBonus,
            foodReductionPercent: b.foodReductionPercent,
            encounterAtkPercent: b.encounterAtkPercent + v,
            encounterDefPercent: b.encounterDefPercent,
            resourceGatherPercent: b.resourceGatherPercent,
            extraResourceNodes: b.extraResourceNodes,
            epGainPercent: b.epGainPercent,
            keepEvolutionStage: b.keepEvolutionStage,
            guaranteedLegendary: b.guaranteedLegendary,
          );
        case EvolutionBonusType.encounterDefPercent:
          b = AppliedEvolutionBonuses(
            inheritanceRatioBonus: b.inheritanceRatioBonus,
            extraTraitInheritance: b.extraTraitInheritance,
            hpBonus: b.hpBonus,
            foodReductionPercent: b.foodReductionPercent,
            encounterAtkPercent: b.encounterAtkPercent,
            encounterDefPercent: b.encounterDefPercent + v,
            resourceGatherPercent: b.resourceGatherPercent,
            extraResourceNodes: b.extraResourceNodes,
            epGainPercent: b.epGainPercent,
            keepEvolutionStage: b.keepEvolutionStage,
            guaranteedLegendary: b.guaranteedLegendary,
          );
        case EvolutionBonusType.resourceGatherPercent:
          b = AppliedEvolutionBonuses(
            inheritanceRatioBonus: b.inheritanceRatioBonus,
            extraTraitInheritance: b.extraTraitInheritance,
            hpBonus: b.hpBonus,
            foodReductionPercent: b.foodReductionPercent,
            encounterAtkPercent: b.encounterAtkPercent,
            encounterDefPercent: b.encounterDefPercent,
            resourceGatherPercent: b.resourceGatherPercent + v,
            extraResourceNodes: b.extraResourceNodes,
            epGainPercent: b.epGainPercent,
            keepEvolutionStage: b.keepEvolutionStage,
            guaranteedLegendary: b.guaranteedLegendary,
          );
        case EvolutionBonusType.extraResourceNode:
          b = AppliedEvolutionBonuses(
            inheritanceRatioBonus: b.inheritanceRatioBonus,
            extraTraitInheritance: b.extraTraitInheritance,
            hpBonus: b.hpBonus,
            foodReductionPercent: b.foodReductionPercent,
            encounterAtkPercent: b.encounterAtkPercent,
            encounterDefPercent: b.encounterDefPercent,
            resourceGatherPercent: b.resourceGatherPercent,
            extraResourceNodes: b.extraResourceNodes + v.toInt(),
            epGainPercent: b.epGainPercent,
            keepEvolutionStage: b.keepEvolutionStage,
            guaranteedLegendary: b.guaranteedLegendary,
          );
        case EvolutionBonusType.epGainPercent:
          b = AppliedEvolutionBonuses(
            inheritanceRatioBonus: b.inheritanceRatioBonus,
            extraTraitInheritance: b.extraTraitInheritance,
            hpBonus: b.hpBonus,
            foodReductionPercent: b.foodReductionPercent,
            encounterAtkPercent: b.encounterAtkPercent,
            encounterDefPercent: b.encounterDefPercent,
            resourceGatherPercent: b.resourceGatherPercent,
            extraResourceNodes: b.extraResourceNodes,
            epGainPercent: b.epGainPercent + v,
            keepEvolutionStage: b.keepEvolutionStage,
            guaranteedLegendary: b.guaranteedLegendary,
          );
        case EvolutionBonusType.keepEvolutionStage:
          b = AppliedEvolutionBonuses(
            inheritanceRatioBonus: b.inheritanceRatioBonus,
            extraTraitInheritance: b.extraTraitInheritance,
            hpBonus: b.hpBonus,
            foodReductionPercent: b.foodReductionPercent,
            encounterAtkPercent: b.encounterAtkPercent,
            encounterDefPercent: b.encounterDefPercent,
            resourceGatherPercent: b.resourceGatherPercent,
            extraResourceNodes: b.extraResourceNodes,
            epGainPercent: b.epGainPercent,
            keepEvolutionStage: true,
            guaranteedLegendary: b.guaranteedLegendary,
          );
        case EvolutionBonusType.guaranteedLegendary:
          b = AppliedEvolutionBonuses(
            inheritanceRatioBonus: b.inheritanceRatioBonus,
            extraTraitInheritance: b.extraTraitInheritance,
            hpBonus: b.hpBonus,
            foodReductionPercent: b.foodReductionPercent,
            encounterAtkPercent: b.encounterAtkPercent,
            encounterDefPercent: b.encounterDefPercent,
            resourceGatherPercent: b.resourceGatherPercent,
            extraResourceNodes: b.extraResourceNodes,
            epGainPercent: b.epGainPercent,
            keepEvolutionStage: b.keepEvolutionStage,
            guaranteedLegendary: true,
          );
      }
    }
    return b;
  }
}

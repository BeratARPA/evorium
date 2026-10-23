enum EvolutionBonusType {
  inheritanceRatioBonus,
  extraTraitInheritance,
  hpBonus,
  foodReductionPercent,
  encounterAtkPercent,
  encounterDefPercent,
  resourceGatherPercent,
  extraResourceNode,
  epGainPercent,
  keepEvolutionStage,
  guaranteedLegendary,
}

class EvolutionBonus {
  const EvolutionBonus(this.type, this.value);

  final EvolutionBonusType type;
  final double value;

  String get displayText {
    switch (type) {
      case EvolutionBonusType.inheritanceRatioBonus:
        return '+${(value * 100).toInt()}% inheritance chance';
      case EvolutionBonusType.extraTraitInheritance:
        return '+${value.toInt()} extra inheritable traits';
      case EvolutionBonusType.hpBonus:
        return '+${value.toInt()} starting HP';
      case EvolutionBonusType.foodReductionPercent:
        return '-${(value * 100).toInt()}% food consumption';
      case EvolutionBonusType.encounterAtkPercent:
        return '+${(value * 100).toInt()}% encounter attack';
      case EvolutionBonusType.encounterDefPercent:
        return '+${(value * 100).toInt()}% encounter defense';
      case EvolutionBonusType.resourceGatherPercent:
        return '+${(value * 100).toInt()}% resource gathering';
      case EvolutionBonusType.extraResourceNode:
        return '+${value.toInt()} resource node(s)';
      case EvolutionBonusType.epGainPercent:
        return '+${(value * 100).toInt()}% EP gain';
      case EvolutionBonusType.keepEvolutionStage:
        return 'Keep evolution stage on death';
      case EvolutionBonusType.guaranteedLegendary:
        return 'Guaranteed legendary mutation slot';
    }
  }

  String get icon {
    switch (type) {
      case EvolutionBonusType.inheritanceRatioBonus:
        return '🧬';
      case EvolutionBonusType.extraTraitInheritance:
        return '➕';
      case EvolutionBonusType.hpBonus:
        return '❤️';
      case EvolutionBonusType.foodReductionPercent:
        return '🍃';
      case EvolutionBonusType.encounterAtkPercent:
        return '⚔️';
      case EvolutionBonusType.encounterDefPercent:
        return '🛡️';
      case EvolutionBonusType.resourceGatherPercent:
        return '🌿';
      case EvolutionBonusType.extraResourceNode:
        return '📦';
      case EvolutionBonusType.epGainPercent:
        return '⚡';
      case EvolutionBonusType.keepEvolutionStage:
        return '🔒';
      case EvolutionBonusType.guaranteedLegendary:
        return '🌟';
    }
  }
}

class EvolutionNode {
  EvolutionNode({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.epCost,
    required this.bonus,
    this.requiredNodeIds = const [],
    this.isUnlocked = false,
  });

  final String id;
  final String name;
  final String description;
  final String category;
  final int epCost;
  final List<String> requiredNodeIds;
  final EvolutionBonus bonus;
  bool isUnlocked;

  EvolutionNode copyWith({bool? isUnlocked}) {
    return EvolutionNode(
      id: id,
      name: name,
      description: description,
      category: category,
      epCost: epCost,
      bonus: bonus,
      requiredNodeIds: requiredNodeIds,
      isUnlocked: isUnlocked ?? this.isUnlocked,
    );
  }
}

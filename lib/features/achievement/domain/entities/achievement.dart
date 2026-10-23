enum AchievementCategory {
  survival,
  combat,
  evolution,
  collection,
  special,
}

class Achievement {
  const Achievement({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.icon,
    this.isUnlocked = false,
    this.unlockedAt,
  });

  final String id;
  final String name;
  final String description;
  final AchievementCategory category;
  final String icon;
  final bool isUnlocked;
  final DateTime? unlockedAt;

  Achievement copyWith({bool? isUnlocked, DateTime? unlockedAt}) {
    return Achievement(
      id: id,
      name: name,
      description: description,
      category: category,
      icon: icon,
      isUnlocked: isUnlocked ?? this.isUnlocked,
      unlockedAt: unlockedAt ?? this.unlockedAt,
    );
  }
}

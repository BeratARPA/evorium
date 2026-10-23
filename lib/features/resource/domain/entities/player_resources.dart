import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_resources.freezed.dart';
part 'player_resources.g.dart';

/// Tracks the player's current carried resources for one generation.
@freezed
class PlayerResources with _$PlayerResources {
  const factory PlayerResources({
    @Default(20) int food,
    @Default(0) int minerals,
    @Default(0) int biochemical,
    @Default(0) int evolutionaryPoints,

    /// Carrying limits (can be expanded by Evolution Tree).
    @Default(100) int maxFood,
    @Default(50) int maxMinerals,
    @Default(50) int maxBiochemical,
  }) = _PlayerResources;

  const PlayerResources._();

  factory PlayerResources.fromJson(Map<String, dynamic> json) =>
      _$PlayerResourcesFromJson(json);

  factory PlayerResources.initial() => const PlayerResources();

  int get totalGathered => food + minerals + biochemical;
  bool get isStarving => food == 0;
  bool get hasMinerals => minerals > 0;
  bool get hasBiochemical => biochemical > 0;

  PlayerResources addFood(int amount) =>
      copyWith(food: (food + amount).clamp(0, maxFood));

  PlayerResources addMinerals(int amount) =>
      copyWith(minerals: (minerals + amount).clamp(0, maxMinerals));

  PlayerResources addBiochemical(int amount) =>
      copyWith(biochemical: (biochemical + amount).clamp(0, maxBiochemical));

  PlayerResources addEP(int amount) =>
      copyWith(evolutionaryPoints: evolutionaryPoints + amount);

  PlayerResources consumeFood(int amount) =>
      copyWith(food: (food - amount).clamp(0, maxFood));
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'creature_stats.freezed.dart';
part 'creature_stats.g.dart';

/// The 6 primary stats of a creature plus derived values.
@freezed
class CreatureStats with _$CreatureStats {
  const factory CreatureStats({
    /// Current HP. Reaching 0 ends the generation.
    required int hp,

    /// Maximum HP ceiling.
    required int maxHp,

    /// Physical/chemical attack power.
    required int atk,

    /// Physical protection (shell, armor, thickness).
    required int def,

    /// Movement and reaction speed.
    required int spd,

    /// Sensory capacity (sight, smell, vibration).
    required int per,

    /// Environmental fit capacity.
    required int adp,

    /// Current energy units.
    @Default(100.0) double energy,

    /// Max energy = base + (adp * 2).
    @Default(100.0) double maxEnergy,

    /// How fast energy regenerates per tick.
    @Default(5.0) double energyRenewalRate,

    /// Resource consumption rate — high SPD = fast metabolism.
    @Default(1.0) double metabolismSpeed,
  }) = _CreatureStats;

  const CreatureStats._();

  factory CreatureStats.fromJson(Map<String, dynamic> json) =>
      _$CreatureStatsFromJson(json);

  /// Starting stats for a newly spawned cellular organism.
  factory CreatureStats.initial() => const CreatureStats(
        hp: 50,
        maxHp: 50,
        atk: 3,
        def: 2,
        spd: 4,
        per: 3,
        adp: 5,
        energy: 80.0,
        maxEnergy: 80.0,
      );

  bool get isAlive => hp > 0;
  bool get isLowHp => hp < (maxHp * 0.2);
  bool get isLowEnergy => energy < (maxEnergy * 0.2);

  double get hpPercent => hp / maxHp;
  double get energyPercent => energy / maxEnergy;

  /// Derived max energy from base + adp multiplier.
  double get computedMaxEnergy => 80 + (adp * 2.0);

  /// Apply a stat delta map. Only known stat keys are applied.
  CreatureStats applyModifiers(Map<String, int> modifiers) {
    return copyWith(
      atk: atk + (modifiers['atk'] ?? 0),
      def: def + (modifiers['def'] ?? 0),
      spd: spd + (modifiers['spd'] ?? 0),
      per: per + (modifiers['per'] ?? 0),
      adp: adp + (modifiers['adp'] ?? 0),
      maxHp: (maxHp + (modifiers['hp'] ?? 0)).clamp(1, 9999),
    );
  }
}

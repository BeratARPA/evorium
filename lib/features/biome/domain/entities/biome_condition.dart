import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/enums/season.dart';

part 'biome_condition.freezed.dart';
part 'biome_condition.g.dart';

/// Environmental conditions currently active in a biome.
@freezed
class BiomeCondition with _$BiomeCondition {
  const factory BiomeCondition({
    /// Temperature in Celsius. Creature ADP reduces biome penalties.
    required double temperature,

    /// Humidity 0–100%.
    required double humidity,

    /// Light level 0–100% (low at night, full during day).
    required double lightLevel,

    /// Pressure in atm (relevant for deep ocean / high altitude).
    @Default(1.0) double pressure,

    /// Current season.
    @Default(Season.spring) Season season,

    /// Whether it is currently nighttime.
    @Default(false) bool isNight,

    /// Food resource multiplier (modified by seasons/disasters).
    @Default(1.0) double foodMultiplier,

    /// Whether water resources are available.
    @Default(true) bool hasWater,

    /// Active disaster name, or null if none.
    String? activeDisaster,
  }) = _BiomeCondition;

  const BiomeCondition._();

  factory BiomeCondition.fromJson(Map<String, dynamic> json) =>
      _$BiomeConditionFromJson(json);

  bool get hasDisaster => activeDisaster != null;
  bool get isHot => temperature > 45;
  bool get isCold => temperature < 0;
  bool get isDrought => season == Season.drought;
}

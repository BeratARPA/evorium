// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biome_condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BiomeConditionImpl _$$BiomeConditionImplFromJson(Map<String, dynamic> json) =>
    _$BiomeConditionImpl(
      temperature: (json['temperature'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      lightLevel: (json['lightLevel'] as num).toDouble(),
      pressure: (json['pressure'] as num?)?.toDouble() ?? 1.0,
      season:
          $enumDecodeNullable(_$SeasonEnumMap, json['season']) ?? Season.spring,
      isNight: json['isNight'] as bool? ?? false,
      foodMultiplier: (json['foodMultiplier'] as num?)?.toDouble() ?? 1.0,
      hasWater: json['hasWater'] as bool? ?? true,
      activeDisaster: json['activeDisaster'] as String?,
    );

Map<String, dynamic> _$$BiomeConditionImplToJson(
        _$BiomeConditionImpl instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'lightLevel': instance.lightLevel,
      'pressure': instance.pressure,
      'season': _$SeasonEnumMap[instance.season]!,
      'isNight': instance.isNight,
      'foodMultiplier': instance.foodMultiplier,
      'hasWater': instance.hasWater,
      'activeDisaster': instance.activeDisaster,
    };

const _$SeasonEnumMap = {
  Season.spring: 'spring',
  Season.summer: 'summer',
  Season.autumn: 'autumn',
  Season.winter: 'winter',
  Season.drought: 'drought',
  Season.abundance: 'abundance',
  Season.disaster: 'disaster',
};

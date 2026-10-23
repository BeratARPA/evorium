// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creature_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreatureStatsImpl _$$CreatureStatsImplFromJson(Map<String, dynamic> json) =>
    _$CreatureStatsImpl(
      hp: (json['hp'] as num).toInt(),
      maxHp: (json['maxHp'] as num).toInt(),
      atk: (json['atk'] as num).toInt(),
      def: (json['def'] as num).toInt(),
      spd: (json['spd'] as num).toInt(),
      per: (json['per'] as num).toInt(),
      adp: (json['adp'] as num).toInt(),
      energy: (json['energy'] as num?)?.toDouble() ?? 100.0,
      maxEnergy: (json['maxEnergy'] as num?)?.toDouble() ?? 100.0,
      energyRenewalRate: (json['energyRenewalRate'] as num?)?.toDouble() ?? 5.0,
      metabolismSpeed: (json['metabolismSpeed'] as num?)?.toDouble() ?? 1.0,
    );

Map<String, dynamic> _$$CreatureStatsImplToJson(_$CreatureStatsImpl instance) =>
    <String, dynamic>{
      'hp': instance.hp,
      'maxHp': instance.maxHp,
      'atk': instance.atk,
      'def': instance.def,
      'spd': instance.spd,
      'per': instance.per,
      'adp': instance.adp,
      'energy': instance.energy,
      'maxEnergy': instance.maxEnergy,
      'energyRenewalRate': instance.energyRenewalRate,
      'metabolismSpeed': instance.metabolismSpeed,
    };

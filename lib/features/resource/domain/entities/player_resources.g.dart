// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_resources.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerResourcesImpl _$$PlayerResourcesImplFromJson(
        Map<String, dynamic> json) =>
    _$PlayerResourcesImpl(
      food: (json['food'] as num?)?.toInt() ?? 20,
      minerals: (json['minerals'] as num?)?.toInt() ?? 0,
      biochemical: (json['biochemical'] as num?)?.toInt() ?? 0,
      evolutionaryPoints: (json['evolutionaryPoints'] as num?)?.toInt() ?? 0,
      maxFood: (json['maxFood'] as num?)?.toInt() ?? 100,
      maxMinerals: (json['maxMinerals'] as num?)?.toInt() ?? 50,
      maxBiochemical: (json['maxBiochemical'] as num?)?.toInt() ?? 50,
    );

Map<String, dynamic> _$$PlayerResourcesImplToJson(
        _$PlayerResourcesImpl instance) =>
    <String, dynamic>{
      'food': instance.food,
      'minerals': instance.minerals,
      'biochemical': instance.biochemical,
      'evolutionaryPoints': instance.evolutionaryPoints,
      'maxFood': instance.maxFood,
      'maxMinerals': instance.maxMinerals,
      'maxBiochemical': instance.maxBiochemical,
    };

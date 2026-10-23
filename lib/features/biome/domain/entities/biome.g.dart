// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biome.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BiomeImpl _$$BiomeImplFromJson(Map<String, dynamic> json) => _$BiomeImpl(
      id: json['id'] as String,
      type: $enumDecode(_$BiomeTypeEnumMap, json['type']),
      requiredStage:
          $enumDecode(_$EvolutionStageEnumMap, json['requiredStage']),
      condition:
          BiomeCondition.fromJson(json['condition'] as Map<String, dynamic>),
      isDiscovered: json['isDiscovered'] as bool? ?? false,
      timeSpentSeconds: (json['timeSpentSeconds'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$BiomeImplToJson(_$BiomeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$BiomeTypeEnumMap[instance.type]!,
      'requiredStage': _$EvolutionStageEnumMap[instance.requiredStage]!,
      'condition': instance.condition,
      'isDiscovered': instance.isDiscovered,
      'timeSpentSeconds': instance.timeSpentSeconds,
    };

const _$BiomeTypeEnumMap = {
  BiomeType.primordialSoup: 'primordialSoup',
  BiomeType.thermalVents: 'thermalVents',
  BiomeType.frozenSubsurface: 'frozenSubsurface',
  BiomeType.shallowSea: 'shallowSea',
  BiomeType.coralReef: 'coralReef',
  BiomeType.deepOcean: 'deepOcean',
  BiomeType.coastalWetland: 'coastalWetland',
  BiomeType.rainforest: 'rainforest',
  BiomeType.aridScrublands: 'aridScrublands',
  BiomeType.volcanicTerrain: 'volcanicTerrain',
  BiomeType.iceAgeTundra: 'iceAgeTundra',
};

const _$EvolutionStageEnumMap = {
  EvolutionStage.cellular: 'cellular',
  EvolutionStage.multicellular: 'multicellular',
  EvolutionStage.landTransition: 'landTransition',
  EvolutionStage.social: 'social',
  EvolutionStage.dominantSpecies: 'dominantSpecies',
};

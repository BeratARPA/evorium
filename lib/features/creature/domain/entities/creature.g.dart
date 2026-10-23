// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreatureImpl _$$CreatureImplFromJson(Map<String, dynamic> json) =>
    _$CreatureImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      generation: (json['generation'] as num).toInt(),
      stats: CreatureStats.fromJson(json['stats'] as Map<String, dynamic>),
      traits: (json['traits'] as List<dynamic>?)
              ?.map((e) => CreatureTrait.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      stage: $enumDecodeNullable(_$EvolutionStageEnumMap, json['stage']) ??
          EvolutionStage.cellular,
      currentBiome:
          $enumDecodeNullable(_$BiomeTypeEnumMap, json['currentBiome']) ??
              BiomeType.primordialSoup,
      survivalSeconds: (json['survivalSeconds'] as num?)?.toInt() ?? 0,
      resourcesGathered: (json['resourcesGathered'] as num?)?.toInt() ?? 0,
      encountersWon: (json['encountersWon'] as num?)?.toInt() ?? 0,
      evolutionaryPoints: (json['evolutionaryPoints'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$CreatureImplToJson(_$CreatureImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'generation': instance.generation,
      'stats': instance.stats,
      'traits': instance.traits,
      'stage': _$EvolutionStageEnumMap[instance.stage]!,
      'currentBiome': _$BiomeTypeEnumMap[instance.currentBiome]!,
      'survivalSeconds': instance.survivalSeconds,
      'resourcesGathered': instance.resourcesGathered,
      'encountersWon': instance.encountersWon,
      'evolutionaryPoints': instance.evolutionaryPoints,
    };

const _$EvolutionStageEnumMap = {
  EvolutionStage.cellular: 'cellular',
  EvolutionStage.multicellular: 'multicellular',
  EvolutionStage.landTransition: 'landTransition',
  EvolutionStage.social: 'social',
  EvolutionStage.dominantSpecies: 'dominantSpecies',
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

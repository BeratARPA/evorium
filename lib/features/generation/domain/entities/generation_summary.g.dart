// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generation_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenerationSummaryImpl _$$GenerationSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$GenerationSummaryImpl(
      generation: (json['generation'] as num).toInt(),
      survivalSeconds: (json['survivalSeconds'] as num).toInt(),
      resourcesGathered: (json['resourcesGathered'] as num).toInt(),
      encountersWon: (json['encountersWon'] as num).toInt(),
      evolutionaryPoints: (json['evolutionaryPoints'] as num).toInt(),
      lastBiome: $enumDecode(_$BiomeTypeEnumMap, json['lastBiome']),
      achievedStage:
          $enumDecode(_$EvolutionStageEnumMap, json['achievedStage']),
      deathCause: json['deathCause'] as String,
      traitIds: (json['traitIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      epBreakdown: (json['epBreakdown'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const {},
    );

Map<String, dynamic> _$$GenerationSummaryImplToJson(
        _$GenerationSummaryImpl instance) =>
    <String, dynamic>{
      'generation': instance.generation,
      'survivalSeconds': instance.survivalSeconds,
      'resourcesGathered': instance.resourcesGathered,
      'encountersWon': instance.encountersWon,
      'evolutionaryPoints': instance.evolutionaryPoints,
      'lastBiome': _$BiomeTypeEnumMap[instance.lastBiome]!,
      'achievedStage': _$EvolutionStageEnumMap[instance.achievedStage]!,
      'deathCause': instance.deathCause,
      'traitIds': instance.traitIds,
      'epBreakdown': instance.epBreakdown,
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

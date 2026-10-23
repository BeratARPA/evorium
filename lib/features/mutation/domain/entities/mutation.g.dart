// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mutation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MutationImpl _$$MutationImplFromJson(Map<String, dynamic> json) =>
    _$MutationImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      rarity: $enumDecode(_$MutationRarityEnumMap, json['rarity']),
      type: $enumDecode(_$MutationTypeEnumMap, json['type']),
      requiredStage:
          $enumDecode(_$EvolutionStageEnumMap, json['requiredStage']),
      grantedTraitId: json['grantedTraitId'] as String?,
      requiredTraitId: json['requiredTraitId'] as String?,
      removedTraitId: json['removedTraitId'] as String?,
      requiredTraitIds: (json['requiredTraitIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      statModifiers: (json['statModifiers'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const {},
      statPreview: (json['statPreview'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const {},
    );

Map<String, dynamic> _$$MutationImplToJson(_$MutationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'rarity': _$MutationRarityEnumMap[instance.rarity]!,
      'type': _$MutationTypeEnumMap[instance.type]!,
      'requiredStage': _$EvolutionStageEnumMap[instance.requiredStage]!,
      'grantedTraitId': instance.grantedTraitId,
      'requiredTraitId': instance.requiredTraitId,
      'removedTraitId': instance.removedTraitId,
      'requiredTraitIds': instance.requiredTraitIds,
      'statModifiers': instance.statModifiers,
      'statPreview': instance.statPreview,
    };

const _$MutationRarityEnumMap = {
  MutationRarity.common: 'common',
  MutationRarity.rare: 'rare',
  MutationRarity.epic: 'epic',
  MutationRarity.legendary: 'legendary',
};

const _$MutationTypeEnumMap = {
  MutationType.newTrait: 'newTrait',
  MutationType.traitEvolution: 'traitEvolution',
  MutationType.statMutation: 'statMutation',
  MutationType.adaptiveMutation: 'adaptiveMutation',
  MutationType.regressiveMutation: 'regressiveMutation',
  MutationType.synergyUnlock: 'synergyUnlock',
};

const _$EvolutionStageEnumMap = {
  EvolutionStage.cellular: 'cellular',
  EvolutionStage.multicellular: 'multicellular',
  EvolutionStage.landTransition: 'landTransition',
  EvolutionStage.social: 'social',
  EvolutionStage.dominantSpecies: 'dominantSpecies',
};

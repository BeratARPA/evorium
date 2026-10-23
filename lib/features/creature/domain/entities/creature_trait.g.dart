// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creature_trait.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreatureTraitImpl _$$CreatureTraitImplFromJson(Map<String, dynamic> json) =>
    _$CreatureTraitImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      category: $enumDecode(_$TraitCategoryEnumMap, json['category']),
      level: (json['level'] as num?)?.toInt() ?? 1,
      statModifiers: (json['statModifiers'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const {},
      synergyTraitIds: (json['synergyTraitIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      conflictTraitIds: (json['conflictTraitIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isMarked: json['isMarked'] as bool? ?? false,
    );

Map<String, dynamic> _$$CreatureTraitImplToJson(_$CreatureTraitImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': _$TraitCategoryEnumMap[instance.category]!,
      'level': instance.level,
      'statModifiers': instance.statModifiers,
      'synergyTraitIds': instance.synergyTraitIds,
      'conflictTraitIds': instance.conflictTraitIds,
      'isMarked': instance.isMarked,
    };

const _$TraitCategoryEnumMap = {
  TraitCategory.structural: 'structural',
  TraitCategory.locomotion: 'locomotion',
  TraitCategory.sensory: 'sensory',
  TraitCategory.attack: 'attack',
  TraitCategory.defense: 'defense',
  TraitCategory.metabolic: 'metabolic',
  TraitCategory.social: 'social',
};

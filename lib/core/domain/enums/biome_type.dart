import 'evolution_stage.dart';

enum BiomeType {
  // Stage 1 – Cellular
  primordialSoup,
  thermalVents,
  frozenSubsurface,

  // Stage 2 – Multicellular
  shallowSea,
  coralReef,
  deepOcean,

  // Stage 3 – Land
  coastalWetland,
  rainforest,
  aridScrublands,
  volcanicTerrain,
  iceAgeTundra;

  EvolutionStage get requiredStage => switch (this) {
        primordialSoup || thermalVents || frozenSubsurface => EvolutionStage.cellular,
        shallowSea || coralReef || deepOcean => EvolutionStage.multicellular,
        coastalWetland => EvolutionStage.landTransition,
        rainforest || aridScrublands || volcanicTerrain || iceAgeTundra =>
          EvolutionStage.landTransition,
      };

  bool get isWater => requiredStage.isWater || this == coastalWetland;

  String get displayName => switch (this) {
        primordialSoup => 'Primordial Soup',
        thermalVents => 'Thermal Vents',
        frozenSubsurface => 'Frozen Subsurface',
        shallowSea => 'Shallow Sea',
        coralReef => 'Coral Reef',
        deepOcean => 'Deep Ocean',
        coastalWetland => 'Coastal Wetland',
        rainforest => 'Rainforest',
        aridScrublands => 'Arid Scrublands',
        volcanicTerrain => 'Volcanic Terrain',
        iceAgeTundra => 'Ice Age Tundra',
      };

  String get emoji => switch (this) {
        primordialSoup => '🦠',
        thermalVents => '🌋',
        frozenSubsurface => '🧊',
        shallowSea => '🌊',
        coralReef => '🪸',
        deepOcean => '🌑',
        coastalWetland => '🌿',
        rainforest => '🌳',
        aridScrublands => '🏜️',
        volcanicTerrain => '🌋',
        iceAgeTundra => '❄️',
      };
}

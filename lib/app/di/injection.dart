import 'package:are_engine_core/are_engine_core.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/rng/random_service.dart';
import '../../core/rules/game_rule_registry.dart';
import '../../core/storage/storage_keys.dart';
import '../../core/time/game_clock.dart';
import '../../features/achievement/domain/services/achievement_service.dart';
import '../../features/biome/data/repositories/biome_repository_impl.dart';
import '../../features/biome/domain/repositories/biome_repository.dart';
import '../../features/biome/domain/usecases/check_biome_transition_use_case.dart';
import '../../features/biome/domain/usecases/get_current_biome_use_case.dart';
import '../../features/biome/domain/usecases/transition_biome_use_case.dart';
import '../../features/creature/data/repositories/creature_repository_impl.dart';
import '../../features/creature/domain/repositories/creature_repository.dart';
import '../../features/creature/domain/usecases/apply_damage_use_case.dart';
import '../../features/creature/domain/usecases/get_creature_use_case.dart';
import '../../features/creature/domain/usecases/spawn_creature_use_case.dart';
import '../../features/encounter/data/repositories/encounter_asset_repository.dart';
import '../../features/encounter/domain/repositories/encounter_repository.dart';
import '../../features/encounter/domain/usecases/resolve_encounter_use_case.dart';
import '../../features/encounter/domain/usecases/trigger_encounter_use_case.dart';
import '../../features/evolution_tree/data/repositories/evolution_tree_repository_impl.dart';
import '../../features/evolution_tree/domain/repositories/evolution_tree_repository.dart';
import '../../features/evolution_tree/domain/usecases/get_evolution_bonuses_use_case.dart';
import '../../features/evolution_tree/domain/usecases/get_evolution_tree_use_case.dart';
import '../../features/evolution_tree/domain/usecases/unlock_evolution_node_use_case.dart';
import '../../features/generation/domain/services/inheritance_service.dart';
import '../../features/generation/domain/usecases/calculate_ep_use_case.dart';
import '../../features/generation/domain/usecases/next_generation_use_case.dart';
import '../../features/mutation/data/repositories/mutation_asset_repository.dart';
import '../../features/mutation/domain/repositories/mutation_repository.dart';
import '../../features/mutation/domain/usecases/apply_mutation_use_case.dart';
import '../../features/mutation/domain/usecases/draw_mutations_use_case.dart';
import '../../features/resource/data/repositories/resource_repository_impl.dart';
import '../../features/resource/domain/repositories/resource_repository.dart';
import '../../features/resource/domain/usecases/gather_resources_use_case.dart';
import '../../features/tutorial/domain/tutorial_service.dart';

final sl = GetIt.instance;

Future<void> configureDependencies() async {
  final prefs = await SharedPreferences.getInstance();

  // ── Core Services ──────────────────────────────────────────────────────
  sl.registerLazySingleton<AreEngine>(() => AreEngine());
  sl.registerLazySingleton<RandomService>(() => RandomService());
  sl.registerLazySingleton<GameClock>(() => GameClock(sl<AreEngine>()));
  sl.registerLazySingleton<GameRuleRegistry>(
    () => GameRuleRegistry(engine: sl<AreEngine>()),
  );

  // ── Repositories ──────────────────────────────────────────────────────
  sl.registerLazySingleton<CreatureRepository>(
    () => CreatureRepositoryImpl(Hive.box<String>(StorageKeys.creatureBox)),
  );
  sl.registerLazySingleton<BiomeRepository>(
    () => BiomeRepositoryImpl(Hive.box<String>(StorageKeys.biomeBox)),
  );
  sl.registerLazySingleton<ResourceRepository>(
    () => ResourceRepositoryImpl(Hive.box<String>(StorageKeys.resourcesBox)),
  );
  sl.registerLazySingleton<MutationRepository>(
    () => MutationAssetRepository(),
  );
  sl.registerLazySingleton<EncounterRepository>(
    () => EncounterAssetRepository(),
  );
  sl.registerLazySingleton<EvolutionTreeRepository>(
    () => EvolutionTreeRepositoryImpl(
      Hive.box<String>(StorageKeys.evolutionTreeBox),
    ),
  );

  // ── Domain Services ────────────────────────────────────────────────────
  sl.registerLazySingleton<InheritanceService>(() => InheritanceService(sl<RandomService>()));
  sl.registerLazySingleton<AchievementService>(() => AchievementService());
  sl.registerLazySingleton<TutorialService>(() => TutorialService(prefs));

  // ── Use Cases ─────────────────────────────────────────────────────────
  sl.registerFactory(() => GetCreatureUseCase(sl()));
  sl.registerFactory(() => SpawnCreatureUseCase(sl(), sl()));
  sl.registerFactory<CheckBiomeTransitionUseCase>(
    () => const CheckBiomeTransitionUseCase(),
  );
  sl.registerFactory(() => TransitionBiomeUseCase(sl<BiomeRepository>()));
  sl.registerFactory(() => ApplyDamageUseCase(sl()));
  sl.registerFactory(() => GetCurrentBiomeUseCase(sl()));
  sl.registerFactory(() => GatherResourcesUseCase(sl(), sl()));
  sl.registerFactory(() => DrawMutationsUseCase(sl(), sl()));
  sl.registerFactory(() => ApplyMutationUseCase(sl()));
  sl.registerFactory<CalculateEpUseCase>(() => const CalculateEpUseCase());
  sl.registerFactory(
    () => TriggerEncounterUseCase(sl<EncounterRepository>(), sl<RandomService>()),
  );
  sl.registerFactory(() => ResolveEncounterUseCase(sl<RandomService>()));
  sl.registerFactory(
    () => NextGenerationUseCase(
      sl<CreatureRepository>(),
      sl<InheritanceService>(),
      sl<EvolutionTreeRepository>(),
    ),
  );
  sl.registerFactory(
    () => GetEvolutionTreeUseCase(sl<EvolutionTreeRepository>()),
  );
  sl.registerFactory(
    () => UnlockEvolutionNodeUseCase(sl<EvolutionTreeRepository>()),
  );
  sl.registerFactory(
    () => GetEvolutionBonusesUseCase(sl<EvolutionTreeRepository>()),
  );

  // ── Register ARE Rules ────────────────────────────────────────────────
  sl<GameRuleRegistry>().registerAllRules();
}

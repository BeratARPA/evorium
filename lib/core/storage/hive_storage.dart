import 'package:hive_flutter/hive_flutter.dart';

import 'storage_keys.dart';

/// Manages Hive box lifecycle (open/close).
/// All boxes store JSON strings for simplicity (no type adapters needed).
class HiveStorage {
  const HiveStorage._();

  static Future<void> openBoxes() async {
    await Future.wait([
      Hive.openBox<String>(StorageKeys.saveSlotsBox),
      Hive.openBox<String>(StorageKeys.creatureBox),
      Hive.openBox<String>(StorageKeys.evolutionTreeBox),
      Hive.openBox<String>(StorageKeys.generationHistoryBox),
      Hive.openBox<String>(StorageKeys.settingsBox),
      Hive.openBox<String>(StorageKeys.achievementsBox),
      Hive.openBox<String>(StorageKeys.biomeBox),
      Hive.openBox<String>(StorageKeys.resourcesBox),
    ]);
  }

  static Future<void> closeBoxes() async {
    await Hive.close();
  }

  static Future<void> clearAll() async {
    for (final boxName in [
      StorageKeys.saveSlotsBox,
      StorageKeys.creatureBox,
      StorageKeys.evolutionTreeBox,
      StorageKeys.generationHistoryBox,
      StorageKeys.biomeBox,
      StorageKeys.resourcesBox,
    ]) {
      if (Hive.isBoxOpen(boxName)) {
        await Hive.box<String>(boxName).clear();
      }
    }
  }
}

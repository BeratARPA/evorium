import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../core/storage/hive_storage.dart';
import '../core/utils/game_logger.dart';
import 'di/injection.dart';

/// Initializes all app services before runApp.
Future<void> bootstrap() async {
  // Lock to portrait mode
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Init Hive
  await Hive.initFlutter();
  await HiveStorage.openBoxes();

  // Init GetIt service locator
  await configureDependencies();

  GameLogger.i('Bootstrap complete');
}

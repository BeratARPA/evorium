import 'package:logger/logger.dart';

/// Central logger for the Evorium game.
/// Wraps the `logger` package with game-specific prefixes.
class GameLogger {
  GameLogger._();

  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 8,
      lineLength: 80,
      colors: true,
      printEmojis: false,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );

  static void d(String message, [Object? extra]) =>
      _logger.d('[Evorium] $message', error: extra);

  static void i(String message, [Object? extra]) =>
      _logger.i('[Evorium] $message', error: extra);

  static void w(String message, [Object? extra]) =>
      _logger.w('[Evorium] $message', error: extra);

  static void e(String message, [Object? error, StackTrace? stackTrace]) =>
      _logger.e('[Evorium] $message', error: error, stackTrace: stackTrace);
}

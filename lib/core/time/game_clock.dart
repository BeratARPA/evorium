import 'dart:async';

import 'package:are_engine_core/are_engine_core.dart';

import '../rules/game_events.dart';
import '../utils/game_logger.dart';

/// Drives the game's event loop.
/// Fires [GameEvents.clockTick] on the ARE engine at a fixed interval.
class GameClock {
  GameClock(this._engine, {Duration tickInterval = const Duration(seconds: 1)})
      : _tickInterval = tickInterval;

  final AreEngine _engine;
  final Duration _tickInterval;

  StreamSubscription<void>? _subscription;
  int _tickCount = 0;

  bool get isRunning => _subscription != null;
  int get tickCount => _tickCount;

  void start() {
    if (isRunning) return;
    _subscription = Stream<void>.periodic(_tickInterval).listen((_) => _tick());
    GameLogger.i('GameClock started (interval: ${_tickInterval.inMilliseconds}ms)');
  }

  void stop() {
    _subscription?.cancel();
    _subscription = null;
    GameLogger.i('GameClock stopped at tick $_tickCount');
  }

  void reset() {
    stop();
    _tickCount = 0;
  }

  Future<void> _tick() async {
    _tickCount++;
    await _engine.fire(
      GameEvents.clockTick,
      (e) => e
        ..set('tick', _tickCount)
        ..set('timestamp', DateTime.now().millisecondsSinceEpoch),
    );
  }
}

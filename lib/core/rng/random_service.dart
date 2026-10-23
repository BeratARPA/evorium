import 'dart:math';

/// Seeded RNG service for reproducible game randomness.
/// Seed can be set at run start for deterministic replay.
class RandomService {
  RandomService({int? seed}) : _random = Random(seed);

  Random _random;

  /// Re-seed the generator (e.g. at new generation start).
  void reseed(int seed) => _random = Random(seed);

  /// Returns an int in [min, max] inclusive.
  int nextInt(int min, int max) {
    assert(min <= max, 'min must be <= max');
    return min + _random.nextInt(max - min + 1);
  }

  /// Returns a double in [0.0, 1.0).
  double nextDouble() => _random.nextDouble();

  /// Returns a double in [min, max).
  double nextDoubleBetween(double min, double max) {
    assert(min < max, 'min must be < max');
    return min + _random.nextDouble() * (max - min);
  }

  /// Returns true with the given probability (0.0–1.0).
  bool chance(double probability) => _random.nextDouble() < probability;

  /// Picks a random element from a list.
  T pick<T>(List<T> items) {
    assert(items.isNotEmpty, 'Cannot pick from empty list');
    return items[_random.nextInt(items.length)];
  }

  /// Shuffles a list in-place.
  void shuffle<T>(List<T> items) => items.shuffle(_random);

  /// Picks [count] unique random elements from [items].
  List<T> pickN<T>(List<T> items, int count) {
    final copy = List<T>.from(items);
    shuffle(copy);
    return copy.take(count).toList();
  }
}

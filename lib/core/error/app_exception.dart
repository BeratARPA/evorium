/// Base class for all Evorium domain exceptions.
abstract class AppException implements Exception {
  const AppException(this.message, {this.stackTrace});

  final String message;
  final StackTrace? stackTrace;

  @override
  String toString() => '$runtimeType: $message';
}

class StorageException extends AppException {
  const StorageException(super.message, {super.stackTrace});
}

class GameRuleException extends AppException {
  const GameRuleException(super.message, {super.stackTrace});
}

class CreatureException extends AppException {
  const CreatureException(super.message, {super.stackTrace});
}

class BiomeException extends AppException {
  const BiomeException(super.message, {super.stackTrace});
}

class EncounterException extends AppException {
  const EncounterException(super.message, {super.stackTrace});
}

class SaveLoadException extends AppException {
  const SaveLoadException(super.message, {super.stackTrace});
}

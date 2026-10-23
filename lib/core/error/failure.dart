import 'package:equatable/equatable.dart';

/// Sealed class hierarchy for operation failures (returned via Either-style).
sealed class Failure extends Equatable {
  const Failure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class StorageFailure extends Failure {
  const StorageFailure(super.message);
}

class CreatureFailure extends Failure {
  const CreatureFailure(super.message);
}

class BiomeFailure extends Failure {
  const BiomeFailure(super.message);
}

class EncounterFailure extends Failure {
  const EncounterFailure(super.message);
}

class GameRuleFailure extends Failure {
  const GameRuleFailure(super.message);
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure(super.message);
}

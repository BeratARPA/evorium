/// Base contract for all UseCases.
/// Each UseCase has exactly one public method: [call].
abstract interface class UseCase<Output, Input> {
  Future<Output> call(Input params);
}

/// UseCase with no parameters.
abstract interface class UseCaseNoParams<Output> {
  Future<Output> call();
}

/// Synchronous UseCase.
abstract interface class SyncUseCase<Output, Input> {
  Output call(Input params);
}

/// No-params synchronous UseCase.
abstract interface class SyncUseCaseNoParams<Output> {
  Output call();
}

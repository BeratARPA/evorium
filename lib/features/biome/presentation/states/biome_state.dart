import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/biome.dart';

part 'biome_state.freezed.dart';

@freezed
sealed class BiomeState with _$BiomeState {
  const factory BiomeState.initial() = BiomeStateInitial;
  const factory BiomeState.loading() = BiomeStateLoading;
  const factory BiomeState.loaded({required Biome biome}) = BiomeStateLoaded;
  const factory BiomeState.error(String message) = BiomeStateError;
}

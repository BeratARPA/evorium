import '../../../../core/domain/enums/biome_type.dart';
import '../entities/biome.dart';

abstract interface class BiomeRepository {
  Future<Biome?> getCurrentBiome(String slotId);
  Future<void> saveBiome(String slotId, Biome biome);
  Future<List<BiomeType>> getDiscoveredBiomes(String slotId);
}

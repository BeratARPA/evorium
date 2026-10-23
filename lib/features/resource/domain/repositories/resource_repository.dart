import '../entities/player_resources.dart';

abstract interface class ResourceRepository {
  Future<PlayerResources?> getResources(String slotId);
  Future<void> saveResources(String slotId, PlayerResources resources);
  Future<void> deleteResources(String slotId);
}

import '../entities/creature.dart';

abstract interface class CreatureRepository {
  /// Load the active creature for the given save slot.
  Future<Creature?> getActiveCreature(String slotId);

  /// Persist the creature state for the given save slot.
  Future<void> saveCreature(String slotId, Creature creature);

  /// Remove the active creature (on generation end / death).
  Future<void> deleteActiveCreature(String slotId);
}

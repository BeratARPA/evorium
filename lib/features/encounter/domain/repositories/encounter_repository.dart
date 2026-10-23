import '../../../../core/domain/enums/encounter_type.dart';
import '../entities/encounter.dart';

abstract interface class EncounterRepository {
  Future<List<Encounter>> getAllEncounters();
  Future<List<Encounter>> getEncountersByType(EncounterType type);
}

abstract class EvolutionTreeRepository {
  Future<List<String>> getUnlockedNodeIds();
  Future<void> unlockNode(String nodeId);
  Future<int> getEpBalance();
  Future<void> addEp(int ep);
  Future<void> spendEp(int ep);
}

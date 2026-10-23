import 'package:shared_preferences/shared_preferences.dart';

/// Tutorial hints shown during the first few generations.
enum TutorialHint {
  welcome,
  gather,
  mutations,
  clock,
  encounters,
  evolutionTree,
}

class TutorialService {
  TutorialService(this._prefs);

  final SharedPreferences _prefs;

  static const _prefix = 'tutorial_seen_';

  bool hasSeen(TutorialHint hint) =>
      _prefs.getBool('$_prefix${hint.name}') ?? false;

  Future<void> markSeen(TutorialHint hint) =>
      _prefs.setBool('$_prefix${hint.name}', true);

  Future<void> resetAll() async {
    for (final hint in TutorialHint.values) {
      await _prefs.remove('$_prefix${hint.name}');
    }
  }

  static String titleFor(TutorialHint hint) => switch (hint) {
        TutorialHint.welcome => 'Welcome to Evorium',
        TutorialHint.gather => 'Gathering Resources',
        TutorialHint.mutations => 'Mutations',
        TutorialHint.clock => 'Time Passes',
        TutorialHint.encounters => 'Encounters',
        TutorialHint.evolutionTree => 'Evolution Tree',
      };

  static String bodyFor(TutorialHint hint) => switch (hint) {
        TutorialHint.welcome =>
          'You are a living organism fighting to survive and evolve. Each generation ends in death — but your lineage carries on.',
        TutorialHint.gather =>
          'Tap GATHER to collect resources. Food keeps you alive. Evolutionary Points (EP) fund your Evolution Tree upgrades.',
        TutorialHint.mutations =>
          'Before each generation, you pick one mutation from three choices. Mutations grant new traits or boost your stats.',
        TutorialHint.clock =>
          'Time passes automatically. Food is consumed each second. If you run out, starvation deals 2 HP per tick.',
        TutorialHint.encounters =>
          'Tap EXPLORE to trigger encounters. Predators, prey, and discoveries await. Your traits influence the outcome.',
        TutorialHint.evolutionTree =>
          'Spend accumulated EP in the Evolution Tree to permanently improve your bloodline across all future generations.',
      };

  static String iconFor(TutorialHint hint) => switch (hint) {
        TutorialHint.welcome => '🧬',
        TutorialHint.gather => '🌿',
        TutorialHint.mutations => '🔬',
        TutorialHint.clock => '⏱️',
        TutorialHint.encounters => '⚔️',
        TutorialHint.evolutionTree => '🌳',
      };
}

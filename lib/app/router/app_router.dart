import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/achievement/presentation/pages/achievements_page.dart';
import '../../features/evolution_tree/presentation/pages/evolution_tree_page.dart';
import '../../features/game_shell/presentation/pages/game_shell_page.dart';
import '../../features/menu/presentation/pages/main_menu_page.dart';
import '../../features/menu/presentation/pages/settings_page.dart';
import '../../features/splash/presentation/splash_page.dart';

// Route paths
class AppRoutes {
  const AppRoutes._();

  static const String splash = '/';
  static const String mainMenu = '/menu';
  static const String gameShell = '/game';
  static const String evolutionTree = '/evolution-tree';
  static const String achievements = '/achievements';
  static const String settings = '/settings';
}

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.mainMenu,
        builder: (context, state) => const MainMenuPage(),
      ),
      GoRoute(
        path: AppRoutes.gameShell,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final isNewGame = extra?['isNewGame'] as bool? ?? true;
          return GameShellPage(isNewGame: isNewGame);
        },
      ),
      GoRoute(
        path: AppRoutes.settings,
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        path: AppRoutes.evolutionTree,
        builder: (context, state) => const EvolutionTreePage(),
      ),
      GoRoute(
        path: AppRoutes.achievements,
        builder: (context, state) => const AchievementsPage(),
      ),
    ],
  );
});

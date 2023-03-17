import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_foodapp/main.dart';
import 'package:two_foodapp/models/models.dart';
import 'package:two_foodapp/screens/screens.dart';

class AppRouter {
  final AppStateManager appStateManager;
  final ProfileManager profileManager;
  final GroceryManager groceryManager;

  AppRouter(this.appStateManager, this.profileManager, this.groceryManager);

  late final router = GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: appStateManager,
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => const OnboardingScreen(),
      )
      // home
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text('${state.error}'),
            ),
          ),
        ),
      );
    },
    redirect: (context, state) {
      final loggedIn = appStateManager.isLoggedIn;
      final loggingIn = state.subloc == '/login';
      if (!loggedIn) return loggingIn ? null : '/login';

      final isOnboardingComplete = appStateManager.isOnboardingComplete;
      final onboarding = state.subloc == '/onboarding';
      if (!isOnboardingComplete) return onboarding ? null : '/onboarding';

      if (loggingIn || onboarding) return '/${FoodAppTab.author}';
      return null;
    },
  );
}

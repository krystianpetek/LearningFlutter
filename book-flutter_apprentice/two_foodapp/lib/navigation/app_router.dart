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
      ),
      GoRoute(
        path: '/:tab',
        name: 'home',
        builder: (context, state) {
          final tab = int.tryParse(state.params['tab'] ?? '') ?? 1;
          return Home(key: state.pageKey, currentTab: tab);
        },
        routes: [
          GoRoute(
            path: 'item/:id',
            name: 'item',
            builder: (context, state) {
              final itemId = state.params['id'] ?? '';
              final item = groceryManager.getGroceryItem(itemId);
              return GroceryItemScreen(
                originalItem: item,
                onCreate: (item) {
                  groceryManager.addItem(item);
                },
                onUpdate: (item) {
                  groceryManager.updateItem(item);
                },
              );
            },
          ),
          GoRoute(
            name: 'profile',
            path: 'profile',
            builder: (context, state) {
              final tab = int.tryParse(state.params['tab'] ?? '') ?? 0;
              return ProfileScreen(
                  user: profileManager.getUser, currentTab: tab);
            },
            routes: [
              GoRoute(
                path: 'rw',
                name: 'rw',
                // not supported WebViewScreen
                redirect: (context, state) {
                  const LoginScreen();
                },
              )
            ],
          )
        ],
      ),
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

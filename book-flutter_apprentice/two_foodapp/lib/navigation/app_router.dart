import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_foodapp/models/models.dart';
import 'package:two_foodapp/screens/login_screen.dart';

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
            builder: (context, state) => const LoginScreen())
        // onboarding
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
      }
      //redirect
      );
}

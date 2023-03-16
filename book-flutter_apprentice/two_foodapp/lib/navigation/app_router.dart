import 'package:go_router/go_router.dart';
import 'package:two_foodapp/models/models.dart';

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
      // login
      // onboarding
      // home
    ],
    // error
    //redirect
  );
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_foodapp/foodapp_theme.dart';
import 'package:two_foodapp/models/models.dart';
import 'package:two_foodapp/navigation/app_router.dart';

void main() {
  final appStateManager = AppStateManager();

  runApp(FoodApp(
    appStateManager: appStateManager,
  ));
}

class FoodApp extends StatefulWidget {
  const FoodApp({super.key, required this.appStateManager});
  final AppStateManager appStateManager;
  @override
  FoodAppState createState() {
    return FoodAppState();
  }
}

class FoodAppState extends State<FoodApp> {
  late final _groceryManager = GroceryManager();
  late final _profileManager = ProfileManager();
  late final _appRouter = AppRouter(
    widget.appStateManager,
    _profileManager,
    _groceryManager,
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => AppStateManager()),
        ChangeNotifierProvider(
            create: (BuildContext context) => GroceryManager()),
        ChangeNotifierProvider(
            create: (BuildContext context) => ProfileManager()),
      ],
      child: Consumer<ProfileManager>(
        builder: (context, value, child) {
          ThemeData theme;
          if (_profileManager.darkMode) {
            theme = FoodAppTheme.dark();
          } else {
            theme = FoodAppTheme.light();
          }

          final router = _appRouter.router;
          return MaterialApp.router(
            theme: theme,
            title: 'FoodApp',
            scrollBehavior:
                const MaterialScrollBehavior().copyWith(dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
              PointerDeviceKind.unknown,
            }),
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
          );
        },
      ),
    );
  }
}

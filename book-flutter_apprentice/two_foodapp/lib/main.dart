import 'package:flutter/material.dart';
import 'package:two_foodapp/actions/dark_mode.dart';
import 'package:two_foodapp/foodapp_theme.dart';
import 'package:two_foodapp/home.dart';

void main() {
  runApp(const FoodApp());
}

class FoodApp extends StatefulWidget {
  const FoodApp({super.key});

  @override
  FoodAppState createState() {
    return FoodAppState();
  }
}

class FoodAppState extends State<FoodApp> {
  ThemeData newTheme = FoodAppTheme.light();

  darkMode() {
    if (newTheme.brightness.name == Brightness.dark.name) {
      newTheme = FoodAppTheme.light();
    } else {
      newTheme = FoodAppTheme.dark();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: newTheme,
      title: 'FoodApp',
      home: const Home(),
      actions: <Type, Action<Intent>>{
        DarkModeIntent: DarkModeAction(darkMode: darkMode)
      },
    );
  }
}

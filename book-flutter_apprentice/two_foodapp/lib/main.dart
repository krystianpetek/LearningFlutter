import 'package:flutter/material.dart';
import 'package:two_foodapp/foodapp_theme.dart';

void main() {
  runApp(const FoodApp());
}

class FoodApp extends StatefulWidget {
  const FoodApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FoodAppState();
  }
}

class _FoodAppState extends State<FoodApp> {
  ThemeData newTheme = FoodAppTheme.light();
  String mode = 'Current state: LightMode';

  darkMode() {
    if (newTheme.brightness.name == Brightness.dark.name) {
      newTheme = FoodAppTheme.light();
      mode = 'Current state: LightMode';
    } else {
      newTheme = FoodAppTheme.dark();
      mode = 'Current state: DarkMode';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // home widget
    return MaterialApp(
      theme: newTheme,
      title: 'FoodApp',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'FoodApp',
            style: newTheme.textTheme.headlineSmall,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Let\'s get cooking!',
                style: newTheme.textTheme.headlineLarge,
              ),
              ElevatedButton(
                onPressed: () {
                  darkMode();
                },
                style: newTheme.elevatedButtonTheme.style,
                child: const Text('click'),
              ),
              Text(
                mode,
                style: newTheme.textTheme.headlineSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

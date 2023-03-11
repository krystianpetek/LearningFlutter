import 'package:flutter/material.dart';
import 'package:two_foodapp/foodapp_theme.dart';

class Home extends StatefulWidget {
  final Function darkModeFn;

  const Home({
    super.key,
    required this.darkModeFn,
  });

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
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
    return Scaffold(
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
                widget.darkModeFn();
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
    );
  }
}

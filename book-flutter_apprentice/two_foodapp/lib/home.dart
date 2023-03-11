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
  String mode = 'Current state: LightMode';

  darkMode() {
    if (Theme.of(context).brightness.name == Brightness.dark.name) {
      mode = 'Current state: LightMode';
    } else {
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
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Let\'s get cooking!',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            ElevatedButton(
              onPressed: () {
                darkMode();
                widget.darkModeFn();
              },
              style: Theme.of(context).elevatedButtonTheme.style,
              child: const Text('click'),
            ),
            Text(
              mode,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}

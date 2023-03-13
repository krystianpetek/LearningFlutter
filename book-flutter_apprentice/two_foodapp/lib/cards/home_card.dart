import 'package:flutter/material.dart';
import 'package:two_foodapp/actions/dark_mode.dart';

class HomeCard extends StatefulWidget {
  const HomeCard({super.key, required this.changeCards});

  final Function changeCards;

  @override
  HomeCardState createState() => HomeCardState();
}

class HomeCardState extends State<HomeCard> {
  String _mode = 'Current state: LightMode';

  darkMode() {
    if (Theme.of(context).brightness.name == Brightness.dark.name) {
      _mode = 'Current state: LightMode';
    } else {
      _mode = 'Current state: DarkMode';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Actions(
      actions: <Type, Action<Intent>>{
        DarkModeIntent: DarkModeAction(darkMode: () {})
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Let\'s change the settings!',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            ElevatedButton(
              onPressed: () {
                darkMode();
                Actions.invoke(context, DarkModeIntent(darkMode: () {}));
              },
              style: Theme.of(context).elevatedButtonTheme.style,
              child: const Text('click'),
            ),
            ElevatedButton(
              onPressed: () {
                widget.changeCards();
                Actions.invoke(context, DarkModeIntent(darkMode: () {}));
              },
              style: Theme.of(context).elevatedButtonTheme.style,
              child: const Text('change cards'),
            ),
            Text(
              _mode,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}

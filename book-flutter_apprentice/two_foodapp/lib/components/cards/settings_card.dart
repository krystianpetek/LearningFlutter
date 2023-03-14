import 'package:flutter/material.dart';
import 'package:two_foodapp/actions/dark_mode.dart';

class SettingsCard extends StatefulWidget {
  const SettingsCard({super.key, required this.changeCards});

  final Function changeCards;

  @override
  SettingsCardState createState() => SettingsCardState();
}

class SettingsCardState extends State<SettingsCard> {
  String stateMode = 'LightMode';
  String cardMode = 'Developer';

  changeStateMode() {
    if (Theme.of(context).brightness.name == Brightness.dark.name) {
      stateMode = 'LightMode';
    } else {
      stateMode = 'DarkMode';
    }
    setState(() {});
  }

  changeCardMode() {
    if (cardMode == "Developer") {
      cardMode = 'Cooking';
    } else {
      cardMode = 'Developer';
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Let\'s change the settings!',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                changeStateMode();
                Actions.invoke(context, DarkModeIntent(darkMode: () {}));
              },
              style: Theme.of(context).elevatedButtonTheme.style,
              child: const Text('Change mode'),
            ),
            const SizedBox(height: 16),
            Text(
              'Current state: $stateMode',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                widget.changeCards();
                changeCardMode();
              },
              style: Theme.of(context).elevatedButtonTheme.style,
              child: const Text('Change cards'),
            ),
            const SizedBox(height: 16),
            Text(
              'Current cards: $cardMode',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}

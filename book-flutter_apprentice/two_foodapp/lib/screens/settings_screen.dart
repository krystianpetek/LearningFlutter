import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, required this.changeCards});

  final Function changeCards;

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  String cardMode = 'Developer';

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
    // return Actions(
    //   actions: <Type, Action<Intent>>{
    //     DarkModeIntent: DarkModeAction(darkMode: () {})
    //   },
    //   child:
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Change the settings!',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
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
    );
  }
}

// Actions.invoke(context, DarkModeIntent(darkMode: () {}));
// invoke action in event

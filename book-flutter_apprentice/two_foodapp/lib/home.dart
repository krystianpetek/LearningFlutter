import 'package:flutter/material.dart';
import 'package:two_foodapp/cards/card1.dart';
import 'package:two_foodapp/cards/home_card.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedCardIndex = 0;

  static List<Widget> pages = <Widget>[
    const Card1(),
    const HomeCard(),
    Container(color: Colors.blue),
  ];

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedCardIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'FoodApp',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: pages[_selectedCardIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Card 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Card 3',
          ),
        ],
        onTap: _onNavBarTapped,
        currentIndex: _selectedCardIndex,
      ),
    );
  }
}

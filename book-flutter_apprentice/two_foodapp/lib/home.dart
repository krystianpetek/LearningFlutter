import 'package:flutter/material.dart';
import 'package:two_foodapp/cards/card1.dart';
import 'package:two_foodapp/cards/card2.dart';
import 'package:two_foodapp/cards/card3.dart';
import 'package:two_foodapp/cards/home_card.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedCardIndex = 1;

  static List<Widget> pages = <Widget>[
    const Card3(),
    const Card2(),
    const Card1(),
    const HomeCard(),
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
          'DemoApp / FoodApp / CodeApp',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: pages[_selectedCardIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Card 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up_outlined),
            label: 'Card 3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: _onNavBarTapped,
        currentIndex: _selectedCardIndex,
      ),
    );
  }
}

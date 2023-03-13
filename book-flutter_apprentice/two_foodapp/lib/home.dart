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

  static List<Widget> pages1 = <Widget>[
    const Card3(),
    const Card2(),
    const Card1(),
    const HomeCard(changeCards: changeCards),
  ];

  static List<BottomNavigationBarItem> bottomNavItems1 =
      <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(Icons.dashboard),
      label: 'Card 1',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'About',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.trending_up_outlined),
      label: 'Card 3',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  static List<Widget> pages2 = <Widget>[
    const Card1(),
    const Card1(),
    const Card1(),
    const HomeCard(changeCards: changeCards),
  ];

  static List<BottomNavigationBarItem> bottomNavItems2 =
      <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(Icons.explore),
      label: 'Explore',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.book),
      label: 'Recipes',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.list),
      label: 'To buy',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  void _onNavBarTapped(int index) {
    _selectedCardIndex = index;

    setState(() {});
  }

  @override
  void initState() {
    widgetPages = pages1;
    widgetNavBarItems = bottomNavItems1;
    super.initState();
  }

  static void changeCards() {
    if (widgetPages == pages1) {
      widgetPages = pages2;
      widgetNavBarItems = bottomNavItems2;
    } else {
      widgetPages = pages1;
      widgetNavBarItems = bottomNavItems1;
    }
  }

  static List<Widget> widgetPages = [];
  static List<BottomNavigationBarItem> widgetNavBarItems = [];

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
      body: widgetPages[_selectedCardIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: widgetNavBarItems,
        onTap: _onNavBarTapped,
        currentIndex: _selectedCardIndex,
      ),
      // ),
    );
  }
}

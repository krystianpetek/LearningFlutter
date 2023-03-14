import 'package:flutter/material.dart';
import 'package:two_foodapp/components/components.dart';
import 'package:two_foodapp/screens/explore_screen.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedCardIndex = 1;

  List<Widget>? pages1;
  List<Widget>? pages2;
  List<BottomNavigationBarItem>? bottomNavItems1;
  List<BottomNavigationBarItem>? bottomNavItems2;

  @override
  void initState() {
    pages1 = <Widget>[
      const Card3(),
      const Card2(),
      const Card1(),
      HomeCard(changeCards: changeCards),
    ];

    bottomNavItems1 = <BottomNavigationBarItem>[
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

    pages2 = <Widget>[
      ExploreScreen(),
      const Card1(),
      const Card1(),
      HomeCard(changeCards: changeCards),
    ];

    bottomNavItems2 = <BottomNavigationBarItem>[
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

    widgetPages = pages1!;
    widgetNavBarItems = bottomNavItems1!;

    super.initState();
  }

  void changeCards() {
    if (widgetPages == pages1) {
      widgetPages = pages2;
      widgetNavBarItems = bottomNavItems2;
    } else {
      widgetPages = pages1;
      widgetNavBarItems = bottomNavItems1;
    }
    setState(() {});
  }

  List<Widget>? widgetPages = [];
  List<BottomNavigationBarItem>? widgetNavBarItems = [];

  @override
  Widget build(BuildContext context) {
    void onNavBarTapped(int index) {
      _selectedCardIndex = index;
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'DemoApp / FoodApp / CodeApp',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: widgetPages![_selectedCardIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: widgetNavBarItems!,
        onTap: onNavBarTapped,
        currentIndex: _selectedCardIndex,
      ),
    );
  }
}

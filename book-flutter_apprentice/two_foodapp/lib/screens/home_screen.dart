import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_foodapp/components/components.dart';
import 'package:two_foodapp/screens/screens.dart';

import '../models/models.dart';

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
      const Card1(),
      const Card2(),
      const Card3(),
      SettingsCard(changeCards: changeCards),
    ];

    bottomNavItems1 = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(Icons.dashboard),
        label: 'Coding',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'About',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.trending_up_outlined),
        label: 'Trends',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings',
      ),
    ];

    pages2 = <Widget>[
      const ExploreScreen(),
      RecipesScreen(),
      const GroceryScreen(),
      SettingsCard(changeCards: changeCards),
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

    _selectedCardIndex = widgetPages!.length - 1;
    setState(() {});
  }

  List<Widget>? widgetPages = [];
  List<BottomNavigationBarItem>? widgetNavBarItems = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateManager>(
      builder: (context, tabManager, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'DemoApp',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          body: IndexedStack(
            index: tabManager.getSelectedTab,
            children: widgetPages!,
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor:
                Theme.of(context).textSelectionTheme.selectionColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            items: widgetNavBarItems!,
            onTap: (index) {
              // _selectedCardIndex = index;
              tabManager.goToTab(index);
            },
            currentIndex: tabManager.getSelectedTab,
          ),
        );
      },
    );
  }
}

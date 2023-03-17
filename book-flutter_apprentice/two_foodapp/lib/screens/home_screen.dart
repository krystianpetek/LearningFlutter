import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:two_foodapp/components/components.dart';
import 'package:two_foodapp/screens/screens.dart';

import '../models/models.dart';

class Home extends StatefulWidget {
  Home({super.key, required this.currentTab});

  late int currentTab;

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
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
      SettingsScreen(changeCards: changeCards),
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
      SettingsScreen(changeCards: changeCards),
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

    widget.currentTab = widgetPages!.length - 1;
    setState(() {});
  }

  List<Widget>? widgetPages = [];
  List<BottomNavigationBarItem>? widgetNavBarItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'DemoApp',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: IndexedStack(
        index: widget.currentTab,
        children: widgetPages!,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: widgetNavBarItems!,
        currentIndex: widget.currentTab,
        onTap: (index) {
          // Provider.of<AppStateManager>(context, listen: false).goToTab(index);
          context.goNamed('home', params: {'tab': '$index'});
        },
      ),
    );
  }
}

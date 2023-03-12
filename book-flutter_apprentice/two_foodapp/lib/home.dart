import 'package:flutter/material.dart';
import 'package:two_foodapp/home_page.dart';

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
    const HomePage(),
    Container(color: Colors.red),
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
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Card 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Card 3',
          ),
        ],
        onTap: _onNavBarTapped,
        currentIndex: _selectedCardIndex,
      ),
    );
  }
}

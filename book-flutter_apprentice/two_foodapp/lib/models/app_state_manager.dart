import 'package:flutter/material.dart';

class FoodAppTab {
  static const int settings = 3;

  static const int trends = 2;
  static const int author = 1;
  static const int introduction = 0;
  // static const int

  static const int toBuy = 2;
  static const int explore = 0;
  static const int recipes = 1;
}

class AppStateManager extends ChangeNotifier {
  int selectedTab = 1;

  void goToTab(index) {
    selectedTab = index;
    notifyListeners();
  }

  void goToRecipes() {
    selectedTab = 1;
    notifyListeners();
  }
}

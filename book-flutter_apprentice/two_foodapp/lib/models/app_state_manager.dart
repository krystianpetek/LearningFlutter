import 'package:flutter/material.dart';

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
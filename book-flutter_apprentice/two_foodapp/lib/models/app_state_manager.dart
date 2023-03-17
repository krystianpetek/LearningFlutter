import 'package:flutter/material.dart';
import 'package:two_foodapp/models/models.dart';

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
  bool _loggedIn = false;
  bool _onboardingComplete = false;
  int _selectedTab = FoodAppTab.author;
  final AppCache _appCache = AppCache();

  bool get isLoggedIn => _loggedIn;
  bool get isOnboardingComplete => _onboardingComplete;
  int get getSelectedTab => _selectedTab;

  Future<void> initializeApp() async {
    _loggedIn = await _appCache.isUserLoggedIn();
    _onboardingComplete = await _appCache.didCompleteOnboarding();
  }

  Future<void> login(String username, String password) async {
    _loggedIn = true;
    await _appCache.cacheUser();
    notifyListeners();
  }

  void onboarded() async {
    _onboardingComplete = true;
    await _appCache.completeOnboarding();
    notifyListeners();
  }

  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

  void goToRecipes() {
    _selectedTab = FoodAppTab.recipes;
    notifyListeners();
  }

  Future<void> logout() async {
    _loggedIn = false;
    _onboardingComplete = false;
    _selectedTab = 1;

    await _appCache.invalidate();
    await initializeApp();
    notifyListeners();
  }
}

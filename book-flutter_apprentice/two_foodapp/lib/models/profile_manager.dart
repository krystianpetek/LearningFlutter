import 'package:flutter/material.dart';
import 'package:two_foodapp/models/models.dart';

class ProfileManager extends ChangeNotifier {
  UserModel get getUser => UserModel(
        firstName: 'Krystian',
        lastName: 'Petek',
        role: 'Flutterista',
        profileImageUrl: 'assets/images/author.png',
        points: 100,
        darkMode: _darkMode,
      );

  bool _darkMode = false;
  bool _didSelectUser = false;
  bool _tapOnLink = false;

  bool get didSelectUser => _didSelectUser;
  bool get didTapOnLink => _tapOnLink;
  bool get darkMode => _darkMode;

  set darkMode(bool darkMode) {
    _darkMode = darkMode;
    notifyListeners();
  }

  void tapOnLink(bool selected) {
    _tapOnLink = selected;
    notifyListeners();
  }

  void tapOnProfile(bool selected) {
    _didSelectUser = selected;
    notifyListeners();
  }
}

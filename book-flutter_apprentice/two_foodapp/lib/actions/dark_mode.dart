import 'package:flutter/material.dart';

class DarkModeAction extends Action<DarkModeIntent> {
  DarkModeAction({required this.darkMode});
  final Function darkMode;

  @override
  Object? invoke(DarkModeIntent intent) {
    darkMode();
  }
}

class DarkModeIntent extends Intent {
  const DarkModeIntent({required this.darkMode});

  final Function darkMode;
}

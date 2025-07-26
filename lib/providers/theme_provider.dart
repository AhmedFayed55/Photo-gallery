import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;

  void changeThemeMode(ThemeMode newThemeMode) {
    if (newThemeMode == currentTheme) {
      return;
    }
    currentTheme = newThemeMode;
    notifyListeners();
  }
}

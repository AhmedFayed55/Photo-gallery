import 'package:flutter/material.dart';
import 'package:photo_gallery/core/helpers/shared_pref_helper.dart';
import 'package:photo_gallery/core/utils/app_constants.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = SharedPrefHelper.getThemeMode(
    AppConstants.themeKey,
  );

  void changeThemeMode(ThemeMode newThemeMode) {
    if (newThemeMode == currentTheme) {
      return;
    }

    currentTheme = newThemeMode;
    SharedPrefHelper.saveData(
      key: AppConstants.themeKey,
      value: newThemeMode,
    );
    notifyListeners();
  }
}

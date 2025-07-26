import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.whiteColor),
    colorScheme: const ColorScheme.light(
      primary: AppColors.whiteColor,
      onPrimary: AppColors.blackColor,
      secondary: AppColors.blueBlackColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.blackColor),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.blackColor,
      onPrimary: AppColors.whiteColor,
      secondary: AppColors.blueBlackColor,
    ),
  );
}

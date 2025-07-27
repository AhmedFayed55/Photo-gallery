import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blueBlackColor,
        textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.whiteColor,
        ),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.blackColor,
    ),
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.whiteColor),
    colorScheme: const ColorScheme.light(
      primary: AppColors.whiteColor,
      onPrimary: AppColors.blackColor,
      secondary: AppColors.blueBlackColor,
    ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: AppColors.blackColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      )
  );

  static ThemeData darkTheme = ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.whiteColor,
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
        ),
      ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.whiteColor,
    ),
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.blackColor),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.blackColor,
      onPrimary: AppColors.whiteColor,
      secondary: AppColors.blueBlackColor,
    ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      )
  );
}

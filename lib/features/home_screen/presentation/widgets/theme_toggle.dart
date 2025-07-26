import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_gallery/config/theme/colors.dart';
import 'package:provider/provider.dart';

import '../../../../providers/theme_provider.dart';

class ThemeToggle extends StatefulWidget {
  const ThemeToggle({super.key});

  @override
  State<ThemeToggle> createState() => _ThemeToggleState();
}

class _ThemeToggleState extends State<ThemeToggle> {
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isLight = themeProvider.currentTheme == ThemeMode.light;

    return AnimatedToggleSwitch<int>.rolling(
      current: isLight ? 0 : 1,
      values: const [0, 1],
      onChanged: (newValue) {
        themeProvider.changeThemeMode(
          newValue == 0 ? ThemeMode.light : ThemeMode.dark,
        );
      },
      iconOpacity: 1,
      style: ToggleStyle(
        backgroundColor: AppColors.transparentColor,
        borderColor: isLight
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.onPrimary,
        indicatorColor: isLight
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.onPrimary,
      ),
      iconList: [
        Icon(Icons.sunny, color: AppColors.whiteColor, size: 25.sp),
        Icon(
          Icons.mode_night_rounded,
          color: !isLight ? AppColors.blackColor : AppColors.blueBlackColor,
          size: 25.sp,
        ),
      ],
    );
  }
}

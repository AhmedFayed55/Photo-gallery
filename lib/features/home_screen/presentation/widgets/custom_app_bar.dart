import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_gallery/features/home_screen/presentation/widgets/theme_toggle.dart';

import '../../../../core/utils/app_constants.dart';
import 'internet_indecator.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          Theme.of(context).brightness == Brightness.light
              ? AppConstants.routeSvg
              : AppConstants.routeWhite,
        ),
        const InternetIndicator(),
        const ThemeToggle(),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_gallery/core/utils/app_constants.dart';
import 'package:photo_gallery/features/home_screen/presentation/manager/home_cubit.dart';
import 'package:photo_gallery/features/home_screen/presentation/manager/home_state.dart';
import 'package:photo_gallery/features/home_screen/presentation/widgets/error_state_widget.dart';
import 'package:photo_gallery/features/home_screen/presentation/widgets/photos_grid_view.dart';
import 'package:photo_gallery/features/home_screen/presentation/widgets/theme_toggle.dart';

import '../../../../core/di/di.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt<HomeCubit>()
        ..getPhotos(),
      child: Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(
            Theme.of(context).brightness == Brightness.light
                ? AppConstants.routeSvg
                : AppConstants.routeWhite,
          ),
          actions: [
            const ThemeToggle(),
            SizedBox(width: 10.w),
          ]),,
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeSuccessState) {
              return PhotosGridView(photos: state.photos);
            } else if (state is HomeErrorState) {
              return ErrorStateWidget(errorMsg: state.errorMessage);
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}






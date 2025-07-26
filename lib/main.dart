import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_gallery/config/theme/theme.dart';
import 'package:photo_gallery/features/home_screen/presentation/pages/home_screen.dart';
import 'package:photo_gallery/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import 'core/di/di.dart';
import 'core/helpers/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const PhotoGalleryApp()));
}

class PhotoGalleryApp extends StatelessWidget {
  const PhotoGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.currentTheme,
          home: const HomeScreen(),
        )
    );
  }
}


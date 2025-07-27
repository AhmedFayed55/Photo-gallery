import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_gallery/config/theme/theme.dart';
import 'package:photo_gallery/core/helpers/shared_pref_helper.dart';
import 'package:photo_gallery/features/home_screen/presentation/pages/home_screen.dart';
import 'package:photo_gallery/providers/connectivity_provider.dart';
import 'package:photo_gallery/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import 'core/di/di.dart';
import 'core/helpers/bloc_observer.dart';
import 'features/home_screen/data/models/hive_models/get_photos_hive_dto.dart';
import 'features/home_screen/data/models/hive_models/photos_hive_dto.dart';
import 'features/home_screen/data/models/hive_models/src_hive_dto.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await SharedPrefHelper.init();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(GetPhotosHiveDtoAdapter());
  Hive.registerAdapter(PhotosHiveDtoAdapter());
  Hive.registerAdapter(SrcHiveDtoAdapter());
  runApp(MultiBlocProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => ConnectivityProvider()),
      ],
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


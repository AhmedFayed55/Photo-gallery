import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_gallery/core/di/di.dart';
import 'package:photo_gallery/features/home_screen/presentation/manager/home_cubit.dart';
import 'package:photo_gallery/features/home_screen/presentation/manager/home_state.dart';

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
          title: const Text('Photo Gallery'),
        ),
        body: Center(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeSuccessState) {
                return Text(
                  'Welcome to the Photo Gallery!',
                );
              }
              if (state is HomeErrorState) {
                return Center(
                  child: Text(state.errorMessage),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}

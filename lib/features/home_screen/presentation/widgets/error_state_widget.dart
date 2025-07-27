import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_constants.dart';
import '../manager/home_cubit.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({super.key, required this.errorMsg});

  final String errorMsg;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.error, size: 50, color: Colors.red),
        const SizedBox(height: 16),
        Text(
          errorMsg,
          textAlign: TextAlign.center,
            style: Theme
                .of(context)
                .textTheme
                .bodyLarge
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            context.read<HomeCubit>().getPhotos();
          },
          child: const Text(AppConstants.retry),
        ),
      ],
    );
  }
}

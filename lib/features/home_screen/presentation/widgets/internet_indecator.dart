import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../providers/connectivity_provider.dart';

class InternetIndicator extends StatelessWidget {
  const InternetIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final isOnline = context.watch<ConnectivityProvider>().isOnline;

    return Tooltip(
      message: isOnline ? 'Connected' : 'No Internet',
      child: Icon(
        size: 30.sp,
        isOnline ? Icons.wifi : Icons.wifi_off,
        color: isOnline ? Colors.green : Colors.red,
      ),
    );
  }
}

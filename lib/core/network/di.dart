import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../di/di.dart';
import 'api_constants.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio provideDio() {
    Dio dio = Dio();
    dio.options.baseUrl = ApiConstants.baseUrl;
    dio.interceptors.add(getIt.get<PrettyDioLogger>());
    return dio;
  }

  @lazySingleton
  PrettyDioLogger providePrettyDioLogger() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
    );
  }
}

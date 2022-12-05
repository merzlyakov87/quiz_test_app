import 'package:dio/dio.dart';
import 'package:quiz_test/src/core/api/interceptor/api_interceptor.dart';

class Api {
  static const baseUrl = 'https://quizapi.io';

  late Dio dio;

  static const _receiveTimeout = 3000;
  static const _connectTimeout = 3000;
  static const _sendTimeout = 3000;

  Dio createDio(ApiInterceptor apiInterceptors, {required bool loggerMode}) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveTimeout: _receiveTimeout,
        connectTimeout: _connectTimeout,
        sendTimeout: _sendTimeout,
        responseType: ResponseType.json,
      ),
    );
    dio.interceptors.add(apiInterceptors);

    return dio;
  }
}

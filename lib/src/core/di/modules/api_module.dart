import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:quiz_test/src/core/api/api.dart';
import 'package:quiz_test/src/core/api/interceptor/api_interceptor.dart';

@module
abstract class ApiModule {
  @singleton
  Dio get dio => Api().createDio(ApiInterceptor(), loggerMode: true);
}

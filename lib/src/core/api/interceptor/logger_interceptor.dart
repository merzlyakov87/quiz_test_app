import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:quiz_test/src/core/api/error/error_handler.dart';

class LoggerInterceptors extends Interceptor {
  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    GetIt.I<Logger>().e(
      'ERROR: [${err.requestOptions.method}]'
      ' => PATH ${err.requestOptions.uri} \n'
      'STATUS: [${err.response?.statusCode}]\n'
      'MESSAGE: ${await ErrorHandler.call(err.type)} \n'
      'ErrorType:  ${err.type}',
    );
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    GetIt.I<Logger>().i(
      'REQUEST [${options.method}] '
      '=> PATH: ${options.uri} \n'
      'HEADERS: ${options.headers} \n'
      'PARAMETERS: ${options.queryParameters} \n'
      'BODY : ${options.data}',
    );
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    GetIt.I<Logger>().i(
      'RESPONSE [${response.statusCode}}] '
      '=> PATH: ${response.requestOptions.path}',
    );
    return super.onResponse(response, handler);
  }
}

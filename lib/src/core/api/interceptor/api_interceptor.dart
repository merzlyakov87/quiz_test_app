import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  ApiInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) =>
      requestInterceptor(options, handler);

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    return super.onResponse(response, handler);
  }

  dynamic requestInterceptor(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers.addAll(<String, dynamic>{'X-Api-Key': 'api_key'});

    return handler.next(options);
  }
}

import 'package:dio/dio.dart';
import 'package:quiz_test/src/core/api/error/dio_error_type_ext.dart';

class ErrorHandler {
  static Future<String> call(Object? exception) async {
    if (exception is DioError) {
      return exception.type.getError(exception);
    } else if (exception is DioErrorType) {
      return exception.getResponseTypeError();
    } else {
      return exception.toString();
    }
  }
}

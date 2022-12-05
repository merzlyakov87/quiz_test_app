import 'dart:io';

import 'package:dio/dio.dart';

extension DioErrorTypeExt on DioErrorType {
  String getError(DioError dioError) {
    switch (this) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return 'The connection has timed out, please try again.';
      case DioErrorType.response:
        switch (dioError.response?.statusCode) {
          case HttpStatus.badRequest:
            return 'Invalid request';
          case HttpStatus.unauthorized:
            return 'Access denied';
          case HttpStatus.notFound:
            return 'The requested information could not be found';
          case HttpStatus.conflict:
            return 'Conflict occurred';
          default:
            return 'Unknown error occurred, please try again later.';
        }
      case DioErrorType.cancel:
        return 'request is cancelled';
      case DioErrorType.other:
        return 'No internet connection detected, please try again.';
    }
  }

  String getResponseTypeError() {
    switch (this) {
      case DioErrorType.response:
        return 'When the server response,'
            ' but with a incorrect status, such as 404, 503...';
      case DioErrorType.connectTimeout:
        return 'It occurs when url is opened timeout.';
      case DioErrorType.sendTimeout:
        return 'It occurs when url is sent timeout.';
      case DioErrorType.receiveTimeout:
        return 'It occurs when receiving timeout.';
      case DioErrorType.cancel:
        return 'When the request is cancelled, '
            'dio will throw a error with this type.';
      case DioErrorType.other:
        return ' Default error type, Some other Error. '
            'In this case, you can use the DioError.error if it is not null.';
    }
  }
}

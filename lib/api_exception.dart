
import 'package:dio/dio.dart';

class DioExceptions {

  static String getDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionError :
        return 'Internal server error.';
      case DioExceptionType.badResponse:
        return _handleStatusCode(dioError.response!.statusCode);
      case DioExceptionType.unknown:
        return 'No Internet.';
      default:
        return 'something went wrong';
    }
  }

  static String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request.';
      case 401:
        return 'Authentication failed.';
      case 403:
        return 'The authenticated user is not allowed to access the specified API endpoint.';
      case 404:
        return 'The requested resource does not exist.';
      case 405:
        return 'Method not allowed. Please check the Allow header for the allowed HTTP methods.';
      case 422:
        return 'Data validation failed.';
      case 429:
        return 'Too many requests.';
      case 500:
        return 'Internal server error.';
      default:
        return 'Oops something went wrong!';
    }
  }


}
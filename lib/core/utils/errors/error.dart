import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  const Failure(this.errorMessage);
}

class RegularFailure extends Failure {
  RegularFailure(super.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        return ServerFailure('Connection Timeout ,Please Try Again');
      case DioErrorType.sendTimeout:
        return ServerFailure('Send Timeout ,Please Try Again');

      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive Timeout ,Please Try Again');

      case DioErrorType.response:
        return ServerFailure.fromResponse(dioError.response!.statusCode!, dioError.response);
      case DioErrorType.cancel:
        return ServerFailure('Request Was Canceled , Please Try Again');
      case DioErrorType.other:
        return ServerFailure('Something Went Wrong , Please Try Again');
      default:
        return ServerFailure('Something Went Wrong , Please Try Again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Request Not Found!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error, Please Try Again');
    } else {
      return ServerFailure('Unknown Error , Please Try Again Or Contact Us');
    }
  }
}

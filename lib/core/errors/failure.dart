import 'package:dio/dio.dart';

abstract class Failure {
  final String error;

  Failure({required this.error});
}

class ServerFailure extends Failure {
  ServerFailure({required super.error});

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      
      case DioExceptionType.connectionTimeout:
      return ServerFailure(error: 'Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
      return ServerFailure(error: 'Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
      return ServerFailure(error: 'Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
      return ServerFailure(error: 'Bad certificate with ApiServer');
      case DioExceptionType.badResponse:
      return ServerFailure.fromResponse(dioError.response!.statusCode!, dioError.response!.data!);
      case DioExceptionType.cancel:
      return ServerFailure(error: 'Something went wrong with ApiServer');
      case DioExceptionType.connectionError:
      return ServerFailure(error: 'Connection Error with ApiServer');
      case DioExceptionType.unknown:
      return ServerFailure(error: 'Unxcepted Error, Please try again');
    }
  }
  factory ServerFailure.fromResponse(int code, dynamic response) {
    switch (code) {
      case 400:
      case 401:
      case 403:
        return ServerFailure(error: response['error']['message']);
      case 404:
      return ServerFailure(error: 'Your request not found');
      case 500:
      case 502:
      case 503:
        return ServerFailure(error: 'Internal server error, Please try again');
      default:
        return ServerFailure(error: 'OOPs Something went wrong, Please try again');
    }
  }
}

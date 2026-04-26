import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return const ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return const ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return const ServerFailure('Bad certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return const ServerFailure('Request to ApiServer was canceled');
      case DioExceptionType.connectionError:
        return const ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return const ServerFailure('No Internet Connection');
        }
        return const ServerFailure('Unexpected Error, Please try again!');
      default:
        return const ServerFailure('Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return const ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return const ServerFailure('Internal Server error, Please try later');
    } else {
      return const ServerFailure('Opps There was an Error, Please try again');
    }
  }
}

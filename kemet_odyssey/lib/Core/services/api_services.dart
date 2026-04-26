import 'package:dio/dio.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class ApiServices {
  final Dio _dio;

  ApiServices(this._dio);

  Future<Either<Failure, Map<String, dynamic>>> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    try {
      final response = await _dio.get(
        endPoint,
        queryParameters: queryParameters,
        options: Options(
          headers: token != null ? {'Authorization': 'Bearer $token'} : null,
        ),
      );
      return Right(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

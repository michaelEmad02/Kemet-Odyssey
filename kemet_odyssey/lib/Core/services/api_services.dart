import 'package:dio/dio.dart';
import 'package:kemet_odyssey/core/services/i_services.dart';

class ApiServices implements IServices {
  final Dio _dio;

  ApiServices(this._dio);

  @override
  Future<List<dynamic>> get({required String endPoint}) async {
    final response = await _dio.get(endPoint);
    return response.data as List<dynamic>;
  }

  @override
  Future<Map<String, dynamic>> getPlace({required int placeId}) {
    // TODO: implement getPlace
    throw UnimplementedError();
  }
}

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';
import 'package:kemet_odyssey/core/services/i_services.dart';
import 'package:kemet_odyssey/features/destinations/data/models/city_model.dart';

abstract class DestinationRemoteDataSources {
  Future<Either<Failure, List<CityModel>>> fetchCities();
  // Future<List<PlaceModel>> fetchPlaces({required String cityName});
}

class DestinationRemoteDataSourcesImplement
    extends DestinationRemoteDataSources {
  final IServices iServices;
  DestinationRemoteDataSourcesImplement({required this.iServices});

  @override
  Future<Either<Failure, List<CityModel>>> fetchCities() async {
    try {
      final result = await iServices.get(endPoint: "cities");
      return Right(result
          .map((city) => CityModel.fromJsonData(city as Map<String, dynamic>))
          .toList());
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  // @override
  // Future<List<PlaceModel>> fetchPlaces({required String cityName}) async {
  //   var data = await apiServices.get(endPoint: "");
  //   var jsonData = data["cities"]["places"];
  //   var jsonPlaces = (jsonData as List<dynamic>);
  //   return jsonPlaces
  //       .map((place) => PlaceModel.fromJsonData(place as Map<String, dynamic>))
  //       .toList();
  // }
}

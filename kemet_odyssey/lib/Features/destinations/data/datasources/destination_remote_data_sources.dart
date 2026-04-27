import 'package:dartz/dartz.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';
import 'package:kemet_odyssey/core/services/api_services.dart';
import 'package:kemet_odyssey/features/destinations/data/models/city_model.dart';

abstract class DestinationRemoteDataSources {
  Future<Either<Failure, List<CityModel>>> fetchCities();
  // Future<List<PlaceModel>> fetchPlaces({required String cityName});
}

class DestinationRemoteDataSourcesImplement
    extends DestinationRemoteDataSources {
  final ApiServices apiServices;
  DestinationRemoteDataSourcesImplement({required this.apiServices});
  
  @override
  Future<Either<Failure, List<CityModel>>> fetchCities() async {
    final result = await apiServices.get(endPoint: "cities"); // Replace with actual endpoint
    
    return result.fold(
      (failure) => Left(failure),
      (data) {
        var jsonData = data["cities"] ?? [];
        var jsonCities = jsonData as List<dynamic>;
        return Right(jsonCities
            .map((city) => CityModel.fromJsonData(city as Map<String, dynamic>))
            .toList());
      },
    );
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


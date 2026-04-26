import 'package:kemet_odyssey/core/services/api_services.dart';

abstract class DestinationRemoteDataSources {
  // Future<List<CityModel>> fetchCities();
  // Future<List<PlaceModel>> fetchPlaces({required String cityName});
}

class DestinationRemoteDataSourcesImplement
    extends DestinationRemoteDataSources {
  final ApiServices apiServices;
  DestinationRemoteDataSourcesImplement({required this.apiServices});
  // @override
  // Future<List<CityModel>> fetchCities() async {
  //   var data = await apiServices.get(endPoint: "");
  //   var jsonData = data["cities"] ?? [];
  //   var jsonCities = jsonData as List<dynamic>;
  //   return jsonCities
  //       .map((city) => CityModel.fromJsonData(city as Map<String, dynamic>))
  //       .toList();
  // }

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

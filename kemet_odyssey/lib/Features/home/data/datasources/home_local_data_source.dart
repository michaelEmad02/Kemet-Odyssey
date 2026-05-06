import 'package:kemet_odyssey/core/services/i_services.dart';
import 'package:kemet_odyssey/features/destinations/data/models/city_model.dart';
import 'package:kemet_odyssey/features/destinations/data/models/place_model.dart';

abstract class HomeLocalDataSource {
  Future<List<CityModel>> fetchTopCities();
  Future<List<PlaceModel>> fetchTopPlaces();
  Future<PlaceModel> fetchPlacedetails({required int placeId});
}

class HomeLocalDataSourceImplementation implements HomeLocalDataSource {
  final IServices iServices;

  HomeLocalDataSourceImplementation({required this.iServices});

  @override
  Future<PlaceModel> fetchPlacedetails({required int placeId}) async {
    final data = await iServices.getPlace(placeId: placeId);
    return PlaceModel.fromJsonData(data);
  }

  @override
  Future<List<CityModel>> fetchTopCities() async {
    final List<dynamic> citiesJson = await iServices.get(endPoint: "cities");
    return citiesJson
        .map((json) => CityModel.fromJsonData(json))
        .take(10)
        .toList();
  }

  @override
  Future<List<PlaceModel>> fetchTopPlaces() async {
    final List<dynamic> citiesJson = await iServices.get(endPoint: "cities");
    final List<dynamic> allPlacesJson = citiesJson
        .whereType<Map<String, dynamic>>()
        .expand((city) => (city['places'] as List<dynamic>? ?? const []))
        .toList();
    
    allPlacesJson.shuffle();
    
    return allPlacesJson
        .take(10)
        .map((json) => PlaceModel.fromJsonData(json))
        .toList();
  }

}

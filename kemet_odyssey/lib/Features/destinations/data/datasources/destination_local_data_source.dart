import 'package:kemet_odyssey/core/services/i_services.dart';
import 'package:kemet_odyssey/features/destinations/data/models/city_model.dart';
import 'package:kemet_odyssey/features/destinations/data/models/place_model.dart';

abstract class DestinationLocalDataSource {
  Future<List<CityModel>> fetchCities();
  Future<List<PlaceModel>> fetchPlaces({required String cityName});
    Future<PlaceModel> fetchPlacedetails({required int placeId});
}

class DestinationLocalDataSourceImplement extends DestinationLocalDataSource {
  final IServices iServices;

  DestinationLocalDataSourceImplement({required this.iServices});
  @override
  Future<List<CityModel>> fetchCities() async {
    final List<dynamic> citiesJson = await iServices.get(endPoint: "cities");
    return citiesJson.map((json) => CityModel.fromJsonData(json)).toList();
  }

  @override
  Future<List<PlaceModel>> fetchPlaces({required String cityName}) {
    // TODO: implement fetchPlaces
    throw UnimplementedError();
  }
  
  @override
  Future<PlaceModel> fetchPlacedetails({required int placeId}) async {
    final data = await iServices.getPlace(placeId: placeId);
    return PlaceModel.fromJsonData(data);
  }
}

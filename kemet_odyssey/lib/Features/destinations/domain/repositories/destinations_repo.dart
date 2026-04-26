import 'package:kemet_odyssey/features/destinations/domain/entities/city_entity.dart';
import 'package:kemet_odyssey/features/destinations/domain/entities/place_entity.dart';

abstract class DestinationsRepo {
  Future<List<CityEntity>> getCities();
  Future<List<PlaceEntity>> getPlaces({required String cityName});
}
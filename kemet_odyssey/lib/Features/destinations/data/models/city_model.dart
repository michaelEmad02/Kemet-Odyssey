import 'package:kemet_odyssey/features/destinations/data/models/location_model.dart';
import 'package:kemet_odyssey/features/destinations/data/models/place_model.dart';
import 'package:kemet_odyssey/features/destinations/domain/entities/city_entity.dart';

class CityModel extends CityEntity {
  final List<String> placesNames;

  CityModel(
      {required super.id,
      required super.name,
      required super.imageUrl,
      required super.description,
      required super.placesDescription,
      required super.categories,
      required super.location,
      required super.places,
      required this.placesNames});

      
  factory CityModel.fromJsonData(Map<String, dynamic> data) {
    return CityModel(
        id: data["id"] as int,
        name: data["name"] as String,
        location: LocationModel.fromJsonData(
            data["location"] as Map<String, dynamic>),
        imageUrl: data["img"] as String,
        description: data["description"] as String,
        categories: (data["categories"] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList() ??
            [],
        placesNames: (data["places-list"] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList() ??
            [],
        placesDescription: (data["places-description"] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList() ??
            [],
        places: (data["places"] as List<dynamic>?)
                ?.map((place) =>
                    PlaceModel.fromJsonData(place as Map<String, dynamic>))
                .toList() ??
            []);
  }
}

import 'package:kemet_odyssey/features/destinations/data/models/location_model.dart';
import 'package:kemet_odyssey/features/destinations/data/models/place_model.dart';
import 'package:kemet_odyssey/features/destinations/domain/entities/city_entity.dart';

class CityModel extends CityEntity {
  final LocationModel location;
  final String imgUrl;
  final List<String> placesNames;
  final List<String> placesDescription;

  CityModel({
    required super.name,
    required this.location,
    required this.imgUrl,
    required super.description,
    required super.categories,
    required this.placesNames,
    required this.placesDescription,
    required super.places,
  }) : super(
          imageUrl: imgUrl,
          latitude: location.latitude,
          longitude: location.longitude,
        );


  factory CityModel.fromJsonData(Map<String, dynamic> data) {
    return CityModel(
        name: data["name"] as String,
        location: LocationModel.fromJsonData(
            data["location"] as Map<String, dynamic>),
        imgUrl: data["img"] as String,
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
                ?.map((place) => PlaceModel.fromJsonData(place as Map<String, dynamic>))
                .toList() ??
            []);
  }
}

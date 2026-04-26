import 'package:kemet_odyssey/features/destinations/data/models/location_model.dart';
import 'package:kemet_odyssey/features/destinations/data/models/place_model.dart';

class CityModel {
  final String name;
  final LocationModel location;
  final String imgUrl;
  final String description;
  final List<String> categories;
  final List<String> placesNames;
  final List<String> placesDescription;
  final List<PlaceModel> places;

  CityModel(
      {required this.name,
      required this.location,
      required this.imgUrl,
      required this.description,
      required this.categories,
      required this.placesNames,
      required this.placesDescription,
      required this.places});

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

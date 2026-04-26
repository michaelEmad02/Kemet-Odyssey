import 'package:kemet_odyssey/features/home/data/models/place_model.dart';
import 'package:kemet_odyssey/features/home/domain/entities/city_entity.dart';

class CityModel extends CityEntity {
  CityModel({
    required super.name,
    required super.imageUrl,
    required super.places,
    required super.description,
    required super.categories,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      name: json['name'] as String,
      imageUrl: json['img'] as String,
      description: json['description'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
      places: (json['places'] as List<dynamic>?)
              ?.map((e) => PlaceModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'img': imageUrl,
      'description': description,
      'categories': categories,
      'places': places.map((e) => (e as PlaceModel).toJson()).toList(),
    };
  }
}

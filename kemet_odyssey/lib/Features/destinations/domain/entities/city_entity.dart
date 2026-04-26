import 'package:kemet_odyssey/features/destinations/domain/entities/place_entity.dart';

class CityEntity {
  final String name;
  final String imageUrl;
  final String description;
  final List<String> categories;
  final double latitude;
  final double longitude;
  final List<PlaceEntity> places; // بنعرض الأماكن اللي جواها

  CityEntity({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.categories,
    required this.latitude,
    required this.longitude,
    required this.places,
  });
}

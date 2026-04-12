import 'package:kemet_odyssey/features/home/domain/entities/place_entity.dart';

class CityEntity {
  final String name;
  final String imageUrl;
  final String description;
  final List<String> categories;
  final List<PlaceEntity> places; // بنعرض الأماكن اللي جواها

  CityEntity(
     {
    required this.name,
    required this.imageUrl,
    required this.places,
    required this.description,
    required this.categories,
  });
}

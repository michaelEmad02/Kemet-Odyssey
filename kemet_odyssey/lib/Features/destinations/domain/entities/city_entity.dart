import 'package:kemet_odyssey/features/destinations/data/models/location_model.dart';
import 'package:kemet_odyssey/features/destinations/domain/entities/place_entity.dart';

class CityEntity {
  final int id;
  final String name;
  final String imageUrl;
  final String description;
  final List<String> placesDescription;
  final List<String> categories;
  final LocationModel location;
  final List<PlaceEntity> places; // بنعرض الأماكن اللي جواها

  CityEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.placesDescription,
    required this.categories,
    required this.location,
    required this.places,
  });
}

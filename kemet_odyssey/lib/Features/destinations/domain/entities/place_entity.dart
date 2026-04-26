// place_entity.dart
import 'package:kemet_odyssey/features/destinations/data/models/location_model.dart';
import 'package:kemet_odyssey/features/destinations/data/models/operating_schedule.dart';

class PlaceEntity {
  final int id;
  final String name;
  final String description;
  final String category;
  final LocationModel location;
  final String mainImage;
  final List<String> gallery;
  final String model3D;
  final OperatingSchedule operatingSchedule;
  final List<String> price;

  PlaceEntity(
      {required this.id,
      required this.name,
      required this.description,
      required this.category,
      required this.location,
      required this.mainImage,
      required this.gallery,
      required this.model3D,
      required this.operatingSchedule,
      required this.price}); // السعر النهائي للعرض
}

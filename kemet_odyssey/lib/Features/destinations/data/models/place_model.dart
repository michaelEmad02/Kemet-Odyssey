import 'package:kemet_odyssey/features/destinations/data/models/location_model.dart';
import 'package:kemet_odyssey/features/destinations/data/models/operating_schedule.dart';
import 'package:kemet_odyssey/features/destinations/domain/entities/place_entity.dart';

class PlaceModel extends PlaceEntity {
  final String history;
  final String contactUs;
  PlaceModel({
    required super.id,
    required super.name,
    required super.description,
    required super.category,
    required super.location,
    required super.mainImage,
    required super.gallery,
    required super.model3D,
    required super.operatingSchedule,
    required super.price,
    required this.history,
    required this.contactUs,
  });

  factory PlaceModel.fromJsonData(Map<String, dynamic> data) => PlaceModel(
      id: data["id"] as int,
      name: data["name"] as String,
      description: data["description"] as String,
      category: data["category"] as String,
      location:
          LocationModel.fromJsonData(data["location"] as Map<String, dynamic>),
      mainImage: data["image"] as String,
      gallery: (data["collection-images"] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      model3D: data["3D-Image"] as String? ?? '',
      operatingSchedule: OperatingSchedule.fromJsonData(
        data["work-days"] as Map<String, dynamic>,
        data["work-times"] as Map<String, dynamic>,
      ),
      price: data["ticket-price"] is Map
          ? [
              (data["ticket-price"] as Map)["from"].toString(),
              (data["ticket-price"] as Map)["to"].toString()
            ]
          : [],
      history: data["history"] as String? ?? '',
      contactUs: data["contect-us"]?.toString() ?? '');
}

import 'package:kemet_odyssey/features/home/domain/entities/plan_places_entity.dart';

class PlanPlacesModel extends PlanPlacesEntity {
  const PlanPlacesModel({
    required super.placeNumber,
    required super.placeId,
    required super.startTime,
    required super.endTime,
  });

  factory PlanPlacesModel.fromMap(Map<String, dynamic> map) {
    return PlanPlacesModel(
      placeNumber: (map['placeNumber'] as num?)?.toInt() ?? 0,
      placeId: (map['placeId'] as num?)?.toInt() ?? 0,
      startTime: map['startTime'] as String? ?? '',
      endTime: map['endTime'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'placeNumber': placeNumber,
      'placeId': placeId,
      'startTime': startTime,
      'endTime': endTime,
    };
  }
}

import 'package:kemet_odyssey/features/home/data/models/plan_places_model.dart';
import 'package:kemet_odyssey/features/home/domain/entities/plan_day_entity.dart';

class PlanDayModel extends PlanDayEntity {
  const PlanDayModel({
    required super.dayName,
    required super.dayDate,
    required super.startTime,
    required super.endTime,
    required super.planPlaces,
  });

  factory PlanDayModel.fromMap(Map<String, dynamic> map) {
    final placesRaw = map['planPlaces'] as List<dynamic>? ?? [];
    return PlanDayModel(
      dayName: map['dayName'] as String? ?? '',
      dayDate: map['dayDate'] as String? ?? '',
      startTime: map['startTime'] as String? ?? '',
      endTime: map['endTime'] as String? ?? '',
      planPlaces: placesRaw
          .map((e) => PlanPlacesModel.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dayName': dayName,
      'dayDate': dayDate,
      'startTime': startTime,
      'endTime': endTime,
      'planPlaces': planPlaces
          .map((e) => (e as PlanPlacesModel).toMap())
          .toList(),
    };
  }
}

import 'package:kemet_odyssey/features/home/domain/entities/plan_places_entity.dart';

class PlanDayEntity {
  final String dayName;
  final String dayDate;
  final String startTime;
  final String endTime;
  final List<PlanPlacesEntity> planPlaces;
  const PlanDayEntity({
    required this.dayName,
    required this.dayDate,
    required this.startTime,
    required this.endTime,
    required this.planPlaces,
  });
}

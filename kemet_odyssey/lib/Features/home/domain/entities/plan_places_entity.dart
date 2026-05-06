class PlanPlacesEntity {
  final int placeNumber; // the place order in this day
  final int placeId;
  final String startTime;
  final String endTime;
  const PlanPlacesEntity({
    required this.placeNumber,
    required this.placeId,
    required this.startTime,
    required this.endTime,
  });
}
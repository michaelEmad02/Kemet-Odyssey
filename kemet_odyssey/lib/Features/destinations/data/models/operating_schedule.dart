class OperatingSchedule {
  final String fromDay;
  final String toDay;
  final String fromTime;
  final String toTime;

  OperatingSchedule(
      {required this.fromDay,
      required this.toDay,
      required this.fromTime,
      required this.toTime});

  factory OperatingSchedule.fromJsonData(
      Map<String, dynamic> daysData, Map<String, dynamic> timeData) {
    return OperatingSchedule(
      fromDay: daysData["from"],
      toDay: daysData["to"],
      fromTime: timeData["from"],
      toTime: timeData["to"],
    );
  }
}

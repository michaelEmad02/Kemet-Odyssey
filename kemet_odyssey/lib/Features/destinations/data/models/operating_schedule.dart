class OperatingSchedule {
  final List<Map<String, String>> operatingSchedule;

  OperatingSchedule({required this.operatingSchedule});

  factory OperatingSchedule.fromJsonData(
      Map<String, dynamic> daysData, Map<String, dynamic> timeData) {
    final days = OperatingDays(
      fromDay: daysData["from"],
      toDay: daysData["to"],
      fromTime: timeData["from"],
      toTime: timeData["to"],
    );

    return getOperatingSchedule(days);
  }

  static OperatingSchedule getOperatingSchedule(OperatingDays operatingDays) {
    const orderedDays = <String>[
      'monday',
      'tuesday',
      'wednesday',
      'thursday',
      'friday',
      'saturday',
      'sunday',
    ];
    const dayAbbreviations = <String>[
      'MON',
      'TUE',
      'WED',
      'THU',
      'FRI',
      'SAT',
      'SUN',
    ];

    final fromDay = operatingDays.fromDay.trim().toLowerCase();
    final toDay = operatingDays.toDay.trim().toLowerCase();
    final fromIndex = orderedDays.indexOf(fromDay);
    final toIndex = orderedDays.indexOf(toDay);

    final schedule = <Map<String, String>>[];

    for (var i = 0; i < orderedDays.length; i++) {
      final withinRange = _isDayInRange(
        dayIndex: i,
        fromIndex: fromIndex,
        toIndex: toIndex,
      );

      schedule.add({
        'day': dayAbbreviations[i],
        'open': withinRange ? operatingDays.fromTime : 'CLOSED',
        'close': withinRange ? operatingDays.toTime : 'CLOSED',
      });
    }

    return OperatingSchedule(operatingSchedule: schedule);
  }
}

bool _isDayInRange({
  required int dayIndex,
  required int fromIndex,
  required int toIndex,
}) {
  if (fromIndex < 0 || toIndex < 0) {
    return true;
  }

  if (fromIndex <= toIndex) {
    return dayIndex >= fromIndex && dayIndex <= toIndex;
  }

  return dayIndex >= fromIndex || dayIndex <= toIndex;
}

class OperatingDays {
  final String fromDay;
  final String toDay;
  final String fromTime;
  final String toTime;

  OperatingDays({
    required this.fromDay,
    required this.toDay,
    required this.fromTime,
    required this.toTime,
  });
}

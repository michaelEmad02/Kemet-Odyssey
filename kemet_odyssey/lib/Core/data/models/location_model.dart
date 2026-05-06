class LocationModel {
  final double latitude;
  final double longitude;

  LocationModel({
    required this.latitude,
    required this.longitude,
  });

  factory LocationModel.fromJsonData(Map<String, dynamic> data) {
    return LocationModel(
        latitude: data["latitude"] as double,
        longitude: data["longitude"] as double);
  }
}

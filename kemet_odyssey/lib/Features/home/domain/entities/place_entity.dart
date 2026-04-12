// place_entity.dart
class PlaceEntity {
  final int id;
  final String name;
  final String description;
  final String category;
  final String mainImage;
  final List<double> price; // السعر النهائي للعرض

  PlaceEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.mainImage,
    required this.price,
  });
}
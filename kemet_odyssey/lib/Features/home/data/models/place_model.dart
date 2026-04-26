import 'package:kemet_odyssey/features/home/domain/entities/place_entity.dart';

class PlaceModel extends PlaceEntity {
  PlaceModel({
    required super.id,
    required super.name,
    required super.description,
    required super.category,
    required super.mainImage,
    required super.price,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    List<double> parsedPrice = [];
    if (json['ticket-price'] != null && json['ticket-price'] is Map) {
      final priceMap = json['ticket-price'] as Map<String, dynamic>;
      final from = _parsePriceString(priceMap['from']);
      final to = _parsePriceString(priceMap['to']);
      parsedPrice = [from, to];
    }

    return PlaceModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      mainImage: json['image'] as String,
      price: parsedPrice,
    );
  }

  static double _parsePriceString(dynamic price) {
    if (price == null) return 0.0;
    final str = price.toString().replaceAll('EGP', '').trim();
    return double.tryParse(str) ?? 0.0;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'image': mainImage,
      'ticket-price': {
        'from': '${price.isNotEmpty ? price[0] : 0}EGP',
        'to': '${price.length > 1 ? price[1] : 0}EGP',
      },
    };
  }
}

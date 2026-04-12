
class PlanEntity {
  final String id;
  final String duration; // number of days
  final String city;
  final List<String> categories;
  final double price;
  final double averageRating;
  final int ratingCount;
  final int subscribers;
  final String imageUrl;
  final bool isPremium;


  const PlanEntity({
    this.id = '1',
    required this.duration,
    required this.city,
    required this.categories,
    this.price = 0.0,
    this.averageRating = 4.0,
    this.ratingCount = 0,
    this.subscribers = 0,
    this.imageUrl = '',
    this.isPremium = false,
  });
}

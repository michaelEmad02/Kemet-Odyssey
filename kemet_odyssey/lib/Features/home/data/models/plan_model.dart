import 'package:kemet_odyssey/features/home/data/models/plan_day_model.dart';
import 'package:kemet_odyssey/features/planning/domain/entities/plan_entity.dart';

class PlanModel extends PlanEntity {
  const PlanModel({
    required super.id,
    required super.duration,
    required super.city,
    required super.categories,
    required super.price,
    required super.averageRating,
    required super.ratingCount,
    required super.subscribers,
    required super.imageUrl,
    required super.isPremium,
    required super.planDays,
  });
 // DocumentSnapshot
  factory PlanModel.fromMap(Map<String, dynamic> data) {
    final daysRaw = data['planDays'] as List<dynamic>? ?? [];

    return PlanModel(
      id: data["planId"] as String? ?? '',
      duration: data['duration'] as String? ?? '',
      city: data['city'] as String? ?? '',
      categories: (data['categories'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      price: (data['price'] as num?)?.toDouble() ?? 0.0,
      averageRating: (data['averageRating'] as num?)?.toDouble() ?? 0.0,
      ratingCount: (data['ratingCount'] as num?)?.toInt() ?? 0,
      subscribers: (data['subscribers'] as num?)?.toInt() ?? 0,
      imageUrl: data['imageUrl'] as String? ?? '',
      isPremium: data['isPremium'] as bool? ?? false,
      planDays: daysRaw
          .map((e) => PlanDayModel.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'planId' : id,
      'duration': duration,
      'city': city,
      'categories': categories,
      'price': price,
      'averageRating': averageRating,
      'ratingCount': ratingCount,
      'subscribers': subscribers,
      'imageUrl': imageUrl,
      'isPremium': isPremium,
      'planDays':
          planDays.map((e) => (e as PlanDayModel).toMap()).toList(),
    };
  }
}

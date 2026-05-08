import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kemet_odyssey/core/services/i_services.dart';

class FirebaseServices implements IServices {
  final FirebaseFirestore firestore;

  FirebaseServices({required this.firestore});

  // ── Top Plans ─────────────────────────────────────────────────────────────
  /// Returns the top [limit] plans sorted by averageRating (descending).
  /// Uses the denormalized `averageRating` field stored directly on each
  /// Plans document — single Firestore read, no join with PlansRatings.
  Future<List<dynamic>> getTopPlans(
      {int limit = 10, String endPoint = "Plans"}) async {
    final snapshot = await firestore
        .collection(endPoint)
        .orderBy('averageRating', descending: true)
        .limit(limit)
        .get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  // ── IServices stubs (not used by Firestore path) ──────────────────────────

  @override
  Future<List<dynamic>> get({required String endPoint}) {
    return getTopPlans(limit: 10, endPoint: endPoint);
  }

  @override
  Future<Map<String, dynamic>> getPlace({required int placeId}) {
    throw UnimplementedError('Use getTopPlans() for Firestore data.');
  }
}


import 'package:kemet_odyssey/features/destinations/data/models/place_model.dart';

abstract class IServices {
  Future<List<dynamic>> get({required String endPoint});
  Future<Map<String, dynamic>> getPlace({required int placeId});
}

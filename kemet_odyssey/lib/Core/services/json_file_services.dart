import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:kemet_odyssey/core/services/i_services.dart';

class JsonFileServices implements IServices {
  @override
  Future<List<dynamic>> get({required String endPoint}) async {
    final String response =
        await rootBundle.loadString('lib/core/assets/data/Egypt.json');
    final data = await json.decode(response);
    final List<dynamic> citiesJson = data['cities'];
    return citiesJson;
  }

  @override
  Future<Map<String, dynamic>> getPlace({required int placeId}) async {
    final String response =
        await rootBundle.loadString('lib/core/assets/data/Egypt.json');
    final data = json.decode(response);
    final List<dynamic> citiesJson = data['cities'];

    final placesJson = citiesJson
        .whereType<Map<String, dynamic>>()
        .expand((city) => (city['places'] as List<dynamic>? ?? const []));
    final place = placesJson
        .map((p) => p as Map<String, dynamic>)
        .singleWhere((x) => x['id'] == placeId);
    return place;
  }
}

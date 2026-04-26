import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:kemet_odyssey/features/destinations/data/models/city_model.dart';
import 'package:kemet_odyssey/features/destinations/data/models/place_model.dart';

abstract class DestinationLocalDataSource {
  Future<List<CityModel>> fetchCities();
  Future<List<PlaceModel>> fetchPlaces({required String cityName});
}

class DestinationLocalDataSourceImplement extends DestinationLocalDataSource {
  @override
  Future<List<CityModel>> fetchCities() async {
    final String response =
        await rootBundle.loadString('lib/core/assets/data/Egypt.json');
    final data = await json.decode(response);
    final List<dynamic> citiesJson = data['cities'];
    return citiesJson.map((json) => CityModel.fromJsonData(json)).toList();
  }

  @override
  Future<List<PlaceModel>> fetchPlaces({required String cityName}) {
    // TODO: implement fetchPlaces
    throw UnimplementedError();
  }
}

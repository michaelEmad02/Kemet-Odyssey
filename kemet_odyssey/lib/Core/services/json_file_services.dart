import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:kemet_odyssey/core/services/i_services.dart';

class JsonFileServices implements IServices {
  @override
  Future<List<dynamic>> get({required String endPoint}) async {
    final String response =
        await rootBundle.loadString('lib/Core/assets/data/Egypt.json');
    final data = await json.decode(response);
    final List<dynamic> citiesJson = data['cities'];
    return citiesJson;
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mahjoub_company/api/api_settings.dart';
import 'package:mahjoub_company/models/city.dart';


class CitiesApiController {

  Future<List<City>> getCities() async {

    Uri uri = Uri.parse(ApiSettings.cities);
    var response = await http.get(uri,
      headers: {
      HttpHeaders.acceptHeader: 'application/json',
    });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var dataJsonObject = json['list'] as List;
      return dataJsonObject.map((jsonObject) =>
          City.fromJson(jsonObject)).toList();
    }
    return [];
  }
}
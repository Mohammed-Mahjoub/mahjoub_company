import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mahjoub_company/api/api_settings.dart';
import 'package:mahjoub_company/models/home.dart';
import 'package:mahjoub_company/prefs/shared_pref_controller.dart';
class HomeApiController {


  Future<Home?> getHome() async {
    String token =
    SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.home);

    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.acceptHeader: 'application/json',
    });
    if (response.statusCode == 200 || response.statusCode == 401) {
      if(response.statusCode == 200){
        var json = jsonDecode(response.body);
        var dataJsonObject = Home.fromJson(json['data']);
        return dataJsonObject;
      }
    }
    return null;
  }

}
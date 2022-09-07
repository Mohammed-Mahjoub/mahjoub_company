import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mahjoub_company/api/api_settings.dart';
import 'package:mahjoub_company/models/address.dart';
import 'package:mahjoub_company/models/api_response.dart';
import 'package:mahjoub_company/prefs/shared_pref_controller.dart';


class AddressesApiController {

  Future<ApiResponse> createAddress({
    required String name,
    required String info,
    required String mobileNumber,
    required String cityId,
  }) async {
    String token =
    SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.addresses);
    var response = await http.post(uri, body: {
      'name': name,
      'info': info,
      'contact_number': mobileNumber,
      'city_id': cityId,
    },headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.acceptHeader: 'application/json',
    });
    if (response.statusCode == 201 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      if(response.statusCode == 201){
        return ApiResponse(json['message'], json['status']);
      }
      return ApiResponse(json['message'], json['status']);
    }
    return ApiResponse('Something went wrong, try again', false);
  }


  Future<List<Address>> getAddress() async {
    String token =
    SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;

      Uri uri = Uri.parse(ApiSettings.addresses);
      var response = await http.get(uri,
          headers: {
        HttpHeaders.authorizationHeader:token,
            HttpHeaders.acceptHeader: 'application/json',
          });
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        var dataJsonObject = json['list'] as List;
        return dataJsonObject.map((jsonObject) =>
            Address.fromJson(jsonObject)).toList();
      }
      return [];
    }
  }
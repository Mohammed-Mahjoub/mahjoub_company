import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mahjoub_company/api/api_settings.dart';
import 'package:mahjoub_company/get/cart_getx_controller.dart';
import 'package:mahjoub_company/models/api_register_response.dart';
import 'package:mahjoub_company/models/api_response.dart';
import 'package:mahjoub_company/models/user.dart';
import 'package:mahjoub_company/prefs/shared_pref_controller.dart';

class AuthApiController {
  Future<ApiResponse> login(
      {required String mobileNumber, required String password}) async {
    Uri uri = Uri.parse(ApiSettings.login);
    var response = await http.post(uri, body: {
      'mobile': mobileNumber,
      'password': password,
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        User user = User.fromJson(json['data']);
        await SharedPrefController().save(user);
        CartGetxController cartGetxController = await Get.put<CartGetxController>(CartGetxController());
      }
      return ApiResponse(json['message'], json['status']);
    }
    return ApiResponse('Something went wrong, try again', false);
  }

  Future<ApiRegisterResponse> register({
    required String name,
    required String mobileNumber,
    required String password,
    required String gender,
    required String storeApiKey,
    required String cityId,
  }) async {
    Uri uri = Uri.parse(ApiSettings.register);
    var response = await http.post(uri, body: {
      'name': name,
      'mobile': mobileNumber,
      'password': password,
      'gender': gender,
      'STORE_API_KEY': storeApiKey,
      'city_id': cityId,
    },);
    if (response.statusCode == 201 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      if(response.statusCode == 201){
        return ApiRegisterResponse(json['message'], json['status'], code: json['code']);
      }
      return ApiRegisterResponse(json['message'], json['status']);
    }
    return ApiRegisterResponse('Something went wrong, try again', false);
  }

  Future<ApiResponse> logout() async {
    String token =
        SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.logout);

    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.acceptHeader: 'application/json',
    });
    if (response.statusCode == 200 || response.statusCode == 401) {
      SharedPrefController().clear();
      return ApiResponse('Logged out successful..', true);
    }
    return ApiResponse('Something went wrong, try again', false);
  }

  Future<ApiResponse> verification({
    required String mobileNumber,
    required String code,
  }) async {
    Uri uri = Uri.parse(ApiSettings.activate);
    var response = await http.post(uri, body: {
      'mobile': mobileNumber,
      'code': code,
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ApiResponse(json['message'], json['status']);
    }
    return ApiResponse('Something went wrong, try again', false);
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mahjoub_company/api/api_settings.dart';
import 'package:mahjoub_company/models/api_response.dart';
import 'package:mahjoub_company/models/order.dart';
import 'package:mahjoub_company/models/order_details.dart';
import 'package:mahjoub_company/prefs/shared_pref_controller.dart';

class OrdersApiController {
  Future<ApiResponse> createOrder({
    required List<Map<String,dynamic>> cartItems,
    required String paymentType,
    required int addressId,
  }) async {
    String token =
        SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.createOrders);
    var response = await http.post(uri, body: {
      'cart': jsonEncode(cartItems),
      'payment_type': paymentType,
      'address_id': addressId.toString(),
    }, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.acceptHeader: 'application/json',
    });

    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return ApiResponse(json['message'], json['status']);
      }
      return ApiResponse(json['message'], !json['status']);
    }
    return ApiResponse('Something went wrong, try again', false);
  }

  Future<List<Order>> getOrders() async {
    String token =
        SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.createOrders);
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.acceptHeader: 'application/json',
    });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var dataJsonObject = json['list'] as List;
      return dataJsonObject
          .map((jsonObject) => Order.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

  Future<OrderDetails?> getOrderDetails(int id) async {
    String token =
        SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;
    Uri uri = Uri.parse('${ApiSettings.orderDetails}${id.toString()}');
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.acceptHeader: 'application/json',
    });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      OrderDetails dataJsonObject = OrderDetails.fromJson(json['data']);
      return dataJsonObject;
    }
    return null;
  }
}

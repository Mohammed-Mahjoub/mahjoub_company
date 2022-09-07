import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mahjoub_company/api/api_settings.dart';
import 'package:mahjoub_company/models/app_category.dart';
import 'package:mahjoub_company/models/product.dart';
import 'package:mahjoub_company/models/product_details.dart';
import 'package:mahjoub_company/models/sub_category.dart';
import 'package:mahjoub_company/prefs/shared_pref_controller.dart';

class CategoriesApiController {

  Future<List<AppCategory>> getCategories() async {
    String token =
    SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.categories);
    var response = await http.get(uri,
      headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.acceptHeader: 'application/json',
    });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var dataJsonObject = json['list'] as List;
      return dataJsonObject.map((jsonObject) =>
          AppCategory.fromJson(jsonObject)).toList();
    }
    return [];
  }


  Future<List<SubCategory>> getSubCategories(int categoryId) async {
    String token =
    SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;
    Uri uri = Uri.parse('${ApiSettings.subCategories}${categoryId.toString()}');
    var response = await http.get(uri,
        headers: {
          HttpHeaders.authorizationHeader: token,
          HttpHeaders.acceptHeader: 'application/json',
        });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var dataJsonObject = json['list'] as List;
      return dataJsonObject.map((jsonObject) =>
          SubCategory.fromJson(jsonObject)).toList();
    }
    return [];
  }

  Future<List<Product>> getProducts(int subCategoryId) async {
    String token =
    SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;
    Uri uri = Uri.parse('${ApiSettings.products}${subCategoryId.toString()}');
    var response = await http.get(uri,
        headers: {
          HttpHeaders.authorizationHeader: token,
          HttpHeaders.acceptHeader: 'application/json',
        });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var dataJsonObject = json['list'] as List;
      return dataJsonObject.map((jsonObject) =>
          Product.fromJson(jsonObject)).toList();
    }
    return [];
  }

  Future<ProductDetail?> getProductDetails(int productId) async {
    String token =
    SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;
    Uri uri = Uri.parse('${ApiSettings.productDetails}${productId.toString()}');
    var response = await http.get(uri,
        headers: {
          HttpHeaders.authorizationHeader: token,
          HttpHeaders.acceptHeader: 'application/json',
        });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
        return ProductDetail.fromJson(json['object']);
    }
    return null;
  }
}
import 'package:mahjoub_company/models/city.dart';
import 'package:mahjoub_company/models/store.dart';

class User {
  late int id;
  late String name;
  late String? email;
  late String mobile;
  late String gender;
  late bool active;
  late bool verified;
  late String cityId;
  late String storeId;
  late String? fcmToken;
  late String token;
  late String tokenType;
  late String refreshToken;
  late City city;
  late Store store;

  late String password;

  User();
  static const String tableName= 'users';
  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    gender = json['gender'];
    active = json['active'];
    verified = json['verified'];
    cityId = json['city_id'];
    storeId = json['store_id'];
    fcmToken = json['fcm_token'];
    token = json['token'];
    tokenType = json['token_type'];
    refreshToken = json['refresh_token'];
    city = (json['city'] != null ?  City.fromJson(json['city']) : null)!;
    store = (json['store'] != null ?  Store.fromJson(json['store']) : null)!;
  }
  User.fromMap(Map<String, dynamic> rowMap) {
    id = rowMap['id'];
    name = rowMap['name'];
    mobile = rowMap['mobile'];
  }

  ///Prepare map to be saved in database
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['name'] = name;
    map['mobile'] = mobile;
    map['password'] = password;
    return map;
  }
}




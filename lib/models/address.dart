import 'package:mahjoub_company/models/city.dart';

class Address {
  String? name;
  String? info;
  String? mobileNumber;
  int? cityId;
  String? lat;
  String? lang;
  int? id;
  City? city;


  Address();

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    info = json['info'];
    mobileNumber = json['contact_number'];
    cityId = json['city_id'];
    lat = json['lat'];
    lang = json['lang'];
    city = json['city'] != null ?  City.fromJson(json['city']) : null;
  }
}
import 'package:mahjoub_company/models/address.dart';
import 'package:mahjoub_company/models/product.dart';

class OrderDetails {
  int? id;
  String? total;
  String? date;
  String? paymentType;
  String? status;
  String? storeId;
  String? userId;
  String? addressId;
  String? paymentCardId;
  String? productsCount;
  List<Product>? products;
  Address? address;

  OrderDetails();

  OrderDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    date = json['date'];
    paymentType = json['payment_type'];
    status = json['status'];
    storeId = json['store_id'];
    userId = json['user_id'];
    addressId = json['address_id'];
    paymentCardId = json['payment_card_id'];
    productsCount = json['products_count'];
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products!.add( Product.fromJson(v));
      });
    }
    address =
    json['address'] != null ?  Address.fromJson(json['address']) : null;
  }
}
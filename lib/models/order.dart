class Order {
  int? id;
  String? total;
  String? date;
  String? paymentType;
  String? status;
  String? storeId;
  String? userId;
  String? addressId;
  String? paymentCardId;
  String? orderProductsCount;

  Order();

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    date = json['date'];
    paymentType = json['payment_type'];
    status = json['status'];
    storeId = json['store_id'];
    userId = json['user_id'];
    addressId = json['address_id'];
    paymentCardId = json['payment_card_id'];
    orderProductsCount = json['order_products_count'];
  }
}
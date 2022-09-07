class NewCart {
  late int id;
  late int productId;
  late int quantity;

  NewCart(this.productId, this.quantity);

  NewCart.fromMap(Map<String, dynamic> rowMap) {
    id = rowMap['id'];
    productId = rowMap['productId'];
    quantity = rowMap['quantity'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['product_id'] = productId;
    map['quantity'] = quantity;
    return map;
  }
}

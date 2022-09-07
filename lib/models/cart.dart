class Cart {
  late int id;
  late int productId;
  late double total = quantity*price;
  late double price;
  late int quantity;
  late String nameEn;
  late String nameAr;
  late String infoEn;
  late String infoAr;
  late String overalRate;
  late String subCategoryId;
  late String productRate;
  late String? offerPrice;
  late String? favorite;
  late String imageUrl;
  late int userId;

  static const String tableName = 'cart';

  Cart();
  Cart.fromMap(Map<String, dynamic> rowMap) {
    id = rowMap['id'];
    productId = rowMap['productId'];
    nameEn = rowMap['nameEn'];
    nameAr = rowMap['nameAr'];
    infoEn = rowMap['infoEn'];
    infoAr = rowMap['infoAr'];
    price = rowMap['price'];
    quantity = rowMap['quantity'];
    overalRate = rowMap['overalRate'];
    subCategoryId = rowMap['subCategoryId'];
    productRate = rowMap['productRate'];
    offerPrice = rowMap['offerPrice'];
    favorite = rowMap['favorite'];
    imageUrl = rowMap['imageUrl'];
    userId = rowMap['user_id'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['productId'] = productId;
    map['nameEn'] = nameEn;
    map['nameAr'] = nameAr;
    map['infoEn'] = infoEn;
    map['infoAr'] = infoAr;
    map['price'] = price;
    map['quantity'] = quantity;
    map['overalRate'] = overalRate;
    map['subCategoryId'] = subCategoryId;
    map['productRate'] = productRate;
    map['offerPrice'] = offerPrice;
    map['favorite'] = favorite;
    map['imageUrl'] = imageUrl;
    map['user_id'] = userId;
    return map;
  }
}
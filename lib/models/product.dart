class Product {
 late int? id;
 late String? nameEn;
 late String? nameAr;
 late String? infoEn;
 late String? infoAr;
 late String? price;
 late String? quantity;
 late String? overalRate;
 late String? subCategoryId;
 late int? productRate;
 late String? offerPrice;
 late bool? favorite;
 late String? imageUrl;
 late int? userId;
  Product.my({
    required this.nameEn,
    required this.infoEn,
    required this.imageUrl,
    required this.price,
    this.favorite = false,
  });

  static const String tableName = 'products';

  Product();
  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    infoEn = json['info_en'];
    infoAr = json['info_ar'];
    price = json['price'];
    quantity = json['quantity'];
    overalRate = json['overal_rate'];
    subCategoryId = json['sub_category_id'];
    productRate = json['product_rate'];
    offerPrice = json['offer_price'];
    favorite = json['is_favorite'];
    imageUrl = json['image_url'];
  }
}

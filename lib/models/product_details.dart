import 'package:mahjoub_company/models/sub_category.dart';

class ProductDetail {
  int? id;
  String? nameEn;
  String? nameAr;
  String? infoEn;
  String? infoAr;
  String? price;
  String? quantity;
  String? overalRate;
  String? subCategoryId;
  int? productRate;
  String? offerPrice;
  bool? isFavorite;
  String? imageUrl;
  List<Images>? images;
  SubCategory? subCategory;

  ProductDetail();

  ProductDetail.fromJson(Map<String, dynamic> json) {
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
    isFavorite = json['is_favorite'];
    imageUrl = json['image_url'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    subCategory = json['sub_category'] != null
        ? SubCategory.fromJson(json['sub_category'])
        : null;
  }

}

class Images {
  int? id;
  String? objectId;
  String? url;
  String? imageUrl;

  Images({this.id, this.objectId, this.url, this.imageUrl});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    objectId = json['object_id'];
    url = json['url'];
    imageUrl = json['image_url'];
  }
}
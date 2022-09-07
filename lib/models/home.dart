class Home {
  List<Slider>? slider;
  List<Categories>? categories;
  List<LatestProducts>? latestProducts;
  List<LatestProducts>? famousProducts;

  Home();

  Home.fromJson(Map<String, dynamic> json) {
    if (json['slider'] != null) {
      slider = <Slider>[];
      json['slider'].forEach((v) {
        slider!.add( Slider.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add( Categories.fromJson(v));
      });
    }
    if (json['latest_products'] != null) {
      latestProducts = <LatestProducts>[];
      json['latest_products'].forEach((v) {
        latestProducts!.add( LatestProducts.fromJson(v));
      });
    }
    if (json['famous_products'] != null) {
      famousProducts = <LatestProducts>[];
      json['famous_products'].forEach((v) {
        famousProducts!.add( LatestProducts.fromJson(v));
      });
    }
  }
}

class Slider {
  int? id;
  String? objectId;
  String? url;
  String? imageUrl;

  Slider();

  Slider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    objectId = json['object_id'];
    url = json['url'];
    imageUrl = json['image_url'];
  }
}

class Categories {
  int? id;
  String? nameEn;
  String? nameAr;
  String? image;
  String? imageUrl;

  Categories();

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    image = json['image'];
    imageUrl = json['image_url'];
  }
}

class LatestProducts {
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

  LatestProducts();

  LatestProducts.fromJson(Map<String, dynamic> json) {
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
  }
}
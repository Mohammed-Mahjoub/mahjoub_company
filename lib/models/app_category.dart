class AppCategory {
  int? id;
  String? nameEn;
  String? nameAr;
  String? image;
  String? productsCount;
  String? subCategoriesCount;
  String? imageUrl;

  AppCategory();

  AppCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    image = json['image'];
    productsCount = json['products_count'];
    subCategoriesCount = json['sub_categories_count'];
    imageUrl = json['image_url'];
  }

}
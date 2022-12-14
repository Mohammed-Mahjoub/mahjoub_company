class Store {
  late int id;
  late String name;
  late String storeName;
  late String? email;
  late String? emailVerifiedAt;
  late String mobile;
  late String storeUuid;
  late String cityId;
  late int? verificationCode;
  late String active;
  late String verified;
  late String? firebaseKey;
  late String? image;
  late String address;
  late String? facebook;
  late String? instagram;
  late String createdAt;
  late String updatedAt;
  String storeApiKey = '923b0320-7471-47da-9562-4a3d896fb977';
  Store();

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    storeName = json['store_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    mobile = json['mobile'];
    storeUuid = json['store_uuid'];
    cityId = json['city_id'];
    verificationCode = json['verification_code'];
    active = json['active'];
    verified = json['verified'];
    firebaseKey = json['firebase_key'];
    image = json['image'];
    address = json['address'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}
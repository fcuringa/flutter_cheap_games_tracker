/// Model for a [Store] in the REST API
class StoreModel {
  final String storeID;
  final String storeName;
  final int isActive;
  final StoreImagesModel images;

  StoreModel(this.storeID, this.storeName, this.isActive, this.images);

  factory StoreModel.fromJson(Map<String, dynamic> map) {
    return StoreModel(map['storeID'], map['storeName'], map['isActive'],
        StoreImagesModel.fromJson(map['images']));
  }
}

class StoreImagesModel {
  final String banner;
  final String logo;
  final String icon;

  StoreImagesModel(this.banner, this.logo, this.icon);

  factory StoreImagesModel.fromJson(Map<String, dynamic> map) {
    return StoreImagesModel(map['banner'], map['logo'], map['icon']);
  }
}

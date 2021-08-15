// To parse this JSON data, do
//
//     final getAllProductCategories = getAllProductCategoriesFromJson(jsonString);

import 'dart:convert';

GetAllProductCategories getAllProductCategoriesFromJson(String str) =>
    GetAllProductCategories.fromJson(json.decode(str));

String getAllProductCategoriesToJson(GetAllProductCategories data) =>
    json.encode(data.toJson());

class GetAllProductCategories {
  GetAllProductCategories({
    this.object,
    this.errorMsg,
    this.expiryDate,
    this.timestamp,
    this.errorCode,
    this.status,
  });

  List<Object> object;
  dynamic errorMsg;
  dynamic expiryDate;
  DateTime timestamp;
  dynamic errorCode;
  String status;

  factory GetAllProductCategories.fromJson(Map<String, dynamic> json) =>
      GetAllProductCategories(
        object:
            List<Object>.from(json["object"].map((x) => Object.fromJson(x))),
        errorMsg: json["errorMsg"],
        expiryDate: json["expiryDate"],
        timestamp: DateTime.parse(json["timestamp"]),
        errorCode: json["errorCode"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "object": List<dynamic>.from(object.map((x) => x.toJson())),
        "errorMsg": errorMsg,
        "expiryDate": expiryDate,
        "timestamp": timestamp.toIso8601String(),
        "errorCode": errorCode,
        "status": status,
      };
}

class Object {
  Object({
    this.name,
    this.translatedName,
    this.visible,
    this.isFeatured,
    this.productCategoryImages,
    this.parentCategoryId,
    this.subCategories,
    this.id,
  });

  String name;
  String translatedName;
  bool visible;
  bool isFeatured;
  List<ProductCategoryImage> productCategoryImages;
  Object parentCategoryId;
  List<Object> subCategories;
  int id;

  factory Object.fromJson(Map<String, dynamic> json) => Object(
        name: json["name"],
        translatedName: json["translatedName"],
        visible: json["visible"],
        isFeatured: json["isFeatured"],
        productCategoryImages: List<ProductCategoryImage>.from(
            json["productCategoryImages"]
                .map((x) => ProductCategoryImage.fromJson(x))),
        parentCategoryId: json["parentCategoryId"] == null
            ? null
            : Object.fromJson(json["parentCategoryId"]),
        subCategories: json["subCategories"] == null
            ? null
            : List<Object>.from(
                json["subCategories"].map((x) => Object.fromJson(x))),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "translatedName": translatedName,
        "visible": visible,
        "isFeatured": isFeatured,
        "productCategoryImages":
            List<dynamic>.from(productCategoryImages.map((x) => x.toJson())),
        "parentCategoryId":
            parentCategoryId == null ? null : parentCategoryId.toJson(),
        "subCategories": subCategories == null
            ? null
            : List<dynamic>.from(subCategories.map((x) => x.toJson())),
        "id": id,
      };
}

class ProductCategoryImage {
  ProductCategoryImage({
    this.position,
    this.imageUrl,
    this.id,
  });

  int position;
  String imageUrl;
  int id;

  factory ProductCategoryImage.fromJson(Map<String, dynamic> json) =>
      ProductCategoryImage(
        position: json["position"],
        imageUrl: json["imageUrl"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "position": position,
        "imageUrl": imageUrl,
        "id": id,
      };
}

// To parse this JSON data, do
//
//     final getProductCategory = getProductCategoryFromJson(jsonString);

import 'dart:convert';

import 'package:afrimash/model/trending_products.dart';

GetProductCategory getProductCategoryFromJson(String str) =>
    GetProductCategory.fromJson(json.decode(str));

String getProductCategoryToJson(GetProductCategory data) =>
    json.encode(data.toJson());

class GetProductCategory {
  GetProductCategory({
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

  factory GetProductCategory.fromJson(Map<String, dynamic> json) =>
      GetProductCategory(
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
    this.taxGroupId,
    this.name,
    this.description,
    this.sku,
    this.translatedName,
    this.barcode,
    this.productUrl,
    this.visible,
    this.enableStockManagement,
    this.enableReviews,
    this.productCategoryId,
    this.buyPrice,
    this.rating,
    this.price,
    this.discountRate,
    this.dateAdded,
    this.productImages,
    this.productVariants,
    this.productCategories,
    this.productFeatures,
    this.productReviews,
    this.brandId,
    this.storeId,
    this.tags,
    this.productType,
    this.id,
  });

  dynamic taxGroupId;
  String name;
  String description;
  String sku;
  dynamic translatedName;
  dynamic barcode;
  dynamic productUrl;
  bool visible;
  bool enableStockManagement;
  bool enableReviews;
  dynamic productCategoryId;
  double buyPrice;
  dynamic rating;
  double price;
  double discountRate;
  dynamic dateAdded;
  List<ProductImages> productImages;
  List<dynamic> productVariants;
  List<Category> productCategories;
  List<dynamic> productFeatures;
  List<dynamic> productReviews;
  BrandId brandId;
  StoreId storeId;
  List<Tag> tags;
  String productType;
  int id;

  factory Object.fromJson(Map<String, dynamic> json) => Object(
        taxGroupId: json["taxGroupId"],
        name: json["name"],
        description: json["description"],
        sku: json["sku"],
        translatedName: json["translatedName"],
        barcode: json["barcode"],
        productUrl: json["productUrl"],
        visible: json["visible"],
        enableStockManagement: json["enableStockManagement"],
        enableReviews: json["enableReviews"],
        productCategoryId: json["productCategoryId"],
        buyPrice: json["buyPrice"],
        rating: json["rating"],
        price: json["price"],
        discountRate: json["discountRate"],
        dateAdded: json["dateAdded"],
        productImages: List<ProductImages>.from(
            json["productImages"].map((x) => ProductImages.fromJson(x))),
        productVariants:
            List<dynamic>.from(json["productVariants"].map((x) => x)),
        productCategories: List<Category>.from(
            json["productCategories"].map((x) => Category.fromJson(x))),
        productFeatures:
            List<dynamic>.from(json["productFeatures"].map((x) => x)),
        productReviews:
            List<dynamic>.from(json["productReviews"].map((x) => x)),
        brandId: BrandId.fromJson(json["brandId"]),
        storeId: StoreId.fromJson(json["storeId"]),
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        productType: json["productType"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "taxGroupId": taxGroupId,
        "name": name,
        "description": description,
        "sku": sku,
        "translatedName": translatedName,
        "barcode": barcode,
        "productUrl": productUrl,
        "visible": visible,
        "enableStockManagement": enableStockManagement,
        "enableReviews": enableReviews,
        "productCategoryId": productCategoryId,
        "buyPrice": buyPrice,
        "rating": rating,
        "price": price,
        "discountRate": discountRate,
        "dateAdded": dateAdded,
        "productImages":
            List<dynamic>.from(productImages.map((x) => x.toJson())),
        "productVariants": List<dynamic>.from(productVariants.map((x) => x)),
        "productCategories":
            List<dynamic>.from(productCategories.map((x) => x.toJson())),
        "productFeatures": List<dynamic>.from(productFeatures.map((x) => x)),
        "productReviews": List<dynamic>.from(productReviews.map((x) => x)),
        "brandId": brandId.toJson(),
        "storeId": storeId.toJson(),
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "productType": productType,
        "id": id,
      };
}

class BrandId {
  BrandId({
    this.id,
    this.name,
    this.description,
  });

  int id;
  String name;
  dynamic description;

  factory BrandId.fromJson(Map<String, dynamic> json) => BrandId(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}

class Category {
  Category({
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
  List<ProductImages> productCategoryImages;
  dynamic parentCategoryId;
  List<Category> subCategories;
  int id;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        translatedName: json["translatedName"],
        visible: json["visible"],
        isFeatured: json["isFeatured"],
        productCategoryImages: List<ProductImages>.from(
            json["productCategoryImages"]
                .map((x) => ProductImages.fromJson(x))),
        parentCategoryId: json["parentCategoryId"],
        subCategories: json["subCategories"] == null
            ? null
            : List<Category>.from(
                json["subCategories"].map((x) => Category.fromJson(x))),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "translatedName": translatedName,
        "visible": visible,
        "isFeatured": isFeatured,
        "productCategoryImages":
            List<dynamic>.from(productCategoryImages.map((x) => x.toJson())),
        "parentCategoryId": parentCategoryId,
        "subCategories": subCategories == null
            ? null
            : List<dynamic>.from(subCategories.map((x) => x.toJson())),
        "id": id,
      };
}

class ProductImage {
  ProductImage({
    this.position,
    this.imageUrl,
    this.id,
  });

  int position;
  String imageUrl;
  int id;

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
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

class StoreId {
  StoreId({
    this.id,
    this.name,
    this.description,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.logo,
    this.sellerId,
  });

  int id;
  String name;
  dynamic description;
  dynamic address1;
  dynamic address2;
  dynamic city;
  dynamic state;
  dynamic logo;
  SellerId sellerId;

  factory StoreId.fromJson(Map<String, dynamic> json) => StoreId(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        address1: json["address1"],
        address2: json["address2"],
        city: json["city"],
        state: json["state"],
        logo: json["logo"],
        sellerId: SellerId.fromJson(json["sellerId"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "address1": address1,
        "address2": address2,
        "city": city,
        "state": state,
        "logo": logo,
        "sellerId": sellerId.toJson(),
      };
}

class SellerId {
  SellerId({
    this.id,
    this.loyaltyNo,
    this.loyaltyPoint,
    this.mobileNo,
    this.workphoneNo,
    this.email,
    this.name,
    this.referralCode,
    this.address,
    this.city,
    this.state,
    this.zipCode,
    this.country,
    this.walletBalance,
    this.creditLimit,
    this.creditSpent,
    this.vendorCode,
    this.dateRegistered,
    this.lastActivity,
  });

  int id;
  dynamic loyaltyNo;
  dynamic loyaltyPoint;
  String mobileNo;
  dynamic workphoneNo;
  String email;
  String name;
  dynamic referralCode;
  String address;
  String city;
  String state;
  String zipCode;
  String country;
  dynamic walletBalance;
  dynamic creditLimit;
  dynamic creditSpent;
  dynamic vendorCode;
  dynamic dateRegistered;
  dynamic lastActivity;

  factory SellerId.fromJson(Map<String, dynamic> json) => SellerId(
        id: json["id"],
        loyaltyNo: json["loyaltyNo"],
        loyaltyPoint: json["loyaltyPoint"],
        mobileNo: json["mobileNo"],
        workphoneNo: json["workphoneNo"],
        email: json["email"],
        name: json["name"],
        referralCode: json["referralCode"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zipCode"],
        country: json["country"],
        walletBalance: json["walletBalance"],
        creditLimit: json["creditLimit"],
        creditSpent: json["creditSpent"],
        vendorCode: json["vendorCode"],
        dateRegistered: json["dateRegistered"],
        lastActivity: json["lastActivity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "loyaltyNo": loyaltyNo,
        "loyaltyPoint": loyaltyPoint,
        "mobileNo": mobileNo,
        "workphoneNo": workphoneNo,
        "email": email,
        "name": name,
        "referralCode": referralCode,
        "address": address,
        "city": city,
        "state": state,
        "zipCode": zipCode,
        "country": country,
        "walletBalance": walletBalance,
        "creditLimit": creditLimit,
        "creditSpent": creditSpent,
        "vendorCode": vendorCode,
        "dateRegistered": dateRegistered,
        "lastActivity": lastActivity,
      };
}

class Tag {
  Tag({
    this.name,
    this.id,
  });

  String name;
  int id;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}

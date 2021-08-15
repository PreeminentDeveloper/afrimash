// To parse this JSON data, do
//
//     final featuredProducts = featuredProductsFromJson(jsonString);

import 'dart:convert';

import 'package:afrimash/model/trending_products.dart';

FeaturedProducts featuredProductsFromJson(String str) =>
    FeaturedProducts.fromJson(json.decode(str));

String featuredProductsToJson(FeaturedProducts data) =>
    json.encode(data.toJson());

class FeaturedProducts {
  FeaturedProducts({
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

  factory FeaturedProducts.fromJson(Map<String, dynamic> json) =>
      FeaturedProducts(
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
  dynamic buyPrice;
  dynamic rating;
  dynamic price;
  dynamic discountRate;
  dynamic dateAdded;
  List<ProductImages> productImages;
  List<dynamic> productVariants;
  List<ProductCategory> productCategories;
  List<dynamic> productFeatures;
  List<ProductReview> productReviews;
  BrandId brandId;
  StoreId storeId;
  List<Tag> tags;
  ProductType productType;
  int id;

  factory Object.fromJson(Map<String, dynamic> json) => Object(
        taxGroupId: json["taxGroupId"],
        name: json["name"],
        description: json["description"] == null ? null : json["description"],
        sku: json["sku"] == null ? null : json["sku"],
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
        productCategories: List<ProductCategory>.from(
            json["productCategories"].map((x) => ProductCategory.fromJson(x))),
        productFeatures:
            List<dynamic>.from(json["productFeatures"].map((x) => x)),
        productReviews: List<ProductReview>.from(
            json["productReviews"].map((x) => ProductReview.fromJson(x))),
        brandId: BrandId.fromJson(json["brandId"]),
        storeId: StoreId.fromJson(json["storeId"]),
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        productType: json["productType"] == null
            ? null
            : productTypeValues.map[json["productType"]],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "taxGroupId": taxGroupId,
        "name": name,
        "description": description == null ? null : description,
        "sku": sku == null ? null : sku,
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
        "productReviews":
            List<dynamic>.from(productReviews.map((x) => x.toJson())),
        "brandId": brandId.toJson(),
        "storeId": storeId.toJson(),
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "productType":
            productType == null ? null : productTypeValues.reverse[productType],
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
  BrandIdName name;
  dynamic description;

  factory BrandId.fromJson(Map<String, dynamic> json) => BrandId(
        id: json["id"],
        name: brandIdNameValues.map[json["name"]],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": brandIdNameValues.reverse[name],
        "description": description,
      };
}

enum BrandIdName {
  CHICKS_HUB,
  MAMA_GOLD,
  RABBIT_HUB,
  AKINSSBRAND,
  DIVINE_FARMS,
  GRINPHIELD,
  LIIWMI
}

final brandIdNameValues = EnumValues({
  "Akinssbrand": BrandIdName.AKINSSBRAND,
  "Chicks Hub": BrandIdName.CHICKS_HUB,
  "Divine Farms": BrandIdName.DIVINE_FARMS,
  "Grinphield": BrandIdName.GRINPHIELD,
  "LIIWMI": BrandIdName.LIIWMI,
  "Mama Gold": BrandIdName.MAMA_GOLD,
  "Rabbit Hub": BrandIdName.RABBIT_HUB
});

class ProductCategory {
  ProductCategory({
    this.name,
    this.translatedName,
    this.visible,
    this.isFeatured,
    this.productCategoryImages,
    this.parentCategoryId,
    this.subCategories,
    this.id,
  });

  TranslatedNameEnum name;
  TranslatedNameEnum translatedName;
  bool visible;
  bool isFeatured;
  List<ProductImage> productCategoryImages;
  ProductCategory parentCategoryId;
  List<ProductCategory> subCategories;
  int id;

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(
        name: translatedNameEnumValues.map[json["name"]],
        translatedName: translatedNameEnumValues.map[json["translatedName"]],
        visible: json["visible"],
        isFeatured: json["isFeatured"],
        productCategoryImages: json["productCategoryImages"] == null
            ? null
            : List<ProductImage>.from(json["productCategoryImages"]
                .map((x) => ProductImage.fromJson(x))),
        parentCategoryId: json["parentCategoryId"] == null
            ? null
            : ProductCategory.fromJson(json["parentCategoryId"]),
        subCategories: json["subCategories"] == null
            ? null
            : List<ProductCategory>.from(
                json["subCategories"].map((x) => ProductCategory.fromJson(x))),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": translatedNameEnumValues.reverse[name],
        "translatedName": translatedNameEnumValues.reverse[translatedName],
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

enum TranslatedNameEnum {
  CHICKEN_CAGES,
  AFRIMASH_COMBO_OFFERS,
  OUTDOOR_AGRICULTURAL_EQUIPMENT,
  INCUBATORS,
  CATTLE_EQUIPMENT,
  RABBIT_EQUIPMENT,
  AGRICULTURAL_EQUIPMENT,
  FISH_EQUIPMENT,
  POULTRY_EQUIPMENT,
  PIG_EQUIPMENT,
  WATER_PUMPS,
  SOLAR_INVERTERS,
  DIGITAL_METERS,
  CHICKEN_EGG_CRATES,
  DEFEATHERING_MACHINE,
  FEEDERS_AND_DRINKERS,
  POULTRY_PROCESSING_EQUIPMENT,
  KNAPSACK_SPRAYERS,
  SCALES,
  MOTOR_MACHINES,
  FARM_IRRIGATION_EQUIPMENT,
  INDUSTRIAL_INCUBATORS,
  PORTABLE_INCUBATORS,
  RABBIT_CAGES,
  NAME_WATER_PUMPS
}

final translatedNameEnumValues = EnumValues({
  "Afrimash Combo Offers": TranslatedNameEnum.AFRIMASH_COMBO_OFFERS,
  "Agricultural Equipment": TranslatedNameEnum.AGRICULTURAL_EQUIPMENT,
  "Cattle Equipment ": TranslatedNameEnum.CATTLE_EQUIPMENT,
  "Chicken Cages": TranslatedNameEnum.CHICKEN_CAGES,
  "Chicken Egg Crates": TranslatedNameEnum.CHICKEN_EGG_CRATES,
  "Defeathering Machine": TranslatedNameEnum.DEFEATHERING_MACHINE,
  "Digital Meters": TranslatedNameEnum.DIGITAL_METERS,
  "Farm Irrigation Equipment": TranslatedNameEnum.FARM_IRRIGATION_EQUIPMENT,
  "Feeders and Drinkers": TranslatedNameEnum.FEEDERS_AND_DRINKERS,
  "Fish Equipment": TranslatedNameEnum.FISH_EQUIPMENT,
  "Incubators": TranslatedNameEnum.INCUBATORS,
  "Industrial Incubators": TranslatedNameEnum.INDUSTRIAL_INCUBATORS,
  "Knapsack Sprayers": TranslatedNameEnum.KNAPSACK_SPRAYERS,
  "Motor Machines": TranslatedNameEnum.MOTOR_MACHINES,
  "Water Pumps": TranslatedNameEnum.NAME_WATER_PUMPS,
  "Outdoor Agricultural Equipment":
      TranslatedNameEnum.OUTDOOR_AGRICULTURAL_EQUIPMENT,
  "Pig Equipment ": TranslatedNameEnum.PIG_EQUIPMENT,
  "Portable Incubators": TranslatedNameEnum.PORTABLE_INCUBATORS,
  "Poultry Equipment": TranslatedNameEnum.POULTRY_EQUIPMENT,
  "Poultry Processing Equipment":
      TranslatedNameEnum.POULTRY_PROCESSING_EQUIPMENT,
  "Rabbit cages": TranslatedNameEnum.RABBIT_CAGES,
  "Rabbit Equipment ": TranslatedNameEnum.RABBIT_EQUIPMENT,
  "Scales": TranslatedNameEnum.SCALES,
  "Solar Inverters": TranslatedNameEnum.SOLAR_INVERTERS,
  "Water Pumps ": TranslatedNameEnum.WATER_PUMPS
});

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

class ProductReview {
  ProductReview({
    this.id,
    this.dateGiven,
    this.rating,
    this.comment,
    this.title,
  });

  int id;
  String dateGiven;
  dynamic rating;
  String comment;
  String title;

  factory ProductReview.fromJson(Map<String, dynamic> json) => ProductReview(
        id: json["id"],
        dateGiven: json["dateGiven"],
        rating: json["rating"],
        comment: json["comment"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dateGiven": dateGiven,
        "rating": rating,
        "comment": comment,
        "title": title,
      };
}

enum ProductType { VARIANT, GROUPED, SIMPLE, EXTERNAL }

final productTypeValues = EnumValues({
  "EXTERNAL": ProductType.EXTERNAL,
  "GROUPED": ProductType.GROUPED,
  "SIMPLE": ProductType.SIMPLE,
  "VARIANT": ProductType.VARIANT
});

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
  StoreIdName name;
  dynamic description;
  dynamic address1;
  dynamic address2;
  dynamic city;
  dynamic state;
  dynamic logo;
  SellerId sellerId;

  factory StoreId.fromJson(Map<String, dynamic> json) => StoreId(
        id: json["id"],
        name: storeIdNameValues.map[json["name"]],
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
        "name": storeIdNameValues.reverse[name],
        "description": description,
        "address1": address1,
        "address2": address2,
        "city": city,
        "state": state,
        "logo": logo,
        "sellerId": sellerId.toJson(),
      };
}

enum StoreIdName {
  YOSHER_DAN_BEAUTY_ORGANIC,
  FARMERS_SHOP_2,
  DAY_OLD_BROILERS,
  OPE_FARMS
}

final storeIdNameValues = EnumValues({
  "Day-old Broilers": StoreIdName.DAY_OLD_BROILERS,
  "Farmers Shop 2": StoreIdName.FARMERS_SHOP_2,
  "Ope Farms": StoreIdName.OPE_FARMS,
  "Yosher-Dan-Beauty(Organic)": StoreIdName.YOSHER_DAN_BEAUTY_ORGANIC
});

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
  Email email;
  SellerIdName name;
  dynamic referralCode;
  dynamic address;
  City city;
  State state;
  dynamic zipCode;
  Country country;
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
        email: emailValues.map[json["email"]],
        name: sellerIdNameValues.map[json["name"]],
        referralCode: json["referralCode"],
        address: json["address"],
        city: json["city"] == null ? null : cityValues.map[json["city"]],
        state: stateValues.map[json["state"]],
        zipCode: json["zipCode"],
        country:
            json["country"] == null ? null : countryValues.map[json["country"]],
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
        "email": emailValues.reverse[email],
        "name": sellerIdNameValues.reverse[name],
        "referralCode": referralCode,
        "address": address,
        "city": city == null ? null : cityValues.reverse[city],
        "state": stateValues.reverse[state],
        "zipCode": zipCode,
        "country": country == null ? null : countryValues.reverse[country],
        "walletBalance": walletBalance,
        "creditLimit": creditLimit,
        "creditSpent": creditSpent,
        "vendorCode": vendorCode,
        "dateRegistered": dateRegistered,
        "lastActivity": lastActivity,
      };
}

enum City { IKEJA }

final cityValues = EnumValues({"Ikeja": City.IKEJA});

enum Country { NIGERIA }

final countryValues = EnumValues({"Nigeria": Country.NIGERIA});

enum Email {
  YOSHERDANBEAUTY_GMAIL_COM,
  AGROHOUSE_GMAIL_COM,
  CHICKSHUB_GMAIL_COM,
  OPEFARMS_GMAIL_COM
}

final emailValues = EnumValues({
  "agrohouse@gmail.com": Email.AGROHOUSE_GMAIL_COM,
  "chickshub@gmail.com": Email.CHICKSHUB_GMAIL_COM,
  "opefarms@gmail.com": Email.OPEFARMS_GMAIL_COM,
  "yosherdanbeauty@gmail.com": Email.YOSHERDANBEAUTY_GMAIL_COM
});

enum SellerIdName {
  YOSHER_DAN_BEAUTY_ORGANIC,
  AGRIC_HOUSE_SHOP,
  CHICKS_HUB,
  OPE_FARMS
}

final sellerIdNameValues = EnumValues({
  "Agric House Shop ": SellerIdName.AGRIC_HOUSE_SHOP,
  "Chicks Hub ": SellerIdName.CHICKS_HUB,
  "Ope Farms ": SellerIdName.OPE_FARMS,
  "Yosher-Dan-Beauty(Organic)": SellerIdName.YOSHER_DAN_BEAUTY_ORGANIC
});

enum State { IBADAN, LAGOS }

final stateValues = EnumValues({"Ibadan": State.IBADAN, "lagos": State.LAGOS});

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

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

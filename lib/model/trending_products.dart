import 'package:afrimash/model/popular_categories.dart';

class TrendingProducts {
  List<Object> object;
  dynamic errorMsg;
  dynamic expiryDate;
  String timestamp;
  dynamic errorCode;
  String status;

  TrendingProducts(
      {this.object,
      this.errorMsg,
      this.expiryDate,
      this.timestamp,
      this.errorCode,
      this.status});

  TrendingProducts.fromJson(Map<String, dynamic> json) {
    if (json['object'] != null) {
      object = new List<Object>();
      json['object'].forEach((v) {
        object.add(new Object.fromJson(v));
      });
    }
    errorMsg = json['errorMsg'];
    expiryDate = json['expiryDate'];
    timestamp = json['timestamp'];
    errorCode = json['errorCode'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.object != null) {
      data['object'] = this.object.map((v) => v.toJson()).toList();
    }
    data['errorMsg'] = this.errorMsg;
    data['expiryDate'] = this.expiryDate;
    data['timestamp'] = this.timestamp;
    data['errorCode'] = this.errorCode;
    data['status'] = this.status;
    return data;
  }
}

class TrendingObject {
  Product product;

  TrendingObject({this.product});

  TrendingObject.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    return data;
  }
}

class Product {
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
  List<ProductVariants> productVariants;
  List<ProductCategories> productCategories;
  List<ProductFeatures> productFeatures;
  List<ProductReviews> productReviews;
  BrandId brandId;
  StoreId storeId;
  List<Tags> tags;
  String productType;
  int id;

  Product(
      {this.taxGroupId,
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
      this.id});

  Product.fromJson(Map<String, dynamic> json) {
    taxGroupId = json['taxGroupId'];
    name = json['name'];
    description = json['description'];
    sku = json['sku'];
    translatedName = json['translatedName'];
    barcode = json['barcode'];
    productUrl = json['productUrl'];
    visible = json['visible'];
    enableStockManagement = json['enableStockManagement'];
    enableReviews = json['enableReviews'];
    productCategoryId = json['productCategoryId'];
    buyPrice = json['buyPrice'];
    rating = json['rating'];
    price = json['price'];
    discountRate = json['discountRate'];
    dateAdded = json['dateAdded'];
    if (json['productImages'] != null) {
      productImages = new List<ProductImages>();
      json['productImages'].forEach((v) {
        productImages.add(new ProductImages.fromJson(v));
      });
    }
    if (json['productVariants'] != null) {
      productVariants = new List<ProductVariants>();
      json['productVariants'].forEach((v) {
        productVariants.add(new ProductVariants.fromJson(v));
      });
    }
    if (json['productCategories'] != null) {
      productCategories = new List<ProductCategories>();
      json['productCategories'].forEach((v) {
        productCategories.add(new ProductCategories.fromJson(v));
      });
    }
    if (json['productFeatures'] != null) {
      productFeatures = new List<ProductFeatures>();
      json['productFeatures'].forEach((v) {
        productFeatures.add(new ProductFeatures.fromJson(v));
      });
    }
    if (json['productReviews'] != null) {
      productReviews = new List<ProductReviews>();
      json['productReviews'].forEach((v) {
        productReviews.add(new ProductReviews.fromJson(v));
      });
    }
    brandId =
        json['brandId'] != null ? new BrandId.fromJson(json['brandId']) : null;
    storeId =
        json['storeId'] != null ? new StoreId.fromJson(json['storeId']) : null;
    if (json['tags'] != null) {
      tags = new List<Tags>();
      json['tags'].forEach((v) {
        tags.add(new Tags.fromJson(v));
      });
    }
    productType = json['productType'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taxGroupId'] = this.taxGroupId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['sku'] = this.sku;
    data['translatedName'] = this.translatedName;
    data['barcode'] = this.barcode;
    data['productUrl'] = this.productUrl;
    data['visible'] = this.visible;
    data['enableStockManagement'] = this.enableStockManagement;
    data['enableReviews'] = this.enableReviews;
    data['productCategoryId'] = this.productCategoryId;
    data['buyPrice'] = this.buyPrice;
    data['rating'] = this.rating;
    data['price'] = this.price;
    data['discountRate'] = this.discountRate;
    data['dateAdded'] = this.dateAdded;
    if (this.productImages != null) {
      data['productImages'] =
          this.productImages.map((v) => v.toJson()).toList();
    }
    if (this.productVariants != null) {
      data['productVariants'] =
          this.productVariants.map((v) => v.toJson()).toList();
    }
    if (this.productCategories != null) {
      data['productCategories'] =
          this.productCategories.map((v) => v.toJson()).toList();
    }
    if (this.productFeatures != null) {
      data['productFeatures'] =
          this.productFeatures.map((v) => v.toJson()).toList();
    }
    if (this.productReviews != null) {
      data['productReviews'] =
          this.productReviews.map((v) => v.toJson()).toList();
    }
    if (this.brandId != null) {
      data['brandId'] = this.brandId.toJson();
    }
    if (this.storeId != null) {
      data['storeId'] = this.storeId.toJson();
    }
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    data['productType'] = this.productType;
    data['id'] = this.id;
    return data;
  }
}

class ProductImages {
  int position;
  String imageUrl;
  int id;

  ProductImages({this.position, this.imageUrl, this.id});

  ProductImages.fromJson(Map<String, dynamic> json) {
    position = json['position'];
    imageUrl = json['imageUrl'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['position'] = this.position;
    data['imageUrl'] = this.imageUrl;
    data['id'] = this.id;
    return data;
  }
}

class ProductVariants {
  String description;
  dynamic price;
  String name;
  String sku;

  ProductVariants({this.description, this.price, this.name, this.sku});

  ProductVariants.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    price = json['price'];
    name = json['name'];
    sku = json['sku'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['price'] = this.price;
    data['name'] = this.name;
    data['sku'] = this.sku;
    return data;
  }
}

class ProductCategories {
  String name;
  String translatedName;
  bool visible;
  bool isFeatured;
  List<ProductCategoryImages> productCategoryImages;
  ProductCategories parentCategoryId;
  List<SubCategories> subCategories;
  int id;

  ProductCategories(
      {this.name,
      this.translatedName,
      this.visible,
      this.isFeatured,
      this.productCategoryImages,
      this.parentCategoryId,
      this.subCategories,
      this.id});

  ProductCategories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    translatedName = json['translatedName'];
    visible = json['visible'];
    isFeatured = json['isFeatured'];
    if (json['productCategoryImages'] != null) {
      productCategoryImages = new List<ProductCategoryImages>();
      json['productCategoryImages'].forEach((v) {
        productCategoryImages.add(new ProductCategoryImages.fromJson(v));
      });
    }
    parentCategoryId = json['parentCategoryId'] != null
        ? new ProductCategories.fromJson(json['parentCategoryId'])
        : null;
    if (json['subCategories'] != null) {
      subCategories = new List<SubCategories>();
      json['subCategories'].forEach((v) {
        subCategories.add(new SubCategories.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['translatedName'] = this.translatedName;
    data['visible'] = this.visible;
    data['isFeatured'] = this.isFeatured;
    if (this.productCategoryImages != null) {
      data['productCategoryImages'] =
          this.productCategoryImages.map((v) => v.toJson()).toList();
    }
    if (this.parentCategoryId != null) {
      data['parentCategoryId'] = this.parentCategoryId.toJson();
    }
    if (this.subCategories != null) {
      data['subCategories'] =
          this.subCategories.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    return data;
  }
}

class ParentCategoryId {
  String name;
  String translatedName;
  bool visible;
  bool isFeatured;
  List<ProductCategoryImages> productCategoryImages;
  dynamic parentCategoryId;
  List<SubCategories> subCategories;
  int id;

  ParentCategoryId(
      {this.name,
      this.translatedName,
      this.visible,
      this.isFeatured,
      this.productCategoryImages,
      this.parentCategoryId,
      this.subCategories,
      this.id});

  ParentCategoryId.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    translatedName = json['translatedName'];
    visible = json['visible'];
    isFeatured = json['isFeatured'];
    if (json['productCategoryImages'] != null) {
      productCategoryImages = new List<ProductCategoryImages>();
      json['productCategoryImages'].forEach((v) {
        productCategoryImages.add(new ProductCategoryImages.fromJson(v));
      });
    }
    parentCategoryId = json['parentCategoryId'];
    if (json['subCategories'] != null) {
      subCategories = new List<SubCategories>();
      json['subCategories'].forEach((v) {
        subCategories.add(new SubCategories.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['translatedName'] = this.translatedName;
    data['visible'] = this.visible;
    data['isFeatured'] = this.isFeatured;
    if (this.productCategoryImages != null) {
      data['productCategoryImages'] =
          this.productCategoryImages.map((v) => v.toJson()).toList();
    }
    data['parentCategoryId'] = this.parentCategoryId;
    if (this.subCategories != null) {
      data['subCategories'] =
          this.subCategories.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    return data;
  }
}

class SubCategories {
  String name;
  String translatedName;
  bool visible;
  bool isFeatured;
  List<ProductCategoryImages> productCategoryImages;
  int id;

  SubCategories(
      {this.name,
      this.translatedName,
      this.visible,
      this.isFeatured,
      this.productCategoryImages,
      this.id});

  SubCategories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    translatedName = json['translatedName'];
    visible = json['visible'];
    isFeatured = json['isFeatured'];
    if (json['productCategoryImages'] != null) {
      productCategoryImages = new List<ProductCategoryImages>();
      json['productCategoryImages'].forEach((v) {
        productCategoryImages.add(new ProductCategoryImages.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['translatedName'] = this.translatedName;
    data['visible'] = this.visible;
    data['isFeatured'] = this.isFeatured;
    if (this.productCategoryImages != null) {
      data['productCategoryImages'] =
          this.productCategoryImages.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    return data;
  }
}

class ProductFeatures {
  FeatureId featureId;
  String value;
  int id;

  ProductFeatures({this.featureId, this.value, this.id});

  ProductFeatures.fromJson(Map<String, dynamic> json) {
    featureId = json['featureId'] != null
        ? new FeatureId.fromJson(json['featureId'])
        : null;
    value = json['value'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.featureId != null) {
      data['featureId'] = this.featureId.toJson();
    }
    data['value'] = this.value;
    data['id'] = this.id;
    return data;
  }
}

class FeatureId {
  dynamic description;
  String name;
  String featureType;
  int id;

  FeatureId({this.description, this.name, this.featureType, this.id});

  FeatureId.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    name = json['name'];
    featureType = json['featureType'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['name'] = this.name;
    data['featureType'] = this.featureType;
    data['id'] = this.id;
    return data;
  }
}

class ProductReviews {
  int id;
  String dateGiven;
  dynamic rating;
  String comment;
  String title;

  ProductReviews(
      {this.id, this.dateGiven, this.rating, this.comment, this.title});

  ProductReviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateGiven = json['dateGiven'];
    rating = json['rating'];
    comment = json['comment'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateGiven'] = this.dateGiven;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    data['title'] = this.title;
    return data;
  }
}

class BrandId {
  int id;
  String name;
  dynamic description;

  BrandId({this.id, this.name, this.description});

  BrandId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}

class StoreId {
  int id;
  String name;
  dynamic description;
  dynamic address1;
  dynamic address2;
  dynamic city;
  dynamic state;
  dynamic logo;
  SellerId sellerId;

  StoreId(
      {this.id,
      this.name,
      this.description,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.logo,
      this.sellerId});

  StoreId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    address1 = json['address1'];
    address2 = json['address2'];
    city = json['city'];
    state = json['state'];
    logo = json['logo'];
    sellerId = json['sellerId'] != null
        ? new SellerId.fromJson(json['sellerId'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['logo'] = this.logo;
    if (this.sellerId != null) {
      data['sellerId'] = this.sellerId.toJson();
    }
    return data;
  }
}

class SellerId {
  int id;
  dynamic loyaltyNo;
  dynamic loyaltyPoint;
  String mobileNo;
  dynamic workphoneNo;
  String email;
  String name;
  dynamic referralCode;
  dynamic address;
  String city;
  String state;
  dynamic zipCode;
  String country;
  dynamic walletBalance;
  dynamic creditLimit;
  dynamic creditSpent;
  dynamic vendorCode;
  dynamic dateRegistered;
  dynamic lastActivity;

  SellerId(
      {this.id,
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
      this.lastActivity});

  SellerId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    loyaltyNo = json['loyaltyNo'];
    loyaltyPoint = json['loyaltyPoint'];
    mobileNo = json['mobileNo'];
    workphoneNo = json['workphoneNo'];
    email = json['email'];
    name = json['name'];
    referralCode = json['referralCode'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zipCode'];
    country = json['country'];
    walletBalance = json['walletBalance'];
    creditLimit = json['creditLimit'];
    creditSpent = json['creditSpent'];
    vendorCode = json['vendorCode'];
    dateRegistered = json['dateRegistered'];
    lastActivity = json['lastActivity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['loyaltyNo'] = this.loyaltyNo;
    data['loyaltyPoint'] = this.loyaltyPoint;
    data['mobileNo'] = this.mobileNo;
    data['workphoneNo'] = this.workphoneNo;
    data['email'] = this.email;
    data['name'] = this.name;
    data['referralCode'] = this.referralCode;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zipCode'] = this.zipCode;
    data['country'] = this.country;
    data['walletBalance'] = this.walletBalance;
    data['creditLimit'] = this.creditLimit;
    data['creditSpent'] = this.creditSpent;
    data['vendorCode'] = this.vendorCode;
    data['dateRegistered'] = this.dateRegistered;
    data['lastActivity'] = this.lastActivity;
    return data;
  }
}

class Tags {
  String name;
  int id;

  Tags({this.name, this.id});

  Tags.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}

class PopularCategories {
  List<Object> object;
  dynamic errorMsg;
  dynamic expiryDate;
  String timestamp;
  dynamic errorCode;
  String status;

  PopularCategories(
      {this.object,
      this.errorMsg,
      this.expiryDate,
      this.timestamp,
      this.errorCode,
      this.status});

  PopularCategories.fromJson(Map<String, dynamic> json) {
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

class Object {
  ProductCategory productCategory;

  Object({this.productCategory});

  Object.fromJson(Map<String, dynamic> json) {
    productCategory = json['productCategory'] != null
        ? new ProductCategory.fromJson(json['productCategory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productCategory != null) {
      data['productCategory'] = this.productCategory.toJson();
    }
    return data;
  }
}

class ProductCategory {
  String name;
  String translatedName;
  bool visible;
  bool isFeatured;
  List<ProductCategoryImages> productCategoryImages;
  ProductCategory parentCategoryId;
  List<SubCategories> subCategories;
  int id;

  ProductCategory(
      {this.name,
      this.translatedName,
      this.visible,
      this.isFeatured,
      this.productCategoryImages,
      this.parentCategoryId,
      this.subCategories,
      this.id});

  ProductCategory.fromJson(Map<String, dynamic> json) {
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
        ? new ProductCategory.fromJson(json['parentCategoryId'])
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

class ProductCategoryImages {
  int position;
  String imageUrl;
  int id;

  ProductCategoryImages({this.position, this.imageUrl, this.id});

  ProductCategoryImages.fromJson(Map<String, dynamic> json) {
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

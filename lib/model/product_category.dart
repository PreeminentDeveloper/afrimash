// class ProductCategory {
//   Object object;
//   Null errorMsg;
//   Null expiryDate;
//   String timestamp;
//   Null errorCode;
//   String status;

//   ProductCategory(
//       {this.object,
//       this.errorMsg,
//       this.expiryDate,
//       this.timestamp,
//       this.errorCode,
//       this.status});

//   ProductCategory.fromJson(Map<String, dynamic> json) {
//     object =
//         json['object'] != null ? new Object.fromJson(json['object']) : null;
//     errorMsg = json['errorMsg'];
//     expiryDate = json['expiryDate'];
//     timestamp = json['timestamp'];
//     errorCode = json['errorCode'];
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.object != null) {
//       data['object'] = this.object.toJson();
//     }
//     data['errorMsg'] = this.errorMsg;
//     data['expiryDate'] = this.expiryDate;
//     data['timestamp'] = this.timestamp;
//     data['errorCode'] = this.errorCode;
//     data['status'] = this.status;
//     return data;
//   }
// }

// class Object {
//   String name;
//   String translatedName;
//   bool visible;
//   bool isFeatured;
//   List<Null> productCategoryImages;
//   ParentCategoryId parentCategoryId;
//   List<Null> subCategories;
//   int id;

//   Object(
//       {this.name,
//       this.translatedName,
//       this.visible,
//       this.isFeatured,
//       this.productCategoryImages,
//       this.parentCategoryId,
//       this.subCategories,
//       this.id});

//   Object.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     translatedName = json['translatedName'];
//     visible = json['visible'];
//     isFeatured = json['isFeatured'];
//     if (json['productCategoryImages'] != null) {
//       productCategoryImages = new List<Null>();
//       json['productCategoryImages'].forEach((v) {
//         productCategoryImages.add(new Null.fromJson(v));
//       });
//     }
//     parentCategoryId = json['parentCategoryId'] != null
//         ? new ParentCategoryId.fromJson(json['parentCategoryId'])
//         : null;
//     if (json['subCategories'] != null) {
//       subCategories = new List<Null>();
//       json['subCategories'].forEach((v) {
//         subCategories.add(new Null.fromJson(v));
//       });
//     }
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['translatedName'] = this.translatedName;
//     data['visible'] = this.visible;
//     data['isFeatured'] = this.isFeatured;
//     if (this.productCategoryImages != null) {
//       data['productCategoryImages'] =
//           this.productCategoryImages.map((v) => v.toJson()).toList();
//     }
//     if (this.parentCategoryId != null) {
//       data['parentCategoryId'] = this.parentCategoryId.toJson();
//     }
//     if (this.subCategories != null) {
//       data['subCategories'] =
//           this.subCategories.map((v) => v.toJson()).toList();
//     }
//     data['id'] = this.id;
//     return data;
//   }
// }

// class ParentCategoryId {
//   String name;
//   String translatedName;
//   bool visible;
//   bool isFeatured;
//   List<Null> productCategoryImages;
//   Null parentCategoryId;
//   List<SubCategories> subCategories;
//   int id;

//   ParentCategoryId(
//       {this.name,
//       this.translatedName,
//       this.visible,
//       this.isFeatured,
//       this.productCategoryImages,
//       this.parentCategoryId,
//       this.subCategories,
//       this.id});

//   ParentCategoryId.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     translatedName = json['translatedName'];
//     visible = json['visible'];
//     isFeatured = json['isFeatured'];
//     if (json['productCategoryImages'] != null) {
//       productCategoryImages = new List<Null>();
//       json['productCategoryImages'].forEach((v) {
//         productCategoryImages.add(new Null.fromJson(v));
//       });
//     }
//     parentCategoryId = json['parentCategoryId'];
//     if (json['subCategories'] != null) {
//       subCategories = new List<SubCategories>();
//       json['subCategories'].forEach((v) {
//         subCategories.add(new SubCategories.fromJson(v));
//       });
//     }
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['translatedName'] = this.translatedName;
//     data['visible'] = this.visible;
//     data['isFeatured'] = this.isFeatured;
//     if (this.productCategoryImages != null) {
//       data['productCategoryImages'] =
//           this.productCategoryImages.map((v) => v.toJson()).toList();
//     }
//     data['parentCategoryId'] = this.parentCategoryId;
//     if (this.subCategories != null) {
//       data['subCategories'] =
//           this.subCategories.map((v) => v.toJson()).toList();
//     }
//     data['id'] = this.id;
//     return data;
//   }
// }

// class SubCategories {
//   String name;
//   String translatedName;
//   bool visible;
//   bool isFeatured;
//   List<Null> productCategoryImages;
//   int id;

//   SubCategories(
//       {this.name,
//       this.translatedName,
//       this.visible,
//       this.isFeatured,
//       this.productCategoryImages,
//       this.id});

//   SubCategories.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     translatedName = json['translatedName'];
//     visible = json['visible'];
//     isFeatured = json['isFeatured'];
//     if (json['productCategoryImages'] != null) {
//       productCategoryImages = new List<Null>();
//       json['productCategoryImages'].forEach((v) {
//         productCategoryImages.add(new Null.fromJson(v));
//       });
//     }
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['translatedName'] = this.translatedName;
//     data['visible'] = this.visible;
//     data['isFeatured'] = this.isFeatured;
//     if (this.productCategoryImages != null) {
//       data['productCategoryImages'] =
//           this.productCategoryImages.map((v) => v.toJson()).toList();
//     }
//     data['id'] = this.id;
//     return data;
//   }
// }

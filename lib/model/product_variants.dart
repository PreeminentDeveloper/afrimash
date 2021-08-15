// To parse this JSON data, do
//
//     final productVariants = productVariantsFromJson(jsonString);

import 'dart:convert';

ProductVariants productVariantsFromJson(String str) =>
    ProductVariants.fromJson(json.decode(str));

String productVariantsToJson(ProductVariants data) =>
    json.encode(data.toJson());

class ProductVariants {
  ProductVariants({
    this.object,
    this.errorMsg,
    this.expiryDate,
    this.timestamp,
    this.errorCode,
    this.status,
  });

  Object object;
  dynamic errorMsg;
  dynamic expiryDate;
  DateTime timestamp;
  dynamic errorCode;
  String status;

  factory ProductVariants.fromJson(Map<String, dynamic> json) =>
      ProductVariants(
        object: Object.fromJson(json["object"]),
        errorMsg: json["errorMsg"],
        expiryDate: json["expiryDate"],
        timestamp: DateTime.parse(json["timestamp"]),
        errorCode: json["errorCode"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "object": object.toJson(),
        "errorMsg": errorMsg,
        "expiryDate": expiryDate,
        "timestamp": timestamp.toIso8601String(),
        "errorCode": errorCode,
        "status": status,
      };
}

class Object {
  Object({
    this.content,
    this.pageable,
    this.totalElements,
    this.last,
    this.totalPages,
    this.sort,
    this.numberOfElements,
    this.first,
    this.size,
    this.number,
    this.empty,
  });

  List<Content> content;
  Pageable pageable;
  int totalElements;
  bool last;
  int totalPages;
  Sort sort;
  int numberOfElements;
  bool first;
  int size;
  int number;
  bool empty;

  factory Object.fromJson(Map<String, dynamic> json) => Object(
        content:
            List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
        pageable: Pageable.fromJson(json["pageable"]),
        totalElements: json["totalElements"],
        last: json["last"],
        totalPages: json["totalPages"],
        sort: Sort.fromJson(json["sort"]),
        numberOfElements: json["numberOfElements"],
        first: json["first"],
        size: json["size"],
        number: json["number"],
        empty: json["empty"],
      );

  Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
        "pageable": pageable.toJson(),
        "totalElements": totalElements,
        "last": last,
        "totalPages": totalPages,
        "sort": sort.toJson(),
        "numberOfElements": numberOfElements,
        "first": first,
        "size": size,
        "number": number,
        "empty": empty,
      };
}

class Content {
  Content({
    this.description,
    this.price,
    this.name,
    this.sku,
  });

  String description;
  int price;
  String name;
  String sku;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        description: json["description"],
        price: json["price"],
        name: json["name"],
        sku: json["sku"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "price": price,
        "name": name,
        "sku": sku,
      };
}

class Pageable {
  Pageable({
    this.sort,
    this.pageNumber,
    this.pageSize,
    this.offset,
    this.paged,
    this.unpaged,
  });

  Sort sort;
  int pageNumber;
  int pageSize;
  int offset;
  bool paged;
  bool unpaged;

  factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
        sort: Sort.fromJson(json["sort"]),
        pageNumber: json["pageNumber"],
        pageSize: json["pageSize"],
        offset: json["offset"],
        paged: json["paged"],
        unpaged: json["unpaged"],
      );

  Map<String, dynamic> toJson() => {
        "sort": sort.toJson(),
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "offset": offset,
        "paged": paged,
        "unpaged": unpaged,
      };
}

class Sort {
  Sort({
    this.sorted,
    this.unsorted,
    this.empty,
  });

  bool sorted;
  bool unsorted;
  bool empty;

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
        sorted: json["sorted"],
        unsorted: json["unsorted"],
        empty: json["empty"],
      );

  Map<String, dynamic> toJson() => {
        "sorted": sorted,
        "unsorted": unsorted,
        "empty": empty,
      };
}

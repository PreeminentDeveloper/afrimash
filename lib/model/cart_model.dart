class CartModel {
  int productId;
  String name;
  String image;
  double itemPrice;
  int itemQuantity;

  CartModel(
      {this.productId,
      this.name,
      this.image,
      this.itemPrice,
      this.itemQuantity});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
      productId: json['productId'],
      name: json["name"],
      image: json['image'],
      itemPrice: json['itemPrice'],
      itemQuantity: json['itemQuantity']);

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "name": name,
        "image": image,
        "itemPrice": itemPrice,
        "itemQuantity": itemQuantity,
      };
}

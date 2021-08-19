import 'package:afrimash/components/cartFloatingButton.dart';
import 'package:afrimash/model/trending_products.dart';
import 'package:afrimash/screens/products/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../common/config/constants.dart';
import 'product_single.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductListing extends StatefulWidget {
  final List<Product> products;
  ProductListing(this.products);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductListingState();
  }
}

class ProductListingState extends State<ProductListing> {
  int cartLength = 0;
  SharedPreferences prefs;
  bool loading = false;

  initState() {
    super.initState();
    getCartLength();
  }

  getCartLength() async {
    setState(() => loading = true);
    prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('cartLength')) {
      cartLength = prefs.getInt('cartLength');
    } else {
      cartLength = 0;
    }
    setState(() => loading = false);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.close, color: Colors.white)),
            backgroundColor: Constants.primaryColor,
            elevation: 0,
            title: Text('Products', style: TextStyle(color: Colors.white))),
        endDrawer: Drawer(child: Center(child: Text('Filter here'))),
        body: Stack(children: [
          Container(
              color: Constants.primaryColor,
              padding: EdgeInsets.only(top: 20),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(20),
                        topRight: const Radius.circular(20)),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 10,
                          mainAxisExtent:
                              MediaQuery.of(context).size.height * 0.48,
                          crossAxisSpacing: 10,
                          crossAxisCount: 2),
                      itemCount: widget.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductSingle(
                                          data: widget.products[index])));
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.28,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(widget
                                                        .products[index]
                                                        .productImages
                                                        .isEmpty
                                                    ? "https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg"
                                                    : widget
                                                        .products[index]
                                                        .productImages[0]
                                                        .imageUrl))),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[200]
                                                        .withOpacity(0.8),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                padding: EdgeInsets.all(5),
                                                child: Icon(
                                                    Icons
                                                        .favorite_outline_rounded,
                                                    size: 20,
                                                    color: Colors.grey))
                                          ],
                                        )),
                                    SizedBox(height: 10),
                                    Text('${widget.products[index].name}',
                                        style: Constants.productTitle),
                                    SizedBox(height: 3),
                                    Container(
                                        child: Row(children: [
                                      Text('₦${widget.products[index].price}',
                                          style: Constants.singleProductPrice),
                                      Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                              '₦${widget.products[index].price}',
                                              style: Constants
                                                  .singleProductPriceStrike)),
                                    ])),
                                    SizedBox(height: 10),
                                    Container(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            child: RatingBarComponent()),
                                        Icon(Icons.add_shopping_cart, size: 17)
                                      ],
                                    ))
                                    // Text('₦${widget.products[index]['price']}',
                                    //     style: Constants.productPrice)
                                  ],
                                )));
                      }))),
          Positioned(
              bottom: 0,
              right: 0,
              child: CartButton(
                itemCount: cartLength,
                //cartList == null
                //     ? 0
                //     : cartList.length > 0
                //         ? cartList.length
                //         : 0,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScren())),
              ))
        ]));
  }
}

class RatingBarComponent extends StatelessWidget {
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 10,
      itemPadding: EdgeInsets.symmetric(horizontal: 0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}

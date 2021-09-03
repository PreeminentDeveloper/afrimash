import 'dart:convert';

import 'package:afrimash/common/UI/sbutton.dart';
import 'package:afrimash/common/config/constants.dart';
import 'package:afrimash/components/cartFloatingButton.dart';
import 'package:afrimash/model/cart_model.dart';
import 'package:afrimash/model/main_app_provider.dart';
import 'package:afrimash/model/trending_products.dart';
import 'package:afrimash/screens/products/cart.dart';
import 'package:afrimash/screens/products/product_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:inspireui/widgets/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transparent_image/transparent_image.dart';
// import 'package:get/get.dart';

class ProductSingle extends StatefulWidget {
  final Product data;
  MainAppProvider mainAppProvider;

  @override
  ProductSingle({this.data, this.mainAppProvider});
  ProductSingleState createState() => ProductSingleState();
}

class ProductSingleState extends State<ProductSingle> {
  final TextEditingController _quantityController = TextEditingController();
  int tabIndex = 0;
  int cartLength = 0;
  SharedPreferences prefs;
  bool loading = false;
  double itemPrice;

  initState() {
    _quantityController.text = "1";
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

  increaseQuantity() {
    var quantity = num.parse(_quantityController.text);
    // itemPrice = widget.data.price;
    // print(itemPrice);
    if (quantity < 10) {
      quantity++;
      _quantityController.text = quantity.toString();
      // setState(() {
      //   itemPrice = quantity * itemPrice;
      //   print(itemPrice);
      // });
    }
  }

  decreaseQuantity() {
    var quantity = num.parse(_quantityController.text);
    // itemPrice = widget.data.price;
    // print(itemPrice);
    if (quantity > 0) {
      quantity--;
      _quantityController.text = quantity.toString();
      // setState(() {
      //   itemPrice = quantity * itemPrice;
      //   print(itemPrice);
      // });
    }
  }

  addItemToCart() async {
    prefs = await SharedPreferences.getInstance();
    List<dynamic> stringList = [];

    bool keyExist = prefs.containsKey('item');

    if (keyExist == false) {
      print("Length of List: ${stringList.length}");
      List<dynamic> stringListTemp = [];
      int quantity = int.parse(_quantityController.text);
      var selectedItem = CartModel(
          productId: widget.data.id,
          name: widget.data.name,
          image: widget.data.productImages.isEmpty
              ? "https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg"
              : widget.data.productImages[0].imageUrl,
          itemPrice: widget.data.price,
          itemQuantity: quantity);
      // print(itemPrice);
      stringListTemp.add(selectedItem);
      prefs.setString('item', json.encode(stringListTemp));
      setState(() {
        stringList = json.decode(prefs.getString('item'));
        print(stringList);
        cartLength = stringList.length;
        prefs.setInt("cartLength", cartLength);
        var totalPrice = stringList
            .where((item) => item['itemPrice'] == item['itemPrice'])
            .fold(0.0, (sum, item) => sum + item['itemPrice']);
        prefs.setDouble("totalPrice", totalPrice);
      });
    } else {
      print("Next phase");
      List<dynamic> stringListTemp = json.decode(prefs.getString('item'));
      int quantity = int.parse(_quantityController.text);

      var selectedItem = CartModel(
          productId: widget.data.id,
          name: widget.data.name,
          image: widget.data.productImages.isEmpty
              ? "https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg"
              : widget.data.productImages[0].imageUrl,
          itemPrice: widget.data.price,
          itemQuantity: quantity);
      int getID = selectedItem.productId;
      // print(itemPrice);
      print("Get ID: $getID");
      var checkID =
          stringListTemp.indexWhere((element) => element["productId"] == getID);
      print("Check ID: $checkID");
      print("StringListTemp: $stringListTemp");
      if (checkID == -1) {
        stringListTemp.add(selectedItem);
        prefs.setString('item', json.encode(stringListTemp));
        setState(() {
          stringList = json.decode(prefs.getString('item'));
          print(stringList);
          cartLength = stringList.length;
          prefs.setInt("cartLength", cartLength);
          var totalPrice = stringList
              .where((item) => item['itemPrice'] == item['itemPrice'])
              .fold(0.0, (sum, item) => sum + item['itemPrice']);
          prefs.setDouble("totalPrice", totalPrice);
        });
      }
    }
  }

  Widget buildQuantityControl() {
    return Container(
        // width: MediaQuery.of(context).size.width * 0.5,
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      GestureDetector(
          onTap: () {
            decreaseQuantity();
          },
          child: Icon(Icons.keyboard_arrow_left,
              size: 30, color: Color(0xff666666))),
      Container(
          height: 35,
          width: MediaQuery.of(context).size.width * 0.15,
          child: TextFormField(
            enabled: false,
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xff666666)),
            onChanged: (value) {
              if (num.parse(value) > 10) {
                _quantityController.text = '10';
              }
            },
            controller: _quantityController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              // contentPadding: EdgeInsets.fromLTRB(25, 20, 20, 20),
              hintStyle: TextStyle(color: Colors.black),
              isDense: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide:
                    BorderSide(color: Color(0xffaaaaaa).withOpacity(0.4)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide:
                    BorderSide(color: Color(0xffaaaaaa).withOpacity(0.4)),
              ),
              // errorText: 'Amount is required'
            ),
          )),
      GestureDetector(
          onTap: () {
            increaseQuantity();
          },
          child: Icon(Icons.keyboard_arrow_right,
              size: 30, color: Color(0xff666666))),
    ]));
  }

  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      leading: IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                            // Get.to(ProductView());
                          }),
                      expandedHeight: 220.0,
                      floating: true,
                      pinned: true,
                      snap: true,
                      elevation: 50,
                      // backgroundColor: Color(0xff00854e),
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${widget.data.name}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0,
                              )),
                        ),
                        background: Image.network(
                            // "${widget.data.productImages[0].imageUrl}",
                            widget.data.productImages.isEmpty
                                ? "https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg"
                                : widget.data.productImages[0].imageUrl,
                            fit: BoxFit.cover,
                            color: Color.fromRGBO(255, 255, 255, 0.5),
                            colorBlendMode: BlendMode.modulate),
                      ),
                    ),
                    new SliverList(
                        delegate: new SliverChildListDelegate([
                      // ProductImages("${widget.data.productImages[0].imageUrl}"),

                      Container(
                        height: 90,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 5),
                                  child: Column(
                                    children: [
                                      // image
                                      Container(
                                        width: 50,
                                        height: 80,
                                        // decoration: BoxDecoration(
                                        //     // borderRadius: BorderRadius.circular(50),
                                        //     image: DecorationImage(
                                        //         image: NetworkImage(
                                        //             "${widget.data.productImages[0].imageUrl}"),
                                        //         fit: BoxFit.cover)),
                                        child: FadeInImage.memoryNetwork(
                                            placeholder: kTransparentImage,
                                            fit: BoxFit.cover,
                                            image: widget
                                                    .data.productImages.isEmpty
                                                ? "https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg"
                                                : widget.data.productImages[0]
                                                    .imageUrl),
                                      ),
                                    ],
                                  ));
                            }),
                      ),

                      Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  child: Text('${widget.data.name}',
                                      style: Constants.singleProductTitle)),
                              SizedBox(height: 5),
                              Container(
                                  child: Row(children: [
                                Text('₦${widget.data.price}',
                                    style: Constants.singleProductPrice),
                                Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text('₦${widget.data.price}',
                                        style: Constants
                                            .singleProductPriceStrike)),
                              ])),
                              SizedBox(height: 10),
                              RatingBarComponent(),
                              SizedBox(height: 30),
                              Container(
                                height: 8,
                                decoration: BoxDecoration(
                                  color: Color(0xffaaaaaa).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: MediaQuery.of(context).size.width,
                              ),
                              SizedBox(height: 30),
                              Container(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Select quantity',
                                      style: TextStyle(
                                          color: Color(0xff666666),
                                          fontSize: 15)),
                                  buildQuantityControl(),
                                ],
                              )),
                              // add to cart
                              SizedBox(height: 25),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Sbutton(
                                      icon: Padding(
                                        padding: EdgeInsets.only(right: 15),
                                        child: Icon(Icons.shopping_cart,
                                            color: Colors.black),
                                      ),
                                      title: 'ADD TO CART',
                                      onPressed: () {
                                        addItemToCart();

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => CartScren(
                                                    data: widget.data)));
                                      })),

                              // SizedBox(height: 15),
                              // // description
                              // DefaultTabController(
                              //   length: 2,
                              //   child: Container(
                              //       height: MediaQuery.of(context).size.height *
                              //           0.3,
                              //       child: Column(
                              //         children: <Widget>[
                              //           Container(
                              //             constraints:
                              //                 BoxConstraints(maxHeight: 150.0),
                              //             child: Material(
                              //               color: Colors.transparent,
                              //               child: Container(
                              //                 color: Colors.transparent,
                              //                 child: TabBar(
                              //                   labelPadding: EdgeInsets.zero,
                              //                   indicatorPadding:
                              //                       EdgeInsets.zero,
                              //                   indicator: BoxDecoration(
                              //                     border: Border(
                              //                         bottom: BorderSide(
                              //                             color: Color(
                              //                                 0xff00854e))),
                              //                     color: Colors.transparent,
                              //                   ),
                              //                   onTap: (int data) {
                              //                     setState(() {
                              //                       tabIndex = data;
                              //                     });
                              //                   },
                              //                   tabs: [
                              //                     Tab(
                              //                       child: Container(
                              //                         margin: EdgeInsets.only(
                              //                             right: 2.5),
                              //                         decoration: BoxDecoration(
                              //                           borderRadius:
                              //                               BorderRadius
                              //                                   .circular(50),
                              //                           // color: tabIndex == 0
                              //                           //     ? Constants.primaryColor
                              //                           //     : CustomColors.WhiteSmoke
                              //                         ),
                              //                         child: Align(
                              //                           alignment:
                              //                               Alignment.center,
                              //                           child: Text(
                              //                             "Description",
                              //                             style: TextStyle(
                              //                                 color: tabIndex ==
                              //                                         0
                              //                                     ? Constants
                              //                                         .primaryColor
                              //                                     : Constants
                              //                                         .inactiveColor,
                              //                                 fontWeight:
                              //                                     FontWeight
                              //                                         .w400),
                              //                           ),
                              //                         ),
                              //                       ),
                              //                     ),
                              //                     Tab(
                              //                       child: Container(
                              //                         margin: EdgeInsets.only(
                              //                             left: 2.5),
                              //                         decoration: BoxDecoration(
                              //                           borderRadius:
                              //                               BorderRadius.circular(
                              //                                   50), // Creates border
                              //                           // color: tabIndex == 1
                              //                           //     ? CustomColors.primaryColor4
                              //                           //     : CustomColors.WhiteSmoke
                              //                         ),
                              //                         child: Align(
                              //                           alignment:
                              //                               Alignment.center,
                              //                           child: Text("Review",
                              //                               style: TextStyle(
                              //                                   color: tabIndex ==
                              //                                           1
                              //                                       ? Constants
                              //                                           .primaryColor
                              //                                       : Constants
                              //                                           .inactiveColor,
                              //                                   fontWeight:
                              //                                       FontWeight
                              //                                           .w400)),
                              //                         ),
                              //                       ),
                              //                     ),
                              //                   ],
                              //                 ),
                              //               ),
                              //             ),
                              //           ),
                              //           SizedBox(height: 20),
                              //           Expanded(
                              //             child: TabBarView(
                              //               // physics: NeverScrollableScrollPhysics(),
                              //               children: [
                              //                 SingleChildScrollView(
                              //                     child: Description(
                              //                         "${widget.data.description}")),
                              //                 SingleChildScrollView(
                              //                     child: Column(children: [
                              //                   Align(
                              //                       alignment:
                              //                           Alignment.centerLeft,
                              //                       child: TextButton.icon(
                              //                           onPressed: () {},
                              //                           icon: Icon(Icons.edit,
                              //                               color: Constants
                              //                                   .primaryColor,
                              //                               size: 15),
                              //                           label: Text(
                              //                               'Write a review',
                              //                               style: TextStyle(
                              //                                   color: Constants
                              //                                       .primaryColor)))),
                              //                   Reviews()
                              //                 ])),
                              //               ],
                              //             ),
                              //           ),
                              //         ],
                              //       )),
                              // ),
                            ],
                          ))
                    ])),
                  ],
                ),
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
              ],
            ));
  }
}

class ProductImages extends StatelessWidget {
  String data;
  ProductImages(this.data);
  productImages() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
        child: Column(
          children: [
            // image
            Container(
              width: 50,
              height: 80,
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                      image: AssetImage("$data"), fit: BoxFit.cover)),
            ),
          ],
        ));
  }

  Widget build(BuildContext context) {
    return Container(
        height: 90,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            productImages(),
            productImages(),
            productImages(),
          ],
        ));
  }
}

class Description extends StatelessWidget {
  String description;
  Description(this.description);
  Widget build(BuildContext context) {
    return Container(
      child: Text(description),
    );
  }
}

class Reviews extends StatelessWidget {
  final List reviews = [
    {
      "title": "Great product keep it up",
      "subtitle":
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit.Aliquam suscipit.""",
      "time": "1 days ago",
    },
    {
      "title": "I love it",
      "subtitle":
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit.Aliquam suscipit.""",
      "time": "5 days ago",
    }
  ];

  Widget build(BuildContext context) {
    return Container(
        // height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
            children: reviews.map((review) {
      return Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xffaaaaaa).withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: ListTile(
              title: Text('${review['title']}'),
              subtitle: Text('${review['subtitle']}'),
              trailing: Text('${review['time']}',
                  style: TextStyle(color: Constants.secondaryColor))));
    }).toList())

        // ListView.builder(
        //   itemCount: reviews.length,
        //   itemBuilder: ((BuildContext context, index) {
        //     return ListTile(
        //         title: Text('${reviews[index]['title']}'),
        //         subtitle: Text('${reviews[index]['subtitle']}'),
        //         trailing: Text('${reviews[index]['time']}'));
        //   }),
        // )
        );
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
      itemSize: 15,
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

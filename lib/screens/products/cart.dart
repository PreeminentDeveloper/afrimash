import 'dart:convert';

import 'package:afrimash/common/config/constants.dart';
import 'package:afrimash/helper/theme.dart';
import 'package:afrimash/model/trending_products.dart';
import 'package:afrimash/screens/Orders/checkout/checkout.dart';
import 'package:afrimash/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:inspireui/widgets/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:afrimash/screens/auth/login.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScren extends StatefulWidget {
  final Product data;
  CartScren({this.data});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CartScreenState();
  }
}

class CartScreenState extends State<CartScren> {
  // final TextEditingController _quantityController = TextEditingController();
  List<dynamic> cartList;
  bool loading = false;
  bool check = false;
  SharedPreferences prefs;
  double totalPrice = 0.0;
  double itemPrice;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addItemToCart();
  }

  addItemToCart() async {
    setState(() => loading = true);
    prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('item')) {
      cartList = json.decode(prefs.getString('item'));
      totalPrice = prefs.getDouble("totalPrice");
    } else {
      cartList = null;
    }
    setState(() => loading = false);
  }

  // increaseQuantity() {
  //   var quantity = num.parse(_quantityController.text);
  //   if (quantity < 10) {
  //     quantity++;
  //     _quantityController.text = quantity.toString();
  //   }
  // }

  // decreaseQuantity() {
  //   var quantity = num.parse(_quantityController.text);
  //   if (quantity > 0) {
  //     quantity--;
  //     _quantityController.text = quantity.toString();
  //   }
  // }

  Widget totalWidget({index, quantity}) {
    setState(() {
      loading = true;
      // totalPrice = quantity * itemPrice;
      quantity = quantity;
      loading = false;
    });
    return Text(
        // '${cartList.map((e) => e['price'] * cartList.length ?? 0)}',
        totalPrice == null ? null : "$totalPrice",
        style: Constants.cartTotalPrice);
  }

  Widget buildQuantityControl(index, quantity) {
    final TextEditingController _quantityController = TextEditingController();
    _quantityController.text = "$quantity";
    itemPrice = cartList[index]['itemPrice'];
    return Container(
        // width: MediaQuery.of(context).size.width * 0.5,
        child: Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
          GestureDetector(
              onTap: () {
                var quantity = num.parse(_quantityController.text);
                if (quantity > 0) {
                  quantity--;
                  _quantityController.text = quantity.toString();
                }
                // decreaseQuantity();
              },
              child: Icon(Icons.keyboard_arrow_left,
                  size: 22, color: Color(0xff666666))),
          Container(
              height: 25,
              width: MediaQuery.of(context).size.width * 0.1,
              child: TextFormField(
                enabled: false,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Color(0xff666666)),
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
                var quantity = num.parse(_quantityController.text);
                if (quantity < 10) {
                  quantity++;
                  _quantityController.text = quantity.toString();
                  check = true;
                  // totalPrice = quantity * itemPrice;
                  totalWidget(index: index, quantity: totalPrice);
                  print(totalPrice);
                  //   if (quantity < 0) {
                  //     setState(() {
                  //       totalPrice = 0.0;
                  //       quantity++;
                  //     });
                  //   } else if (quantity == 1) {
                  //     setState(() {
                  //       itemPrice = cartList[index]['itemPrice'];
                  //       quantity++;
                  //     });
                  //   } else if (quantity > 1) {
                  //     setState(() {
                  //       loading = true;
                  //       quantity++;
                  //       _quantityController.text = quantity.toString();
                  //       totalPrice = quantity * itemPrice;
                  //       itemPrice = totalPrice;
                  //       loading = false;
                  //     });
                  //   }

                  //   print("quantity: $quantity");

                  //   print("index: $index");
                  //   // totalPrice = quantity * itemPrice;
                  //   print("totalPrice: $totalPrice");
                }
                // increaseQuantity();
              },
              child: Icon(Icons.keyboard_arrow_right,
                  size: 22, color: Color(0xff666666))),
        ]));
  }

  getCartItemCount() async {
    setState(() => loading = true);
    prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('item')) {
      cartList = json.decode(prefs.getString('item'));
      Navigator.pop(context, cartList);
    } else {
      cartList = null;
    }
    setState(() => loading = false);
  }

  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.close, color: Colors.black),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text('My Cart', style: Constants.appbarStyle),
            ),
            body: Container(
                child: Container(
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // header
                cartList == null
                    ? Container()
                    : Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        color: Color(0xffaaaaaa).withOpacity(0.2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              strutStyle: StrutStyle(height: 1.5),
                              text: TextSpan(
                                  text: 'Total',
                                  style: TextStyle(
                                      color: Color(0xff12cca7),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: cartList == null
                                          ? "  0 item"
                                          : cartList.length <= 1
                                              ? '  ${cartList.length} item'
                                              : '  ${cartList.length} items',
                                      style: TextStyle(
                                          color: Color(0xff12cca7),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ]),
                            ),
                            FlatButton(
                                onPressed: () async {
                                  loading = true;
                                  prefs = await SharedPreferences.getInstance();
                                  setState(() {
                                    if (prefs.containsKey('item')) {
                                      if (cartList.length != 0 &&
                                          cartList != null) {
                                        cartList.clear();
                                        totalPrice = 0.0;
                                      }
                                      prefs.clear();
                                    }

                                    loading = false;
                                  });
                                },
                                child: Text('CLEAR CART',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                    )))
                          ],
                        )),

                cartList == null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/images/empty_cart.svg",
                              height: 200,
                              width: 200,
                            ),
                            Text("Your cart is empty!",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                )),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Text(
                                  "Browse our categories and discover our best deals!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                  )),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                color: Constants.primaryColor,
                                elevation: 0.0,
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => HomeView()));
                                },
                                child: Text(
                                  "Start Shopping!!",
                                  style: CustomTheme.labelText3.copyWith(
                                      color: Colors.white, fontSize: 18),
                                )),
                          ],
                        ),
                      )
                    : SingleChildScrollView(
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: CustomScrollView(
                              slivers: <Widget>[
                                SliverToBoxAdapter(
                                  child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.4,
                                      child: ListView.builder(
                                        physics: ScrollPhysics(),
                                        // shrinkWrap: true,
                                        itemCount: cartList.length ?? 0,
                                        itemBuilder:
                                            ((BuildContext context, index) {
                                          var item = cartList[index];
                                          return Container(
                                              padding: EdgeInsets.all(10),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () async {
                                                      loading = true;
                                                      prefs =
                                                          await SharedPreferences
                                                              .getInstance();
                                                      setState(() {
                                                        if (prefs.containsKey(
                                                            'item')) {
                                                          prefs.clear();
                                                          cartList.clear();
                                                          print(
                                                              "Preferences cleared");
                                                        }

                                                        loading = false;
                                                      });
                                                    },
                                                    child: Icon(
                                                        Icons
                                                            .remove_circle_outline,
                                                        size: 18,
                                                        color: Colors.black87),
                                                  ),
                                                  Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          width: 80,
                                                          height: 120,
                                                          decoration:
                                                              BoxDecoration(
                                                                  // borderRadius: BorderRadius.circular(50),
                                                                  image: DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image: NetworkImage(
                                                                          item[
                                                                              'image']))),
                                                        ),
                                                        // product
                                                        Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 10),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                    child: Text(
                                                                        '${item['name']}',
                                                                        style: Constants
                                                                            .cartItemTitle)),
                                                                Text(
                                                                    '₦${item['itemPrice']}',
                                                                    style: Constants
                                                                        .cartItemPrice),
                                                                SizedBox(
                                                                    height: 10),
                                                                buildQuantityControl(
                                                                    index,
                                                                    item[
                                                                        'itemQuantity']),
                                                              ],
                                                            ))
                                                      ])
                                                ],
                                              ));
                                        }),
                                      )),
                                ),
                                SliverFillRemaining(
                                  hasScrollBody: false,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 15),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text('Products',
                                                      style: Constants
                                                          .cartItemTitle),
                                                  Text('x${cartList.length}',
                                                      style: Constants
                                                          .cartItemTitle),
                                                ],
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text('Total',
                                                      style: Constants
                                                          .cartTotalPrice),
                                                  loading
                                                      ? Loading()
                                                      : totalWidget(),
                                                ],
                                              ),
                                            ],
                                          )),
                                      SizedBox(height: 20),
                                      // coupon
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Text(
                                            'Enter your coupon code if you have one..'),
                                      ),

                                      SizedBox(height: 10),
                                      Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          height: 53,
                                          child: Row(
                                            children: [
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.6,
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                      // contentPadding: EdgeInsets.fromLTRB(25, 20, 20, 20),
                                                      hintStyle: TextStyle(
                                                          color: Colors.black),
                                                      hintText: 'Discount Code',
                                                      isDense: true,
                                                      // enabledBorder: OutlineInputBorder(
                                                      //   borderRadius: BorderRadius.circular(6),
                                                      //   borderSide:
                                                      //       BorderSide(color: Color(0xffaaaaaa).withOpacity(0.4)),
                                                      // ),
                                                      // focusedBorder: OutlineInputBorder(
                                                      //   borderRadius: BorderRadius.circular(6),
                                                      //   borderSide:
                                                      //       BorderSide(color: Color(0xffaaaaaa).withOpacity(0.4)),
                                                      // ),
                                                      // errorText: 'Amount is required'
                                                    ),
                                                  )),
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  child: TextButton.icon(
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Constants
                                                                    .afrimashBlue),
                                                      ),
                                                      onPressed: () {},
                                                      icon: Icon(Icons.check,
                                                          size: 20,
                                                          color: Colors.white),
                                                      label: Text('Apply',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white))))
                                            ],
                                          )),
                                      SizedBox(height: 100),
                                    ],
                                  ),
                                )
                              ],
                            )))

                // Container(
                //     height: MediaQuery.of(context).size.height,
                //     child: ListView(children: [
                //       Container(
                //           height: MediaQuery.of(context).size.height * 0.8,
                //           child: ListView.builder(
                //             // physics: ScrollPhysics(),
                //             // shrinkWrap: true,
                //             itemCount: cartItems.length,
                //             itemBuilder: ((BuildContext context, index) {
                //               var item = cartItems[index];
                //               return Container(
                //                   padding: EdgeInsets.all(10),
                //                   width: MediaQuery.of(context).size.width,
                //                   child: Row(
                //                     children: [
                //                       Icon(Icons.remove_circle_outline,
                //                           size: 18, color: Colors.black87),
                //                       Row(
                //                           crossAxisAlignment:
                //                               CrossAxisAlignment.start,
                //                           children: [
                //                             Container(
                //                               margin: EdgeInsets.only(left: 10),
                //                               width: 80,
                //                               height: 120,
                //                               decoration: BoxDecoration(
                //                                   // borderRadius: BorderRadius.circular(50),
                //                                   image: DecorationImage(
                //                                       fit: BoxFit.cover,
                //                                       image: NetworkImage(
                //                                           item['image']))),
                //                             ),
                //                             // product
                //                             Container(
                //                                 padding: EdgeInsets.only(left: 10),
                //                                 child: Column(
                //                                   mainAxisAlignment:
                //                                       MainAxisAlignment.start,
                //                                   crossAxisAlignment:
                //                                       CrossAxisAlignment.start,
                //                                   children: [
                //                                     Container(
                //                                         child: Text(
                //                                             '${item['title']}',
                //                                             style: Constants
                //                                                 .cartItemTitle)),
                //                                     Text('₦${item['price']}',
                //                                         style: Constants
                //                                             .cartItemPrice),
                //                                     SizedBox(height: 10),
                //                                     buildQuantityControl(
                //                                         index, item['quantity']),
                //                                   ],
                //                                 ))
                //                           ])
                //                     ],
                //                   ));
                //             }),
                //           )),
                //       // total Products
                //       Container(
                //           padding:
                //               EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                //           margin:
                //               EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                //           decoration: BoxDecoration(
                //             color: Colors.grey[200],
                //           ),
                //           child: Column(
                //             children: [
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   Text('products', style: Constants.cartItemTitle),
                //                   Text('x25', style: Constants.cartItemTitle),
                //                 ],
                //               ),
                //               SizedBox(height: 10),
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   Text('Total', style: Constants.cartTotalPrice),
                //                   Text('₦125,000.00',
                //                       style: Constants.cartTotalPrice),
                //                 ],
                //               ),
                //             ],
                //           )),
                //       SizedBox(height: 20),
                //       // coupon
                //       Container(
                //         padding: EdgeInsets.symmetric(horizontal: 15),
                //         child: Text('Enter your coupon code if you have one..'),
                //       ),

                //       SizedBox(height: 10),
                //       Container(
                //           margin: EdgeInsets.symmetric(horizontal: 15),
                //           height: 53,
                //           child: Row(
                //             children: [
                //               Container(
                //                   width: MediaQuery.of(context).size.width * 0.6,
                //                   child: TextFormField(
                //                     decoration: InputDecoration(
                //                       // contentPadding: EdgeInsets.fromLTRB(25, 20, 20, 20),
                //                       hintStyle: TextStyle(color: Colors.black),
                //                       hintText: 'Discount Code',
                //                       isDense: true,
                //                       // enabledBorder: OutlineInputBorder(
                //                       //   borderRadius: BorderRadius.circular(6),
                //                       //   borderSide:
                //                       //       BorderSide(color: Color(0xffaaaaaa).withOpacity(0.4)),
                //                       // ),
                //                       // focusedBorder: OutlineInputBorder(
                //                       //   borderRadius: BorderRadius.circular(6),
                //                       //   borderSide:
                //                       //       BorderSide(color: Color(0xffaaaaaa).withOpacity(0.4)),
                //                       // ),
                //                       // errorText: 'Amount is required'
                //                     ),
                //                   )),
                //               Container(
                //                   width: MediaQuery.of(context).size.width * 0.3,
                //                   padding: EdgeInsets.only(left: 10),
                //                   child: TextButton.icon(
                //                       style: ButtonStyle(
                //                         backgroundColor: MaterialStateProperty.all(
                //                             Constants.afrimashBlue),
                //                       ),
                //                       onPressed: () {},
                //                       icon: Icon(Icons.check,
                //                           size: 20, color: Colors.white),
                //                       label: Text('Apply',
                //                           style: TextStyle(color: Colors.white))))
                //             ],
                //           ))
                //     ]))
              ],
            ))),
            floatingActionButton: cartList == null
                ? Container()
                : FloatingActionButton.extended(
                    backgroundColor: Constants.primaryColor,
                    icon: Icon(Icons.credit_card),
                    label: Text('CHECKOUT'),
                    onPressed: () async {
                      prefs = await SharedPreferences.getInstance();
                      if (prefs.containsKey('token')) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Checkout()));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => LoginScreen(
                                      fromCart: true,
                                    )));
                      }
                    }),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat);
  }
}

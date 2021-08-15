import 'package:afrimash/common/config/constants.dart';
import 'package:afrimash/helper/theme.dart';
import 'package:afrimash/screens/Orders/checkout/checkout.dart';
import 'package:flutter/material.dart';

class MyWishList extends StatefulWidget {
  // const MyWishList({ Key? key }) : super(key: key);

  @override
  _MyWishListState createState() => _MyWishListState();
}

class _MyWishListState extends State<MyWishList> {
  final cartItems = [
    {
      "image":
          "https://images.unsplash.com/photo-1559648485-1eb45b63f92c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80",
      "title": "Broilers",
      "price": 54000.00,
      "quantity": 5
    },
    {
      "image":
          "https://images.unsplash.com/photo-1487446874598-3040b74f721d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80",
      "title": "CatFish",
      "price": 4000.00,
      "quantity": 3
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.close, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('My Wishlist', style: Constants.appbarStyle),
      ),
      body: Container(
          child: Container(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // header
          Container(
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
                            text: '  2 items',
                            style: TextStyle(
                                color: Color(0xff12cca7),
                                fontSize: 13,
                                fontWeight: FontWeight.w300),
                          ),
                        ]),
                  ),
                  FlatButton(
                      onPressed: () {},
                      child: Text('CLEAR CART',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          )))
                ],
              )),

          SingleChildScrollView(
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverToBoxAdapter(
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: ListView.builder(
                              physics: ScrollPhysics(),
                              // shrinkWrap: true,
                              itemCount: cartItems.length,
                              itemBuilder: ((BuildContext context, index) {
                                var item = cartItems[index];
                                return Container(
                                    padding: EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      children: [
                                        Icon(Icons.remove_circle_outline,
                                            size: 18, color: Colors.black87),
                                        Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                width: 80,
                                                height: 120,
                                                decoration: BoxDecoration(
                                                    // borderRadius: BorderRadius.circular(50),
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                            item['image']))),
                                              ),
                                              // product
                                              Container(
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                          child: Text(
                                                              '${item['title']}',
                                                              style: Constants
                                                                  .cartItemTitle)),
                                                      Text('₦${item['price']}',
                                                          style: Constants
                                                              .cartItemPrice),
                                                      SizedBox(height: 10),
                                                      Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: FlatButton(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        15,
                                                                    vertical:
                                                                        10),
                                                            shape: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            3),
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .transparent)),
                                                            onPressed: () {},
                                                            color: CustomTheme
                                                                .green2,
                                                            child: Text(
                                                              "ADD TO CART",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            )),
                                                      ),
                                                    ],
                                                  ))
                                            ])
                                      ],
                                    ));
                              }),
                            )),
                      ),
                    ],
                  )))
        ],
      ))),
    );
  }
}

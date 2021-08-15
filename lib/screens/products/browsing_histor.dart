import 'package:afrimash/common/config/constants.dart';
import 'package:afrimash/components/cartFloatingButton.dart';
import 'package:afrimash/screens/products/product_single.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BrowsingHistory extends StatefulWidget {
  // const BrowsingHistory({ Key? key }) : super(key: key);

  @override
  _BrowsingHistoryState createState() => _BrowsingHistoryState();
}

class _BrowsingHistoryState extends State<BrowsingHistory> {
  @override
  Widget build(BuildContext context) {
    // trending product list
    final _trendingProducts = [
      {
        "image":
            "https://images.unsplash.com/photo-1559648485-1eb45b63f92c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80",
        "title": "Broilers",
        "price": 54000.00
      },
      {
        "image":
            "https://images.unsplash.com/photo-1487446874598-3040b74f721d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80",
        "title": "CatFish",
        "price": 4000.00
      },
      {
        "image":
            "https://images.unsplash.com/photo-1595365691689-6b7b4e1970cf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=802&q=80",
        "title": "Cow",
        "price": 4000.00
      },
      {
        "image":
            "https://images.unsplash.com/photo-1580901368919-7738efb0f87e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1052&q=80",
        "title": "BullDozer",
        "price": 1300000.00
      },
      {
        "image":
            "https://images.unsplash.com/photo-1487446874598-3040b74f721d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80",
        "title": "CatFish",
        "price": 4000.00
      },
      {
        "image":
            "https://images.unsplash.com/photo-1595365691689-6b7b4e1970cf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=802&q=80",
        "title": "Cow",
        "price": 4000.00
      },
      {
        "image":
            "https://images.unsplash.com/photo-1580901368919-7738efb0f87e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1052&q=80",
        "title": "BullDozer",
        "price": 1300000.00
      }
    ];

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
            title: Text('Browsing History',
                style: TextStyle(color: Colors.white))),
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
                              MediaQuery.of(context).size.height * 0.40,
                          crossAxisSpacing: 10,
                          crossAxisCount: 2),
                      itemCount: _trendingProducts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => ProductSingle(
                              //             _trendingProducts[index])));
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
                                                image: NetworkImage(
                                                    _trendingProducts[index]
                                                        ['image']))),
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
                                    Text('${_trendingProducts[index]['title']}',
                                        style: Constants.productTitle),
                                    SizedBox(height: 3),
                                    Container(
                                        child: Row(children: [
                                      Text(
                                          '₦${_trendingProducts[index]['price']}',
                                          style: Constants.singleProductPrice),
                                      Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                              '₦${_trendingProducts[index]['price']}',
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
                                    // Text('₦${_trendingProducts[index]['price']}',
                                    //     style: Constants.productPrice)
                                  ],
                                )));
                      }))),
          Positioned(bottom: 0, right: 0, child: CartButton())
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

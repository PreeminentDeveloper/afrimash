import 'package:afrimash/common/config/constants.dart';
import 'package:afrimash/common/placeholder.dart';
import 'package:afrimash/helper/theme.dart';
import 'package:afrimash/model/trending_products.dart';
import 'package:afrimash/screens/products/product_single.dart';
import 'package:afrimash/service/get_product_category_service.dart';
import 'package:flutter/material.dart';
import 'package:inspireui/widgets/loading.dart';

class IndexedProductCategory extends StatefulWidget {
  int id;
  String name;
  IndexedProductCategory({Key key, this.id, this.name}) : super(key: key);

  @override
  _IndexedProductCategoryState createState() => _IndexedProductCategoryState();
}

class _IndexedProductCategoryState extends State<IndexedProductCategory> {
  bool loading = false;
  GetProductCategoriesService getProductCategoriesService =
      GetProductCategoriesService();

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  getCategories() async {
    setState(() => loading = true);
    try {
      var response = await getProductCategoriesService
          .getIndexedProductCategory(widget.id);
      var success = response["success"];
      if (success == false) {
        setState(() => loading = false);
      } else {
        setState(() => loading = false);
        print(response["message"]);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  bool isDescription = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(
                "Category: ${widget.name}",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: CustomTheme.titleText3.copyWith(color: Colors.white),
              ),
              backgroundColor: Constants.primaryColor,
              leading: GestureDetector(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onTap: () => Navigator.pop(context),
              ),
              // brightness: Theme.of(context).brightness,
              elevation: 0.0,
            ),
            body: SafeArea(
              child: getProductCategoriesService
                      .getProductCategory.object.isEmpty
                  ? PlaceHolder()
                  : Container(
                      color: Constants.primaryColor,
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(20),
                                topRight: const Radius.circular(20)),
                            color: Colors.white,
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 10,
                                      mainAxisExtent:
                                          MediaQuery.of(context).size.height *
                                              0.48,
                                      crossAxisSpacing: 10,
                                      crossAxisCount: 2),
                              itemCount: getProductCategoriesService
                                      .getProductCategory.object.length ??
                                  null,
                              itemBuilder: (BuildContext context, int index) {
                                var indexedProduct = getProductCategoriesService
                                    .getProductCategory.object[index];
                                var checkData = getProductCategoriesService
                                    .getProductCategory.object;
                                return checkData.isEmpty
                                    ? Center(
                                        child: Text(
                                        "No Data",
                                        style: TextStyle(
                                            fontSize: 100, color: Colors.red),
                                      ))
                                    : GestureDetector(
                                        onTap: () {
                                          var featProduct = Product(
                                              id: indexedProduct.id,
                                              name: indexedProduct.name,
                                              price: indexedProduct.price,
                                              productImages:
                                                  indexedProduct.productImages,
                                              description:
                                                  indexedProduct.description);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProductSingle(
                                                          data: featProduct)));
                                        },
                                        child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10,
                                                            horizontal: 10),
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.28,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: NetworkImage(
                                                                indexedProduct
                                                                        .productImages
                                                                        .isEmpty
                                                                    ? "https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg"
                                                                    : "${indexedProduct.productImages[0].imageUrl}"))),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Container(
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .grey[200]
                                                                    .withOpacity(
                                                                        0.8),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5),
                                                            child: Icon(
                                                                Icons
                                                                    .favorite_outline_rounded,
                                                                size: 20,
                                                                color: Colors
                                                                    .grey))
                                                      ],
                                                    )),
                                                SizedBox(height: 10),
                                                Text('${indexedProduct.name}',
                                                    style:
                                                        Constants.productTitle),
                                                SizedBox(height: 3),
                                                Container(
                                                    child: Row(children: [
                                                  Text(
                                                      '₦${indexedProduct.price}',
                                                      style: Constants
                                                          .singleProductPrice),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                          '₦${indexedProduct.buyPrice}',
                                                          style: Constants
                                                              .singleProductPriceStrike)),
                                                ])),
                                                // Text('₦${widget.products[index]['price']}',
                                                //     style: Constants.productPrice)
                                              ],
                                            )));
                              })
                          // ListView.builder(
                          //     // itemCount: getProductCategoriesService
                          //     //         .getProductCategory.object.length ??
                          //     //     null,
                          //     itemCount: 2,
                          //     itemBuilder: (context, index) {
                          //       var indexedProduct = getProductCategoriesService
                          //           .getProductCategory.object[index];
                          //       return Padding(
                          //         padding: const EdgeInsets.symmetric(vertical: 15),
                          //         child: ListTile(
                          //           leading: Image.network(
                          //             '${indexedProduct.productImages[0].imageUrl}',
                          //           ),
                          //           title: Column(
                          //             mainAxisAlignment: MainAxisAlignment.start,
                          //             crossAxisAlignment: CrossAxisAlignment.start,
                          //             children: [
                          //               Text(
                          //                 "${indexedProduct.name}",
                          //                 style: CustomTheme.headline3,
                          //               ),
                          //               Padding(
                          //                 padding:
                          //                     const EdgeInsets.symmetric(vertical: 15),
                          //                 child: Text(
                          //                   "${indexedProduct.price}",
                          //                   style: CustomTheme.headline5,
                          //                 ),
                          //               ),
                          //               GestureDetector(
                          //                 onTap: () {
                          //                   setState(() {
                          //                     isDescription = !isDescription;
                          //                   });
                          //                 },
                          //                 child: Text(
                          //                   "${indexedProduct.description}",
                          //                   overflow: isDescription
                          //                       ? TextOverflow.visible
                          //                       : TextOverflow.ellipsis,
                          //                 ),
                          //               ),
                          //               SizedBox(height: 15),
                          //               Row(
                          //                 children: [
                          //                   InkWell(
                          //                       onTap: () {},
                          //                       child: CircleAvatar(
                          //                           backgroundColor: Colors.yellow,
                          //                           child: Icon(
                          //                             Icons.shopping_cart,
                          //                             color: Colors.black,
                          //                             size: 15,
                          //                           ))),
                          //                   SizedBox(width: 10),
                          //                   InkWell(
                          //                       onTap: () {},
                          //                       child: CircleAvatar(
                          //                           backgroundColor: Colors.blue,
                          //                           child: Icon(
                          //                             Icons.favorite,
                          //                             color: Colors.white,
                          //                             size: 15,
                          //                           )))
                          //                 ],
                          //               )
                          //             ],
                          //           ),
                          //         ),
                          //       );
                          //     }),
                          ),
                    ),
            ),
          );
  }
}

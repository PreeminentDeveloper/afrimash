import 'dart:convert';

import 'package:afrimash/common/config/constants.dart';
import 'package:afrimash/common/config/loading.dart';
import 'package:afrimash/components/sidedrawer.dart';
import 'package:afrimash/model/main_app_provider.dart';
import 'package:afrimash/model/trending_products.dart';
import 'package:afrimash/screens/products/product_listing.dart';
import 'package:afrimash/screens/products/product_single.dart';
import 'package:afrimash/service/featured_product_service.dart';
import 'package:afrimash/service/get_product_category_service.dart';
import 'package:afrimash/service/popular_categories_service.dart';
import 'package:afrimash/service/product_variants_service.dart';
import 'package:afrimash/service/trending_product_service.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:inspireui/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'cart.dart';

class ProductView extends StatefulWidget {
  @override
  ProductViewState createState() => ProductViewState();
}

class ProductViewState extends State<ProductView> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  PopularCategoriesService popularCategoriesService =
      PopularCategoriesService();
  ProductVariantsService productVariantsService = ProductVariantsService();
  TrendingProductService trendingProductService = TrendingProductService();
  FeaturedProductService featuredProductService = FeaturedProductService();
  GetProductCategoriesService getProductCategoriesService =
      GetProductCategoriesService();
  bool loading = false;
  SharedPreferences prefs;
  int cartLength = 0;

  @override
  void initState() {
    super.initState();
    // getPopularCategories();
    // getProductVariants();
    getTrendingProducts();
    getFeaturedProducts();
    getCartLength();
    getCategories();
  }

  getCategories() async {
    setState(() => loading = true);
    try {
      var response =
          await getProductCategoriesService.getIndexedProductCategory(9);
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

  getPopularCategories() async {
    setState(() => loading = true);
    try {
      var response = await popularCategoriesService.getPopularCategories();
      print("Popular Categories: $response");
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

  getProductVariants() async {
    setState(() => loading = true);
    try {
      var response = await productVariantsService.getProductVariants();
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

  getTrendingProducts() async {
    setState(() => loading = true);
    try {
      var response = await trendingProductService.getTrendingProducts();
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

  getFeaturedProducts() async {
    setState(() => loading = true);
    try {
      var response = await featuredProductService.getFeaturedProducts();
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

  dialogBox(String content) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Message"),
            content: Text(content),
            actions: <Widget>[
              Row(
                children: [
                  TextButton(
                      child: Text('No', style: TextStyle(color: Colors.red)),
                      onPressed: () => Navigator.of(context).pop(false)),
                  SizedBox(width: 20),
                  TextButton(
                      child: Text('Yes', style: TextStyle(color: Colors.red)),
                      onPressed: () => Navigator.of(context).pop(true)),
                ],
              ),
            ],
          );
        });
  }

  Future<bool> _willPopCallback() async {
    // await showDialog or Show add banners or whatever
    final shouldPopUp = showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Message"),
            content: Text("Do you want to Exit?"),
            actions: <Widget>[
              Row(
                children: [
                  TextButton(
                      child: Text('No', style: TextStyle(color: Colors.red)),
                      onPressed: () => Navigator.of(context).pop(false)),
                  SizedBox(width: 20),
                  TextButton(
                      child: Text('Yes', style: TextStyle(color: Colors.red)),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      })
                ],
              ),
            ],
          );
        });

    //  await dialogBox("Doyou want to exit", onPressed)
    // then
    return shouldPopUp ?? false;
  }

  Widget build(BuildContext context) {
    final provider = Provider.of<MainAppProvider>(context, listen: false);

    return loading
        ? kLoadingWidget(context)
        : WillPopScope(
            onWillPop: _willPopCallback,
            child: Scaffold(
                key: _drawerKey,
                backgroundColor: Colors.white,
                appBar: AppBar(
                  brightness: Theme.of(context).brightness,
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  centerTitle: true,
                  title: Container(
                      height: 70.0,
                      // width: 70.0,
                      child: SvgPicture.asset(
                        'assets/images/logo.svg',
                      )),
                  leading: InkWell(
                      onTap: () => _drawerKey.currentState.openDrawer(),
                      child: Icon(Icons.menu, color: const Color(0xff00854e))),
                  actions: [
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CartScren()));
                        },
                        child: Container(
                            padding: EdgeInsets.only(right: 15),
                            child: Badge(
                              toAnimate: true,
                              badgeColor: const Color(0xff00854e),
                              badgeContent: Text("$cartLength"),
                              child: Icon(Icons.add_shopping_cart_outlined,
                                  color: Colors.black),
                            ))
                        // new Icon(Icons.add_shopping_cart_outlined,
                        //     color: const Color(0xff00854e))
                        )
                  ],
                ),
                drawer: SideDrawer(provider),
                body: Container(
                  child: SingleChildScrollView(
                      child: Column(children: [
                    // Categories(),
                    getProductCategoriesService.getProductCategory.object ==
                            null
                        ? Loading()
                        : Container(
                            height: MediaQuery.of(context).size.height * 0.13,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: getProductCategoriesService
                                        .getProductCategory.object.length ??
                                    null,
                                itemBuilder: (BuildContext context, int index) {
                                  var indexedProduct =
                                      getProductCategoriesService
                                          .getProductCategory.object[index];
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 45,
                                          height: 45,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(indexedProduct
                                                          .productImages.isEmpty
                                                      ? "https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg"
                                                      : "${indexedProduct.productImages[0].imageUrl}"))),
                                        ),
                                        SizedBox(height: 3),
                                        // text
                                        Container(
                                          width: 50,
                                          child: Text('${indexedProduct.name}',
                                              overflow: TextOverflow.ellipsis,
                                              style: Constants.categoryStyle),
                                        )
                                      ],
                                    ),
                                  );
                                })),
                    ProductSlides(),

                    // trending products title
                    SizedBox(height: 25),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Trending Products',
                                style: Constants.headerStyle),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProductListing(
                                              trendingProductService
                                                  .trendingProduct)));
                                },
                                child:
                                    Text('See All', style: Constants.linkText))
                          ],
                        )),

                    // trending products
                    SizedBox(height: 10),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                trendingProductService.trendingProduct.length ??
                                    0,
                            itemBuilder: (BuildContext context, int index) {
                              var trendingProduct =
                                  trendingProductService.trendingProduct[index];
                              return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ProductSingle(
                                                data: trendingProduct)));
                                  },
                                  child: Container(
                                      padding: EdgeInsets.only(right: 10),
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.20,
                                            child: FadeInImage.memoryNetwork(
                                                placeholder: kTransparentImage,
                                                fit: BoxFit.cover,
                                                image: trendingProduct
                                                        .productImages.isEmpty
                                                    ? "https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg"
                                                    : trendingProduct
                                                        .productImages[0]
                                                        .imageUrl),
                                          ),
                                          SizedBox(height: 10),
                                          Text('${trendingProduct.name}',
                                              style: Constants.productTitle),
                                          SizedBox(height: 3),
                                          Wrap(
                                            spacing: 8,
                                            children: [
                                              Text('₦${trendingProduct.price}',
                                                  style:
                                                      Constants.productPrice),
                                              Text(
                                                  '₦${trendingProduct.buyPrice}',
                                                  style: Constants
                                                      .singleProductPriceStrike),
                                            ],
                                          )
                                        ],
                                      )));
                            })),
                    // featured products title
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Featured Products',
                                style: Constants.headerStyle),
                            InkWell(
                                onTap: () {
                                  List<Product> product = [];
                                  featuredProductService.featuredProduct.object
                                      .forEach((element) {
                                    var featProduct = Product(
                                        name: element.name,
                                        price: element.price,
                                        productImages: element.productImages,
                                        description: element.description);

                                    product.add(featProduct);
                                  });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProductListing(product)));
                                },
                                child:
                                    Text('See All', style: Constants.linkText))
                          ],
                        )),
                    // featured products list
                    SizedBox(height: 10),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: featuredProductService.featuredProduct.object ==
                                null
                            ? Loading()
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: featuredProductService
                                        .featuredProduct.object.length ??
                                    0,
                                itemBuilder: (BuildContext context, int index) {
                                  var featuredProduct = featuredProductService
                                      .featuredProduct.object[index];
                                  return InkWell(
                                      onTap: () {
                                        var featProduct = Product(
                                            id: featuredProduct.id,
                                            name: featuredProduct.name,
                                            price: featuredProduct.price,
                                            productImages:
                                                featuredProduct.productImages,
                                            description:
                                                featuredProduct.description);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductSingle(
                                                      data: featProduct,
                                                    )));
                                      },
                                      child: Container(
                                          padding: EdgeInsets.only(right: 10),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.28,
                                                child: FadeInImage.memoryNetwork(
                                                    placeholder:
                                                        kTransparentImage,
                                                    fit: BoxFit.cover,
                                                    image: featuredProduct
                                                            .productImages
                                                            .isEmpty
                                                        ? "https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg"
                                                        : featuredProduct
                                                            .productImages[0]
                                                            .imageUrl),
                                              ),
                                              SizedBox(height: 10),
                                              Text('${featuredProduct.name}',
                                                  style:
                                                      Constants.productTitle),
                                              SizedBox(height: 3),
                                              Wrap(
                                                spacing: 8,
                                                children: [
                                                  Text(
                                                      '₦${featuredProduct.price}',
                                                      style: Constants
                                                          .productPrice),
                                                  Text(
                                                      '₦${featuredProduct.buyPrice}',
                                                      style: Constants
                                                          .singleProductPriceStrike),
                                                ],
                                              )
                                            ],
                                          )));
                                })),

                    // // hot deals title
                    // Container(
                    //     child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text('Hot Deals', style: Constants.headerStyle),
                    //     InkWell(
                    //         onTap: () {
                    //           Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) => ProductListing(
                    //                       trendingProductService.trendingProduct)));
                    //         },
                    //         child: Text('See All', style: Constants.linkText))
                    //   ],
                    // )),

                    // // hot deals list
                    // SizedBox(height: 10),
                    // Container(
                    //     height: MediaQuery.of(context).size.height * 0.45,
                    //     child: featuredProductService.featuredProduct.object == null
                    //         ? Loading()
                    //         : ListView.builder(
                    //             scrollDirection: Axis.horizontal,
                    //             itemCount: featuredProductService
                    //                 .featuredProduct.object.length,
                    //             itemBuilder: (BuildContext context, int index) {
                    //               var featuredProduct = featuredProductService
                    //                   .featuredProduct.object[index];
                    //               return InkWell(
                    //                   onTap: () {
                    //                     var featProduct = Product(
                    //                         name: featuredProduct.name,
                    //                         price: featuredProduct.price,
                    //                         productImages:
                    //                             featuredProduct.productImages,
                    //                         description:
                    //                             featuredProduct.description);
                    //                     Navigator.push(
                    //                         context,
                    //                         MaterialPageRoute(
                    //                             builder: (context) => ProductSingle(
                    //                                   data: featProduct,
                    //                                 )));
                    //                   },
                    //                   child: Container(
                    //                       padding: EdgeInsets.only(right: 10),
                    //                       width:
                    //                           MediaQuery.of(context).size.width / 2,
                    //                       child: Column(
                    //                         crossAxisAlignment:
                    //                             CrossAxisAlignment.start,
                    //                         children: [
                    //                           Container(
                    //                             height: MediaQuery.of(context)
                    //                                     .size
                    //                                     .height *
                    //                                 0.28,
                    //                             decoration: BoxDecoration(
                    //                                 image: DecorationImage(
                    //                                     fit: BoxFit.cover,
                    //                                     image: NetworkImage(
                    //                                         featuredProduct
                    //                                             .productImages[0]
                    //                                             .imageUrl))),
                    //                           ),
                    //                           SizedBox(height: 10),
                    //                           Text('${featuredProduct.name}',
                    //                               style: Constants.productTitle),
                    //                           SizedBox(height: 3),
                    //                           Wrap(
                    //                             spacing: 8,
                    //                             children: [
                    //                               Text('₦${featuredProduct.price}',
                    //                                   style:
                    //                                       Constants.productPrice),
                    //                               Text(
                    //                                   '₦${featuredProduct.buyPrice}',
                    //                                   style: Constants
                    //                                       .singleProductPriceStrike),
                    //                             ],
                    //                           )
                    //                         ],
                    //                       )));
                    //             })),

                    // special offer title
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Special Offer', style: Constants.headerStyle),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProductListing(
                                              trendingProductService
                                                  .trendingProduct)));
                                },
                                child:
                                    Text('See All', style: Constants.linkText))
                          ],
                        )),

                    // special offer list
                    SizedBox(height: 10),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: featuredProductService.featuredProduct.object ==
                                null
                            ? Loading()
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: trendingProductService
                                        .trendingProduct.length ??
                                    0,
                                itemBuilder: (BuildContext context, int index) {
                                  var trendingProduct = trendingProductService
                                      .trendingProduct[index];
                                  return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductSingle(
                                                        data:
                                                            trendingProduct)));
                                      },
                                      child: Container(
                                          padding: EdgeInsets.only(right: 10),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.28,
                                                  child: FadeInImage.memoryNetwork(
                                                      placeholder:
                                                          kTransparentImage,
                                                      fit: BoxFit.cover,
                                                      image: trendingProduct
                                                              .productImages
                                                              .isEmpty
                                                          ? "https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg"
                                                          : trendingProduct
                                                              .productImages[0]
                                                              .imageUrl)),
                                              SizedBox(height: 10),
                                              Text('${trendingProduct.name}',
                                                  style:
                                                      Constants.productTitle),
                                              SizedBox(height: 3),
                                              Wrap(
                                                spacing: 8,
                                                children: [
                                                  Text(
                                                      '₦${trendingProduct.price}',
                                                      style: Constants
                                                          .productPrice),
                                                  Text(
                                                      '₦${trendingProduct.buyPrice}',
                                                      style: Constants
                                                          .singleProductPriceStrike),
                                                ],
                                              )
                                            ],
                                          )));
                                })),

                    // special deals title
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Special Deals', style: Constants.headerStyle),
                            InkWell(
                                onTap: () {
                                  List<Product> product = [];
                                  featuredProductService.featuredProduct.object
                                      .forEach((element) {
                                    var featProduct = Product(
                                        name: element.name,
                                        price: element.price,
                                        productImages: element.productImages,
                                        description: element.description);

                                    product.add(featProduct);
                                  });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProductListing(product)));
                                },
                                child:
                                    Text('See All', style: Constants.linkText))
                          ],
                        )),

                    // special deals list
                    SizedBox(height: 10),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: featuredProductService.featuredProduct.object ==
                                null
                            ? Loading()
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: featuredProductService
                                        .featuredProduct.object.length ??
                                    0,
                                itemBuilder: (BuildContext context, int index) {
                                  var featuredProduct = featuredProductService
                                      .featuredProduct.object[index];
                                  return InkWell(
                                      onTap: () {
                                        var featProduct = Product(
                                            name: featuredProduct.name,
                                            price: featuredProduct.price,
                                            productImages:
                                                featuredProduct.productImages,
                                            description:
                                                featuredProduct.description);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductSingle(
                                                      data: featProduct,
                                                    )));
                                      },
                                      child: Container(
                                          padding: EdgeInsets.only(right: 10),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.28,
                                                child: FadeInImage.memoryNetwork(
                                                    placeholder:
                                                        kTransparentImage,
                                                    fit: BoxFit.cover,
                                                    image: featuredProduct
                                                            .productImages
                                                            .isEmpty
                                                        ? "https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg"
                                                        : featuredProduct
                                                            .productImages[0]
                                                            .imageUrl),
                                              ),
                                              SizedBox(height: 10),
                                              Text('${featuredProduct.name}',
                                                  style:
                                                      Constants.productTitle),
                                              SizedBox(height: 3),
                                              Wrap(
                                                spacing: 8,
                                                children: [
                                                  Text(
                                                      '₦${featuredProduct.price}',
                                                      style: Constants
                                                          .productPrice),
                                                  Text(
                                                      '₦${featuredProduct.buyPrice}',
                                                      style: Constants
                                                          .singleProductPriceStrike),
                                                ],
                                              )
                                            ],
                                          )));
                                })),
                  ])),
                )),
          );
  }
}

class Categories extends StatelessWidget {
  categoryItem() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
        child: Column(
          children: [
            // image
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                      image: AssetImage("assets/images/static/poultry.jpg"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(height: 3),
            // text
            Text('Poultry', style: Constants.categoryStyle)
          ],
        ));
  }

  Widget build(BuildContext context) {
    return Container(
        height: 78,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            categoryItem(),
            categoryItem(),
            categoryItem(),
            categoryItem(),
            categoryItem(),
            categoryItem(),
            categoryItem(),
            categoryItem(),
          ],
        ));
  }
}

class ProductSlides extends StatelessWidget {
  final _images = [
    "https://images.unsplash.com/photo-1464226184884-fa280b87c399?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80",
    "https://images.unsplash.com/photo-1500595046743-cd271d694d30?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1053&q=80",
    "https://images.unsplash.com/photo-1598030343246-eec71cb44231?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80"
  ];

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      // width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.width * 0.50,
      child: new Swiper(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            _images[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: _images.length,
        autoplay: true,
        pagination: new SwiperPagination(),
        // control: new SwiperControl(),
      ),
    );
  }
}

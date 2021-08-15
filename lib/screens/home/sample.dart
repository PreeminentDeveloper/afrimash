import 'package:afrimash/model/main_app_provider.dart';
import 'package:afrimash/model/popular_categories.dart';
import 'package:afrimash/model/product_variants.dart';
import 'package:afrimash/service/network_handler.dart';
import 'package:afrimash/service/popular_categories_service.dart';
import 'package:afrimash/service/product_variants_service.dart';
import 'package:flutter/material.dart';
import 'package:inspireui/widgets/loading.dart';
import 'package:provider/provider.dart';

class Sample extends StatefulWidget {
  final MainAppProvider mainAppProvider;
  const Sample(this.mainAppProvider);

  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  bool loading = false;

  NetworkHandler networkHandler = NetworkHandler();
  PopularCategoriesService popularCategories = PopularCategoriesService();
  ProductVariantsService productVariantsService = ProductVariantsService();

  @override
  void initState() {
    super.initState();
    // getPopularCategories();
    getProductVariants();
  }

  getPopularCategories() async {
    setState(() => loading = true);
    var response = await popularCategories.getPopularCategories();
    var success = response["success"];
    if (success == false) {
      setState(() => loading = false);
      var data = response;
      print("Popular Categories data: $data");
    } else {
      setState(() => loading = false);
      print(response["message"]);
    }
  }

  getProductVariants() async {
    // final provider = Provider.of<MainAppProvider>(context, listen: false);
    setState(() => loading = true);
    var response = await widget.mainAppProvider.getProductVariants();
    print("Response on view: $response");
    var success = response["success"];
    if (success == false) {
      setState(() => loading = false);
      var data = response;
      print("Product Variants data: $data");
    } else {
      setState(() => loading = false);
      print(response["message"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(),
            body: Container(
              padding: const EdgeInsets.all(80.0),
              child: Text("{}}"),
            ),
          );
  }
}

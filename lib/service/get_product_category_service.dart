import 'package:afrimash/model/get_product_category.dart';
import 'package:afrimash/service/network_handler.dart';
import 'package:flutter/cupertino.dart';

class GetProductCategoriesService with ChangeNotifier {
  NetworkHandler networkHandler = NetworkHandler();
  GetProductCategory _getProductCategory = GetProductCategory();

  GetProductCategory get getProductCategory => _getProductCategory;

  getIndexedProductCategory(int index) async {
    var response = await networkHandler
        .getWithoutToken("/afrimash/product-categories/$index/products");
    try {
      if (response['status'] == "OK") {
        print("Indexed Product Category Response: $response");
        _getProductCategory = GetProductCategory.fromJson(response);
        notifyListeners();
        return {'success': true, 'message': response};
      } else {
        return {'success': false, 'message': response['error']};
      }
    } catch (e) {
      print(e.toString());
      return {'success': false, 'message': response};
    }
  }
}

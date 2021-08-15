import 'package:afrimash/model/get_all_product_categories.dart';
import 'package:afrimash/service/network_handler.dart';
import 'package:flutter/cupertino.dart';

class GetAllProductCategoriesService with ChangeNotifier {
  NetworkHandler networkHandler = NetworkHandler();
  GetAllProductCategories _getAllProductCategories = GetAllProductCategories();

  GetAllProductCategories get getAllProductCategories =>
      _getAllProductCategories;

  getCategories() async {
    var response =
        await networkHandler.getWithoutToken("/afrimash/product-categories");
    try {
      if (response['status'] == "OK") {
        print("All Product Categories Response: $response");
        _getAllProductCategories = GetAllProductCategories.fromJson(response);
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

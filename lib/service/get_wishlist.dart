import 'package:afrimash/model/get_product_category.dart';
import 'package:afrimash/service/network_handler.dart';
import 'package:flutter/cupertino.dart';

class GetWIshlist with ChangeNotifier {
  NetworkHandler networkHandler = NetworkHandler();
  GetProductCategory _getProductCategory = GetProductCategory();

  GetProductCategory get getProductCategory => _getProductCategory;

  getWIshlist(int index) async {
    var response = await networkHandler
        .getWithToken("/afrimash/wish-list/customer/$index");
    try {
      if (response['status'] == "OK") {
        print("Get Wishlist Response: $response");
        // _getProductCategory = GetProductCategory.fromJson(response);
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

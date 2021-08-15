import 'package:afrimash/model/popular_categories.dart';
import 'package:afrimash/service/network_handler.dart';

class PopularCategoriesService {
  PopularCategories _popularCategories = PopularCategories();
  NetworkHandler networkHandler = NetworkHandler();

  PopularCategories get popularCategories => _popularCategories;

  getPopularCategories() async {
    var response = await networkHandler
        .getWithoutToken("/afrimash/product-categories/popular");
    print("Popular Categories: $response");
    try {
      if (response == null) {
        return {'success': false, 'message': response['message']};
      } else {
        _popularCategories = PopularCategories.fromJson(response);
        return {'success': true, 'message': response['object']};
      }
    } catch (e) {
      print(e.toString());
    }
    // notifyListeners();
  }
}

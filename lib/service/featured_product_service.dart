import 'package:afrimash/model/featured_products.dart';
import 'package:afrimash/service/network_handler.dart';

class FeaturedProductService {
  FeaturedProducts _featuredProducts = FeaturedProducts();
  NetworkHandler networkHandler = NetworkHandler();

  FeaturedProducts get featuredProduct => _featuredProducts;

  getFeaturedProducts() async {
    var response = await networkHandler
        .getWithoutToken("/afrimash/products/lowest-prices");
    print("Featured Product: $response");
    try {
      if (response == null) {
        return {'success': false, 'message': response['message']};
      } else {
        _featuredProducts = FeaturedProducts.fromJson(response);
        return {'success': true, 'message': response['object'][0]};
      }
    } catch (e) {
      print(e.toString());
    }
    // notifyListeners();
  }
}

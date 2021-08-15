import 'package:afrimash/model/product_variants.dart';
import 'package:afrimash/service/network_handler.dart';

class ProductVariantsService {
  ProductVariants _productVariants = ProductVariants();
  NetworkHandler networkHandler = NetworkHandler();

  ProductVariants get productVariants => _productVariants;

  getProductVariants() async {
    var response = await networkHandler.getWithoutToken("/afrimash/product-variants");
    print("Product Variants: $response");
    try {
      if (response == null) {
        return {'success': false, 'message': response['message']};
      } else {
        _productVariants = ProductVariants.fromJson(response);
        return {'success': true, 'message': response['object']};
      }
    } catch (e) {
      print(e.toString());
    }
    // notifyListeners();
  }
}

import 'package:afrimash/model/trending_products.dart';
import 'package:afrimash/service/network_handler.dart';

class TrendingProductService {
  List<Product> _trendingProducts = [];
  NetworkHandler networkHandler = NetworkHandler();

  List<Product> get trendingProduct => _trendingProducts;

  getTrendingProducts() async {
    var response =
        await networkHandler.getWithoutToken("/afrimash/products/trending");
    print("Trending Product: $response");
    try {
      if (response == null) {
        return {'success': false, 'message': response['message']};
      } else {
        var tempProduct = response['object'];
        Product trending;

        tempProduct.forEach((dynamic product) {
          trending = Product.fromJson(product["product"]);
          var item = Product(
            id: trending.id,
            name: trending.name,
            price: trending.price,
            barcode: trending.barcode,
            brandId: trending.brandId,
            buyPrice: trending.buyPrice,
            dateAdded: trending.dateAdded,
            description: trending.description,
            discountRate: trending.discountRate,
            enableReviews: trending.enableReviews,
            enableStockManagement: trending.enableStockManagement,
            productCategories: trending.productCategories,
            productCategoryId: trending.productCategoryId,
            productFeatures: trending.productFeatures,
            productImages: trending.productImages,
            productReviews: trending.productReviews,
            productType: trending.productType,
            productUrl: trending.productUrl,
            productVariants: trending.productVariants,
            rating: trending.rating,
            sku: trending.sku,
            storeId: trending.storeId,
            tags: trending.tags,
            taxGroupId: trending.taxGroupId,
            translatedName: trending.translatedName,
            visible: trending.visible,
          );
          _trendingProducts.add(item);
        });
        return {'success': true, 'message': trending.toJson()};
      }
    } catch (e) {
      print(e.toString());
    }
    // notifyListeners();
  }
}

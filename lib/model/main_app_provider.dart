import 'package:afrimash/service/create_delivery_address_service.dart';
import 'package:afrimash/service/create_order_service.dart';
import 'package:afrimash/service/get_logged_in_details_service.dart';
import 'package:afrimash/service/popular_categories_service.dart';
import 'package:afrimash/service/product_variants_service.dart';
import 'package:afrimash/service/register_service.dart';
import 'package:afrimash/service/login_service.dart';
import 'package:afrimash/service/trending_product_service.dart';
import 'package:flutter/material.dart';

class MainAppProvider
    with
        ChangeNotifier,
        PopularCategoriesService,
        ProductVariantsService,
        TrendingProductService,
        RegisterService,
        LoginService,
        GetLoggedInDetailsService,
        CreateOrderService,
        CreateDeliveryAddressService,
        CreateOrderService {}

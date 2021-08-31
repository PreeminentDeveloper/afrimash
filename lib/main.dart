import 'package:afrimash/model/main_app_provider.dart';
import 'package:afrimash/screens/Orders/checkout/checkout.dart';
import 'package:afrimash/screens/Orders/checkout/tabs/delivery.dart';
import 'package:afrimash/screens/Orders/checkout/tabs/payment.dart';
import 'package:afrimash/screens/account/settings.dart';
import 'package:afrimash/screens/auth/login.dart';
import 'package:afrimash/screens/auth/register.dart';
import 'package:afrimash/screens/home/home.dart';
import 'package:afrimash/screens/home/sample.dart';
import 'package:afrimash/screens/products/product_home.dart';
import 'package:afrimash/screens/products/product_single.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MainAppProvider(), child: MyApp()));
}

class MyApp extends StatefulWidget {
  final MainAppProvider mainAppProvider;
  MyApp({this.mainAppProvider});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MainAppProvider>(context, listen: false);
    return MaterialApp(
      title: 'Afrimash',
      theme: ThemeData(
        fontFamily: 'Feather',
        primaryColor: Color(0xff00854e),
      ),
      home: HomeView(),
      routes: {
        '/home': (context) => HomeView(),
        '/product_home': (context) => ProductView(),
        '/login': (context) => LoginScreen(
              mainAppProvider: provider,
            ),
        '/register': (context) => RegisterScreen(
              mainAppProvider: provider,
            ),
        '/settings': (context) => Settings(
              mainAppProvider: provider,
            ),
        '/product_single': (context) => ProductSingle(
              mainAppProvider: provider,
            ),
        '/checkout': (context) => Checkout(
              mainAppProvider: provider,
            ),
        '/delivery': (context) => Delivery(
              mainAppProvider: provider,
            ),
        '/payment': (context) => Payment(
              mainAppProvider: provider,
            ),
      },
    );
  }
}

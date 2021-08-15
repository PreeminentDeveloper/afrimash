import 'dart:convert';
import 'dart:io';

import 'package:afrimash/common/config/constant/key.dart';
import 'package:afrimash/screens/Orders/checkout/success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MakePayment {
  BuildContext ctx;
  double price;
  String email;
  MakePayment({this.ctx, this.price, this.email});

  PaystackPlugin paystackPlugin = PaystackPlugin();

  SharedPreferences prefs;

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  PaymentCard _getCardUI() {
    return PaymentCard(number: "", cvc: "", expiryMonth: 0, expiryYear: 0);
  }

  Future initializePlugin() async {
    await paystackPlugin.initialize(publicKey: ConstantKey.PAYSTACK_KEY);
  }

  chargeCardAndMakePayment() async {
    initializePlugin().then((_) async {
      Charge charge = Charge()
        ..amount = price.toInt() * 100
        ..email = email
        ..reference = _getReference()
        ..card = _getCardUI();

      CheckoutResponse response = await paystackPlugin.checkout(ctx,
          charge: charge,
          method: CheckoutMethod.card,
          fullscreen: false,
          logo: Image.asset(
            'assets/images/logo.png',
            height: 100,
            width: 100,
          ));
      print("Response $response");

      if (response.status == true) {
        Navigator.pushReplacement(
            ctx, MaterialPageRoute(builder: (context) => SuccessScreen()));
        prefs = await SharedPreferences.getInstance();
        List<dynamic> stringList = json.decode(prefs.getString('item'));
        stringList.clear();
      } else {
        print("Transaction failed");
      }
    });
  }
}

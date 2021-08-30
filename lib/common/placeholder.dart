import 'package:afrimash/common/config/constants.dart';
import 'package:afrimash/helper/theme.dart';
import 'package:afrimash/screens/home/home.dart';
import 'package:afrimash/screens/products/product_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlaceHolder extends StatelessWidget {
  const PlaceHolder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SvgPicture.asset(
            "assets/images/empty_cart.svg",
            height: 200,
            width: 200,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 10),
            child: Text("Your category product is empty!",
                textAlign: TextAlign.center,
                style: CustomTheme.propertyTextLight.copyWith(fontSize: 18)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text("Browse our categories and discover our best deals!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                )),
          ),
          SizedBox(
            height: 40,
          ),
          RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              color: Constants.primaryColor,
              elevation: 0.0,
              onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (_) => HomeView(
                            isOrder: false,
                          ))),
              child: Text(
                "Start Shopping!!",
                style: CustomTheme.labelText3
                    .copyWith(color: Colors.white, fontSize: 18),
              )),
        ],
      ),
    );
  }
}

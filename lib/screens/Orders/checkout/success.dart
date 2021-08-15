import 'package:afrimash/common/config/constants.dart';
import 'package:afrimash/helper/theme.dart';
import 'package:afrimash/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
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
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: Text(
                    "Your order was successful. Kindly check you mail for evidence.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child:
                    Text("Browse our categories and discover our best deals!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                        )),
              ),
              SizedBox(
                height: 15,
              ),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  color: Constants.primaryColor,
                  elevation: 0.0,
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (_) => HomeView()));
                  },
                  child: Text(
                    "Continue Shopping!!",
                    style: CustomTheme.labelText3
                        .copyWith(color: Colors.white, fontSize: 18),
                  )),
            ],
          ),
        ));
  }
}
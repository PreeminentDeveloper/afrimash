import 'package:afrimash/common/custom_launch.dart';
import 'package:afrimash/common/message_dialog.dart';
import 'package:afrimash/helper/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    color: Color(0xff00854e),
                    height: 220,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 30),
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              "About Us",
                              style: CustomTheme.headline3
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Check out what we do:",
                      style: CustomTheme.titleText2,
                    ),
                    InkWell(
                        onTap: () {
                          customLaunch(
                              "https://www.afrimash.com/what-we-do/", context);
                        },
                        child: Text("https://www.afrimash.com/what-we-do/",
                            style: TextStyle(color: Colors.green))),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Afrimash is an eCommerce platform where manufacturers, distributors and large scale farmers register to sell farm inputs to farmers As an eCommerce platform, our goal is to make agriculture convenient for everyone and we do so by providing the following services: \n- Farm Inputs Supply (equipment, seeds, livestock, vaccines, insecticides and more) \n- Online Training \n- Access to loan via our partners such as NIRSAL \n \nWe have about 20000 users registered on our platform, over 1500 products on our website and about 400 registered vendors. \n \nYou can know more about Afrimash and our services via the link below:",
                    ),
                    InkWell(
                      onTap: () =>
                          customLaunch("https://www.afrimash.com/", context),
                      child: Text(
                        "https://www.afrimash.com/",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

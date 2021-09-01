import 'package:afrimash/common/custom_launch.dart';
import 'package:afrimash/common/message_dialog.dart';
import 'package:afrimash/helper/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUS extends StatefulWidget {
  const ContactUS({Key key}) : super(key: key);

  @override
  _ContactUSState createState() => _ContactUSState();
}

class _ContactUSState extends State<ContactUS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                              "Contact Us",
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
                height: 100,
              ),
              Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Email:",
                        style: CustomTheme.titleText2,
                      ),
                      InkWell(
                          onTap: () =>
                              customLaunch("mailto:info@afrimash.com", context),
                          child: Text("info@afrimash.com",
                              style: TextStyle(color: Color(0xff00854e)))),
                      InkWell(
                          onTap: () => customLaunch(
                              "mailto:support@afrimash.com", context),
                          child: Text("support@afrimash.com",
                              style: TextStyle(color: Color(0xff00854e)))),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Phone:",
                        style: CustomTheme.titleText2,
                      ),
                      Text(
                        "Call & WhatsApp",
                        textAlign: TextAlign.center,
                      ),
                      InkWell(
                        onTap: () =>
                            customLaunch("tel:+234 809 409 1115", context),
                        child: Text("+234 809 409 1115,",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Color(0xff00854e))),
                      ),
                      InkWell(
                        onTap: () =>
                            customLaunch("tel:+234 808 280 8271", context),
                        child: Text("+234 808 280 8271",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Color(0xff00854e))),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

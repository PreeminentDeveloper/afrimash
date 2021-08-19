import 'package:afrimash/common/config/constants.dart';
import 'package:afrimash/helper/theme.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

class Address extends StatefulWidget {
  final TabController tabController;
  const Address({Key key, this.tabController}) : super(key: key);

  @override
  AddressState createState() => AddressState();
}

class AddressState extends State<Address> {
  void _snackBarMessage(message, context) {
    /// Showing Error messageSnackBarDemo
    /// Ability so close message
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    Scaffold.of(context)
      // ignore: deprecated_member_use
      ..removeCurrentSnackBar()
      // ignore: deprecated_member_use
      ..showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Center(
              child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    hintText: "First Name",
                    hintStyle: TextStyle(color: Colors.grey.shade400)),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Last Name",
                    hintStyle: TextStyle(color: Colors.grey.shade400)),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Mobile Number",
                    hintStyle: TextStyle(color: Colors.grey.shade400)),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.grey.shade400)),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "State / Region",
                    hintStyle: TextStyle(color: Colors.grey.shade400)),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "City",
                    hintStyle: TextStyle(color: Colors.grey.shade400)),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      color: Colors.grey.shade200,
                      elevation: 0.0,
                      onPressed: () {
                        _snackBarMessage("Data saved", context);
                      },
                      child: Text(
                        "SAVE ADDRESS",
                        style: CustomTheme.labelText3,
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      color: Constants.primaryColor,
                      elevation: 0.0,
                      onPressed: () {
                        widget.tabController
                            .animateTo((widget.tabController.index + 1) % 2);
                      },
                      child: Text(
                        "CONTINUE TO DELIVERY",
                        style: CustomTheme.labelText3
                            .copyWith(color: Colors.white),
                      )),
                ],
              )
            ],
          ))),
    );
  }
}

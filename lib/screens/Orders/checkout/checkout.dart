import 'package:afrimash/common/config/constants.dart';
import 'package:afrimash/helper/theme.dart';
import 'package:afrimash/model/main_app_provider.dart';
import 'package:afrimash/screens/Orders/checkout/tabs/address.dart';
import 'package:afrimash/screens/Orders/checkout/tabs/payment.dart';
import 'package:afrimash/screens/Orders/checkout/tabs/preview.dart';
import 'package:afrimash/screens/Orders/checkout/tabs/delivery.dart';
import 'package:flutter/material.dart';
import 'package:inspireui/widgets/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Checkout extends StatefulWidget {
  final MainAppProvider mainAppProvider;
  Checkout({Key key, this.mainAppProvider}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(
      text: "ADDRESS",
    ),
    Tab(
      text: "DELIVERY",
    ),
    // Tab(
    //   text: "PREVIEW",
    // ),
    Tab(
      text: "PAYMENT",
    )
  ];

  TabController _tabController;
  SharedPreferences prefs;
  bool loading = false;
  String activeUserEmail,
      activeUserFirstName,
      activeUserLastName,
      activeUserPhoneNumber,
      activeUserState,
      activeUserCity;

  getActiveUserData() async {
    setState(() => loading = true);
    prefs = await SharedPreferences.getInstance();
    activeUserEmail = prefs.getString('activeUserEmail');
    activeUserFirstName = prefs.getString('activeUserFirstName');
    activeUserLastName = prefs.getString('activeUserLastName');
    activeUserPhoneNumber = prefs.getString('activeUserPhoneNumber');
    activeUserState = prefs.getString('activeUserState');
    activeUserCity = prefs.getString('activeUserCity');
    setState(() => loading = false);
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
    getActiveUserData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : DefaultTabController(
            length: 3,
            child: loading
                ? Loading()
                : Scaffold(
                    appBar: AppBar(
                      brightness: Theme.of(context).brightness,
                      backgroundColor: Colors.transparent,
                      leading: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                      title: Text("Checkout", style: CustomTheme.titleText2),
                      elevation: 0.0,
                      bottom: TabBar(
                          controller: _tabController,
                          indicatorPadding:
                              EdgeInsets.symmetric(horizontal: 15),
                          labelPadding: EdgeInsets.symmetric(horizontal: 15),
                          labelStyle: CustomTheme.labelText2,
                          indicatorColor: Constants.primaryColor,
                          // unselectedLabelColor: Colors.cyan,
                          labelColor: Colors.black,
                          tabs: myTabs),
                    ),
                    body: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: [
                        Address(
                          tabController: _tabController,
                          activeUserLastName: activeUserLastName,
                          activeUserFirstName: activeUserFirstName,
                          activeUserEmail: activeUserEmail,
                          activeUserPhoneNumber: activeUserPhoneNumber,
                          activeUserState: activeUserState,
                          activeUserCity: activeUserCity,
                        ),
                        Delivery(
                          tabController: _tabController,
                        ),
                        // Preview(
                        //   tabController: _tabController,
                        // ),
                        Payment(
                          tabController: _tabController,
                        )
                      ],
                    ),
                  ),
          );
  }
}

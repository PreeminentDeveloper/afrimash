import 'package:afrimash/model/main_app_provider.dart';
import 'package:afrimash/screens/Orders/special_order.dart';
import 'package:afrimash/screens/account/about_us.dart';
import 'package:afrimash/screens/account/contact_us.dart';
import 'package:afrimash/screens/home/categories.dart';
import 'package:afrimash/screens/home/home.dart';
import 'package:afrimash/screens/products/browsing_histor.dart';
import 'package:afrimash/screens/products/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inspireui/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/auth/login.dart';

class SideDrawer extends StatefulWidget {
  final MainAppProvider mainAppProvider;

  SideDrawer(this.mainAppProvider);

  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  bool isDarkMode = false;
  bool loading = false;
  SharedPreferences prefs;
  String token;

  final ScrollController _scrollController = ScrollController();

  buildDarkModeTheme(context) {
    return Switch(
      value: isDarkMode,
      onChanged: (value) {
        isDarkMode = value;
        (context as Element).markNeedsBuild();
      },
      activeTrackColor: Colors.lightBlueAccent,
      activeColor: Colors.blue,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }

  getToken() async {
    setState(() => loading = true);
    prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('token')) {
      token = prefs.getString('token');
      print(token);
    }
    setState(() => loading = false);
  }

  void _displayMessage(message, context, Color color) {
    /// Showing Error messageSnackBarDemo
    /// Ability so close message
    final snackBar = SnackBar(
      backgroundColor: color,
      content: Text(message),
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
        label: 'Close',
        textColor: Colors.black,
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

  Widget build(BuildContext context) {
    // final provider = Provider.of<MainAppProvider>(context, listen: false);
    return loading
        ? Loading()
        : Drawer(
            child: Stack(
            children: [
              Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 1,
                  child: Scrollbar(
                      controller: _scrollController,
                      isAlwaysShown: true,
                      child: ListView(
                        controller: _scrollController,
                        children: [
                          DrawerHeader(
                              margin: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // image:
                              ),
                              child: Container(
                                  // height: MediaQuery.of(context).size.height * 0.1,
                                  child: Center(
                                      child: Row(children: <Widget>[
                                Container(
                                    height: 100.0,
                                    // width: 70.0,
                                    child: SvgPicture.asset(
                                      'assets/images/logo.svg',
                                      width: 110,
                                    )),
                              ])))),
                          SizedBox(height: 20),
                          ListTile(
                            leading: const Icon(Icons.home, size: 20),
                            title: Text('Home'),
                            // onTap: () => pushNavigation(RouteList.cart),
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeView())),
                          ),
                          ListTile(
                            leading: const Icon(Icons.list, size: 20),
                            title: Text('categories'),
                            // onTap: () => pushNavigation(RouteList.cart),
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        CategoriesScreen())),
                          ),
                          ListTile(
                            leading: const Icon(Icons.shopping_cart, size: 20),
                            title: Text('Become an affiliate'),
                            // onTap: () => pushNavigation(RouteList.cart),
                          ),
                          ListTile(
                            leading: const Icon(Icons.shopping_cart, size: 20),
                            title: Text('Cart'),
                            // onTap: () => pushNavigation(RouteList.cart),
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        CartScren())),
                          ),
                          ListTile(
                            leading:
                                const Icon(Icons.shopping_basket, size: 20),
                            title: Text('Special Orders'),
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SpecialOrder())),
                          ),
                          // TODO: Implement browsing history.
                          // ListTile(
                          //   leading: const Icon(Icons.shopping_bag, size: 20),
                          //   title: Text('Browsing History'),
                          //   // onTap: () => pushNavigation(RouteList.cart),
                          //   onTap: () => Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => BrowsingHistory())),
                          // ),
                          ListTile(
                            leading: const Icon(Icons.contact_mail_outlined,
                                size: 20),
                            title: Text('Contact Us'),
                            // onTap: () => pushNavigation(RouteList.cart),
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ContactUS())),
                          ),
                          ListTile(
                            leading: const Icon(Icons.contact_support_outlined,
                                size: 20),
                            title: Text('About Us'),
                            // onTap: () => pushNavigation(RouteList.cart),
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AboutUs())),
                          ),
                          ListTile(
                            onTap: () async {
                              if (token != null) {
                                setState(() => loading = true);
                                prefs = await SharedPreferences.getInstance();
                                if (prefs.containsKey('token')) {
                                  prefs.remove('token');
                                  _displayMessage("Logout successfully",
                                      context, Colors.red);
                                  Navigator.pop(context);
                                }
                                setState(() => loading = false);
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              }
                            },
                            leading: const Icon(Icons.login, size: 20),
                            title: Text(token != null ? "Logout" : "Login"),
                            // onTap: () => pushNavigation(RouteList.cart),
                          )
                        ],
                      )))
            ],
          ));
  }
}

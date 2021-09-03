import 'package:afrimash/common/config/constants.dart';
import 'package:afrimash/model/get_logged_in_details.dart';
import 'package:afrimash/model/main_app_provider.dart';
import 'package:afrimash/screens/account/about_us.dart';
import 'package:afrimash/screens/account/contact_us.dart';
import 'package:afrimash/screens/account/my_wish_list.dart';
import 'package:afrimash/screens/auth/login.dart';
import 'package:afrimash/screens/products/browsing_histor.dart';
import 'package:afrimash/service/get_logged_in_details_service.dart';
import 'package:afrimash/service/get_wishlist.dart';
import 'package:afrimash/service/register_service.dart';
import 'package:flutter/material.dart';
import 'package:inspireui/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  MainAppProvider mainAppProvider;
  Settings({this.mainAppProvider});
  @override
  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  bool loading = false;
  SharedPreferences prefs;
  String token;
  GetLoggedInDetailsService user = GetLoggedInDetailsService();
  GetWIshlist getWIshlist = GetWIshlist();

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

  getWishlistData() async {
    // setState(() => loading = true);
    try {
      var response = await getWIshlist.getWIshlist(11)();
      print("Get Wishlist: $response");
      var success = response["success"];
      if (success == false) {
        // setState(() => loading = false);
      } else {
        // setState(() => loading = false);
        print(response["message"]);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void _displayMessage(message, context, Color color) {
    /// Showing Error messageSnackBarDemo
    /// Ability so close message
    final snackBar = SnackBar(
      backgroundColor: color,
      content: Text(message),
      duration: const Duration(seconds: 30),
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
    final provider = Provider.of<MainAppProvider>(context, listen: false);
    return Scaffold(
        body: loading
            ? Loading()
            : CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    leading: IconButton(
                        icon: Icon(Icons.settings),
                        onPressed: () {
                          // Do something
                        }),
                    expandedHeight: 220.0,
                    floating: true,
                    pinned: true,
                    snap: true,
                    elevation: 50,
                    backgroundColor: Color(0xff00854e),
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text('Settings',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          )),
                      // background: Image.asset(
                      //   "assets/road.jpg",
                      // ),
                    ),
                  ),
                  new SliverList(
                      delegate: new SliverChildListDelegate([
                    ListTile(
                      onTap: () async {
                        if (token != null) {
                          setState(() => loading = true);
                          prefs = await SharedPreferences.getInstance();
                          if (prefs.containsKey('token')) {
                            prefs.remove('token');
                            _displayMessage(
                                "Logout successfully", context, Colors.red);
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
                      title: Text(token != null ? "Logout" : "Login",
                          style: Constants.listTileTitle),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      // onTap: () => pushNavigation(RouteList.cart),
                    ),
                    ListTile(
                        title: Text('General Settings',
                            style: Constants.headerStyleBold)),
                    ListTile(
                        leading: const Icon(Icons.favorite_outline, size: 20),
                        title: Text(
                            // '${provider.getLoggedInDetails.object.user.username}',
                            'My WishList',
                            style: Constants.listTileTitle),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        // onTap: () => pushNavigation(RouteList.cart),
                        onTap: () {
                          getWishlistData();
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => MyWishList()));
                        }),
                    Divider(),
                    ListTile(
                        leading: const Icon(Icons.favorite_outline, size: 20),
                        title: Text('Viewed Products',
                            style: Constants.listTileTitle),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        // onTap: () => pushNavigation(RouteList.cart),
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => BrowsingHistory()));
                        }),
                    Divider(),
                    ListTile(
                        leading:
                            const Icon(Icons.contact_mail_outlined, size: 20),
                        title:
                            Text('Contact Us', style: Constants.listTileTitle),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ContactUS()));
                        }),
                    Divider(),
                    ListTile(
                        leading: const Icon(Icons.contact_support_outlined,
                            size: 20),
                        title: Text('About Us', style: Constants.listTileTitle),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutUs()));
                        }),
                  ])),
                ],
              ));
  }
}

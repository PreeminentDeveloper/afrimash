import 'package:afrimash/model/main_app_provider.dart';
import 'package:afrimash/screens/account/settings.dart';
import 'package:flutter/material.dart';
import '../products/product_home.dart';

class HomeView extends StatefulWidget {
  // final MainAppProvider mainAppProvider;
  // HomeView(this.mainAppProvider);

  MainAppProvider get mainProvider => null;
  @override
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  int _currentIndex = 0;
  final List<Widget> _children = [
    Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: ProductView()),
    Center(child: Text('Search')),
    Settings(),
    // Text('HOme3'),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(child: _children[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex:
            _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home_outlined),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.search_outlined),
            title: new Text('Search'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined), title: Text('Profile'))
        ],
      ),
    );
  }
}

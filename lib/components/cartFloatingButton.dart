import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../screens/products/cart.dart';

class CartButton extends StatelessWidget {
  final Function onTap;
  final int itemCount;
  CartButton({this.onTap, this.itemCount});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            width: 90,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              // boxShadow: kElevationToShadow[1],

              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Color(0xff12cca7).withOpacity(0.2),
                    blurRadius: 3.0,
                    offset: Offset(0.0, 0.75))
              ],
              color: Color(0xff12cca7).withOpacity(0.3),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
              ),
            ),
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Badge(
                  toAnimate: true,
                  badgeColor: const Color(0xff00854e),
                  badgeContent: Text("$itemCount",
                      style: TextStyle(fontSize: 11, color: Colors.white)),
                  child: Icon(Icons.add_shopping_cart),
                )

                // Container(
                //     margin: EdgeInsets.only(left: 5),
                //     height: 25,
                //     width: 20,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(4),
                //         color: Color(0xff12cca7)),
                //     child: Center(
                //         child: Text('4',
                //             style:
                //                 TextStyle(fontSize: 16, color: Colors.white))))
              ],
            )));
  }
}

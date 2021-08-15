import 'package:flutter/material.dart';

class Constants {
  static const headerStyle = TextStyle(
    fontSize: 20,
    fontFamily: 'Feather',
  );

  static const headerStyleBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: 'Feather',
  );
  static const productTitle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    fontFamily: 'Feather',
    color: Colors.black54,
  );

  static const singleProductTitle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w400,
    fontFamily: 'Feather',
  );

  static const categoryStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    fontFamily: 'Feather',
  );
  static const productPrice = TextStyle(
      fontSize: 15, fontFamily: 'SF Pro Display', color: Colors.black54);

  static const singleProductPrice = TextStyle(
    fontSize: 15,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w300,
    color: Color(0xff00854e),
  );

  static const singleProductPriceStrike = TextStyle(
      fontSize: 15,
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w300,
      color: Color(0xffaaaaaa),
      decoration: TextDecoration.lineThrough);

  static const listTileTitle = TextStyle(
    // fontSize: 18,
    fontFamily: 'Feather',
  );

  static const cartItemTitle =
      TextStyle(fontSize: 17, fontFamily: 'Feather', color: Colors.black54
          // color: Color(0xffaaaaaa),
          );

  static const cartItemPrice = TextStyle(
    fontSize: 14,
    color: Colors.black54,
    fontFamily: 'SF Pro Display',
  );

  static const appbarStyle = TextStyle(
    fontSize: 25,
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontFamily: 'SF Pro Display',
  );

  static const cartTotalPrice = TextStyle(
    fontSize: 22,
    color: Colors.black54,
    fontWeight: FontWeight.w300,
    fontFamily: 'Feather',
  );

  static const linkText = TextStyle(
      fontSize: 15, fontFamily: 'Feather', color: const Color(0xff00854e));

  static const primaryColor = Color(0xff00854e);

  static const inactiveColor = Color(0xffaaaaaa);

  static const secondaryColor = Color(0xff12cca7);
  static const afrimashBlue = Color(0xff108bea);
}

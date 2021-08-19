import 'package:flutter/material.dart';

class CustomTheme {
  CustomTheme._();

  static const Color notWhite = Color(0xFFf6f6f8);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlue = Color(0xFF0396E3);
  static const Color lightgrey = Color(0xFF9096A0);
  static const Color darkGrey = Color(0xFF212D40);
  static const Color nearlyWhite = Color(0xFFF0F7FF);
  static const Color nearlyYellow = Color(0xFFFD9F08);
  static const Color scaffoldColor = Color(0xFFE5E5E5);
  static const Color aquaGreen = Color(0xFF00E2AC);
  static const Color red = Color(0xFFEB001B);
  static const Color pendingYellow = Color(0xFFFDB71B);
  static const Color bluegrey = Color(0xFF234C56);
  static const Color seagreen = Color(0xFF458a6d);
  static const Color green = Color(0xFF11BD94);
  static const Color lightblue = Color(0xFF0396E3);
  static const Color blue5 = Color.fromRGBO(0, 119, 255, 0.05);
  static const Color blue = Color(0xFF0077FF);
  static const Color green2 = Color(0xff00854e);

  static const TextStyle headline2 = TextStyle(
    fontWeight: FontWeight.bold,
    color: darkGrey,
    fontSize: 33,
  );

  static const TextStyle headline3 = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 20,
  );

  static const TextStyle headline4 = TextStyle(
    fontWeight: FontWeight.bold,
    color: darkGrey,
    fontSize: 12,
  );

  static const TextStyle headline5 = TextStyle(
    fontWeight: FontWeight.bold,
    color: seagreen,
    fontSize: 15,
  );

  static const TextStyle textContent = TextStyle(
    fontSize: 14,
    color: Colors.black,
  );

  static const TextStyle titleText =
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold);

  static const TextStyle titleText2 =
      TextStyle(fontSize: 18, color: Colors.black);

  static const TextStyle titleText3 =
      TextStyle(fontSize: 20, color: Colors.black);

  static const TextStyle labelText = TextStyle(
    fontSize: 13,
  );

  static const TextStyle labelText2 = TextStyle(
    fontSize: 13,
    color: Colors.black,
  );

  static const TextStyle labelText3 = TextStyle(
    fontSize: 12,
  );

  static const TextStyle button1 = TextStyle(fontSize: 10, color: green2);

  static const TextStyle titleLight = TextStyle(
    fontWeight: FontWeight.w400,
    color: lightgrey,
    fontSize: 23,
  );

  static const TextStyle subtitle = TextStyle(
    fontWeight: FontWeight.w400,
    color: lightgrey,
    fontSize: 16,
  );

  static const TextStyle subtitleLight = TextStyle(
    fontWeight: FontWeight.bold,
    color: lightgrey,
    fontSize: 12,
  );

  static const TextStyle propertyTextLight = TextStyle(
    fontWeight: FontWeight.w500,
    color: lightgrey,
    fontSize: 14,
  );

  static const TextStyle propertyText = TextStyle(
    fontWeight: FontWeight.w500,
    color: darkGrey,
    fontSize: 16,
  );

  static const TextStyle listText = TextStyle(
    fontSize: 16,
  );

  static const TextStyle drawerText = TextStyle(
    color: nearlyBlue,
    fontSize: 15,
  );

  static const TextStyle yellowText =
      TextStyle(color: nearlyYellow, fontSize: 14, fontWeight: FontWeight.w600);
}

import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor != null
        ? hexColor.toUpperCase().replaceAll('#', '')
        : 'FFFFFF';
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  // ignore: prefer_constructors_over_static_methods
  static HexColor fromJson(String json) => json != null ? HexColor(json) : null;

  static List<HexColor> fromListJson(List listJson) =>
      // ignore: avoid_as
      listJson.map((e) => HexColor.fromJson(e as String)).toList();

  String toJson() => super.value.toRadixString(16);
}

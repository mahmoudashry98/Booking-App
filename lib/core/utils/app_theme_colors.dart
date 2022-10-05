import 'package:flutter/material.dart';

class AppColors {
  static const Color kPrimaryColor = Color(0xff113644);
  static const Color kScafoldBgColor = Color.fromRGBO(0, 0, 0, 1);
  static const Color kTextColor1 = Colors.black;
  static const Color kTextColor2 = Color(0xff595959);
  static const Color kRedColor = Color(0xffD91E1C);
  static const Color kGreyColor = Color(0xffECECEC);
  static const Color kBuleColor = Color(0xff00AEEF);

  /// scaffold background colors
  static Color lightGrey = Colors.grey.shade100;
  static Color grey = Colors.grey.shade400;
  static const Color transparent = Color(0x8A000000);
  static const Color black = Colors.black;
  static const Color kwhite = Colors.white;
  static Color greyLight = Colors.grey[400]!;
  static Color whiteWithOpacity = const Color.fromRGBO(255, 255, 255, 230);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

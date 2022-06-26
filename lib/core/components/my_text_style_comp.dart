import 'package:kunlik/core/constants/colors_const.dart';
import 'package:flutter/material.dart';

class MyTextStyleComp {
  static TextStyle myTextStyle({
    Color color = Colors.black,
    double fontSize = 14,
    FontWeight weight = FontWeight.w500,
  }) =>
      TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: weight,
      );

  static get textStyleBlack_18_700 => TextStyle(
      color: ColorsConst.colorBlack,
      fontSize: 18,
      fontWeight: FontWeight.w700);

  static get textStyleBlack_25_600 => TextStyle(
      color: ColorsConst.colorBlack,
      fontSize: 25,
      fontWeight: FontWeight.w600);

  static get textStyleDark_14_400 => TextStyle(
      color: ColorsConst.color696974,
      fontSize: 15,
      fontWeight: FontWeight.w400);

  static get textStyleBlack_16_600 => TextStyle(
      color: ColorsConst.colorBlack,
      fontSize: 16,
      fontWeight: FontWeight.w600);
}

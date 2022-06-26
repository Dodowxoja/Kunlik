import 'package:flutter/material.dart';
import 'package:kunlik/core/components/texts/my_text_style_comp.dart';
import 'package:kunlik/core/constants/colors_const.dart';

class MyTextFildNameComp {
  static Text myTextFildName(text) {
    return Text(
      text,
      style: MyTextStyleComp.myTextStyle(
        color: ColorsConst.color696974,
        fontSize: 16,
        weight: FontWeight.w500,
      ),
    );
  }
}

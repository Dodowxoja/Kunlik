import 'package:flutter/material.dart';
import 'package:kunlik/core/components/texts/my_text_style_comp.dart';
import 'package:kunlik/core/constants/colors_const.dart';

class MyAppBarAuthComp {
  static AppBar myAppBarAuth(BuildContext context, titleText) {
    return AppBar(
      centerTitle: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        color: ColorsConst.colorBlack,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      elevation: 0,
      backgroundColor: ColorsConst.colorTransparent,
      title: Text(
        titleText,
        style: MyTextStyleComp.myTextStyle(
          fontSize: 18,
          weight: FontWeight.w500,
        ),
      ),
    );
  }
}

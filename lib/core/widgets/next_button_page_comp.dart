import 'package:kunlik/core/components/my_text_style_comp.dart';
import 'package:kunlik/core/constants/colors_const.dart';
import 'package:flutter/material.dart';

class NextButtonPageComp {
  static ElevatedButton nextButtonPage(BuildContext context, name, nextPage) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: ColorsConst.colorAA0023,
        fixedSize: Size(MediaQuery.of(context).size.width, 52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      child: Text(
        '$name',
        style: MyTextStyleComp.myTextStyle(
          color: ColorsConst.colorWhite,
          weight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/$nextPage');
      },
    );
  }
}

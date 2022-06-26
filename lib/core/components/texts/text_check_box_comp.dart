import 'package:flutter/material.dart';
import 'package:kunlik/core/components/texts/my_text_style_comp.dart';

class TextCheckBoxComp {
  static Text textCheckBox(type, color) {
    return Text(
      type,
      style: MyTextStyleComp.myTextStyle(
        color: color,
        fontSize: 14,
        weight: FontWeight.w400,
      ),
    );
  }
}

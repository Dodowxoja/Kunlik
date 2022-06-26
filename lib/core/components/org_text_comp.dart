import 'package:kunlik/core/constants/fonts_const.dart';
import 'package:flutter/material.dart';

class OrgText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  FontWeight? fontWeight = WeightsConst.kNormalWeight;
  TextAlign? textAlign = TextAlign.center;

  OrgText({
    Key? key,
    this.color = const Color(0xff0f1c2a),
    required this.text,
    this.size = 0,
    this.height = 1.2,
    this.fontWeight,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        color: color,
        fontFamily: 'Nunito',
        fontSize: size == 0 ? FontsConst.kSmallFont14 : size,
        fontWeight: fontWeight,
      ),
    );
  }
}

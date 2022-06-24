import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kunlik/core/components/my_text_style_comp.dart';
import 'package:kunlik/core/constants/colors_const.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: ColorsConst.colorBlack,
          onPressed: () {},
        ),
        elevation: 0,
        backgroundColor: ColorsConst.colorTransparent,
        title: Text(
          'New Registration',
          style: MyTextStyleComp.myTextStyle(
              fontSize: 18, weight: FontWeight.w500),
        ),
      ),
    );
  }
}

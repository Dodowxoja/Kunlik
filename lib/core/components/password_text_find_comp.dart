import 'package:kunlik/core/constants/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PassTextFildComp {
  static Container passTextFild(
      BuildContext context, hintText, control, obscureText, cubit) {
    return Container(
      height: 48,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(width: 1.5, color: ColorsConst.colorEAEAEA),
      ),
      child: TextFormField(
        controller: control,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: SizedBox(
            child: IconButton(
              icon: SvgPicture.asset('assets/icons/eye.svg'),
              onPressed: () {
                cubit(!obscureText);
              },
            ),
          ),
          contentPadding: const EdgeInsets.only(left: 20),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}

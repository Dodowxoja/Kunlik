import 'package:flutter/material.dart';
import 'package:kunlik/core/components/appbar/my_app_bar_auth_comp.dart';
import 'package:kunlik/core/components/buttons/next_button_page_comp.dart';
import 'package:kunlik/core/components/texts/my_text_fild_comp.dart';
import 'package:kunlik/core/components/texts/my_text_style_comp.dart';
import 'package:kunlik/core/constants/colors_const.dart';

class NumberView extends StatelessWidget {
  NumberView({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarAuthComp.myAppBarAuth(context, 'OTAC Number'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Enter Authorization Code',
              style: MyTextStyleComp.myTextStyle(
                  fontSize: 20,
                  color: ColorsConst.color171725,
                  weight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            Text(
              'We have sent SMS to:',
              style: MyTextStyleComp.myTextStyle(
                  fontSize: 16,
                  color: ColorsConst.color92929D,
                  weight: FontWeight.w400),
            ),
            Text(
              '+1 (XXX) XXX-X120',
              style: MyTextStyleComp.myTextStyle(
                color: ColorsConst.color171725,
                fontSize: 18,
                weight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 40),
            MyTextFildComp.myTextFild(controller),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text(
                  'Resend Code',
                  style: MyTextStyleComp.myTextStyle(
                      color: ColorsConst.color2ECC71, weight: FontWeight.w600),
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 40),
            NextButtonPageComp.nextButtonPage(context, 'Next', 'reset_password')
          ],
        ),
      ),
    );
  }

  Container passwordTextFormFild(BuildContext context, hintText,
      TextEditingController controller, obscureText) {
    return Container(
      height: 48,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          width: 1.5,
          color: ColorsConst.colorEAEAEA,
        ),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
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

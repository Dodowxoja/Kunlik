import 'package:flutter/material.dart';
import 'package:kunlik/core/components/my_app_bar_auth_comp.dart';
import 'package:kunlik/core/constants/colors_const.dart';

class NumberView extends StatelessWidget {
  const NumberView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarAuthComp.myAppBarAuth(context, 'OTAC Number'),
      body: Column(
        children: [
          const Text('Enter Authorization Code'),
          const Text('We have sent SMS to:'),
          const Text('+1 (XXX) XXX-X120'),
          TextFormField(
            controller: TextEditingController(),
          ),
          Align(
            child: TextButton(
              child: const Text('Resend Code'),
              onPressed: () {},
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: ColorsConst.colorAA0023,
              fixedSize: Size(MediaQuery.of(context).size.width, 52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: const Text('Next'),
            onPressed: () {
              Navigator.pushNamed(context, '/reset_password');
            },
          ),
        ],
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

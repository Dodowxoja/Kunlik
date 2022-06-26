import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kunlik/core/components/appbar/my_app_bar_auth_comp.dart';
import 'package:kunlik/core/components/texts/my_text_style_comp.dart';
import 'package:kunlik/core/constants/colors_const.dart';
import 'package:kunlik/view/auth/register/cubit/register_cubit.dart';

class ResetPasswordView extends StatelessWidget {
  ResetPasswordView({Key? key}) : super(key: key);
  final TextEditingController controlPass = TextEditingController();
  final TextEditingController controlPassConfirm = TextEditingController();
  final bool pass = true;
  final bool passConfirim = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        appBar: MyAppBarAuthComp.myAppBarAuth(context, 'Reset Password'),
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {},
          builder: (context, state) {
            bool sec1 = context.watch<RegisterCubit>().sec1;
            bool sec2 = context.watch<RegisterCubit>().sec2;
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Please fill in the field below to reset your current password.',
                    style: MyTextStyleComp.myTextStyle(
                      color: ColorsConst.color92929D,
                      fontSize: 16,
                      weight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 48),
                  myTextFormFildName('New Password'),
                  const SizedBox(height: 10),
                  passwordTextFormFild(
                    context,
                    'New Password',
                    controlPass,
                    sec1,
                    context.read<RegisterCubit>().secPass1,
                  ),
                  const SizedBox(height: 16),
                  myTextFormFildName('New Password Confirmation'),
                  const SizedBox(height: 10),
                  passwordTextFormFild(
                    context,
                    'New Password Confirmation',
                    controlPassConfirm,
                    sec2,
                    context.read<RegisterCubit>().secPass2,
                  ),
                  const SizedBox(height: 48),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: ColorsConst.colorAA0023,
                      fixedSize: Size(
                        MediaQuery.of(context).size.width,
                        52,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Text(
                      'Reset password',
                      style: MyTextStyleComp.myTextStyle(
                        color: ColorsConst.colorWhite,
                        weight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/screens', (route) => false);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Text myTextFormFildName(text) {
    return Text(
      text,
      style: MyTextStyleComp.myTextStyle(
        color: ColorsConst.color696974,
        fontSize: 16,
        weight: FontWeight.w500,
      ),
    );
  }

  Container passwordTextFormFild(
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

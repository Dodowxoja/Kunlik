import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kunlik/core/components/my_app_bar_auth_comp.dart';
import 'package:kunlik/core/components/my_text_style_comp.dart';
import 'package:kunlik/core/constants/colors_const.dart';
import 'package:kunlik/core/widgets/my_text_form_fild_widget.dart';
import 'package:kunlik/view/auth/register/cubit/register_cubit.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);

  final TextEditingController controlName = TextEditingController();
  final TextEditingController controlPhoneCode = TextEditingController();
  final TextEditingController controlPhoneNum = TextEditingController();
  final TextEditingController controlPass = TextEditingController();
  final TextEditingController controlPassConfirm = TextEditingController();
  final bool chackBox = false;
  final bool pass = true;
  final bool passConfirim = true;

  final String text =
      'It looks like you don’t have an account on this number. Please let us know some information for a secure service.';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        appBar: MyAppBarAuthComp.myAppBarAuth(context, 'New Registration'),
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {},
          builder: (context, state) {
            bool sec1 = context.watch<RegisterCubit>().sec1;
            bool sec2 = context.watch<RegisterCubit>().sec2;

            return SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.89,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //Text
                      Text(
                        text,
                        style: MyTextStyleComp.myTextStyle(
                          fontSize: 16,
                          color: ColorsConst.color92929D,
                          weight: FontWeight.w400,
                        ),
                      ),
                      //FULL Name
                      myTextFormFildName('Full Name'),
                      Container(
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: ColorsConst.colorEAEAEA,
                            width: 1.5,
                          ),
                        ),
                        child: TextFormField(
                          controller: controlName,
                          decoration: const InputDecoration(
                            hintText: 'Full Name',
                            contentPadding: EdgeInsets.only(left: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      //Phone Number
                      // myTextFormFildName('Phone Number'),
                      // MyTextFormFildWidget(
                      //   controllerPhoneCode: controlPhoneCode,
                      //   controllerPhoneNumber: controlPhoneNum,
                      //   cubit: context.watch<RegisterCubit>(),
                      // ),
                      //Password
                      myTextFormFildName('Password'),
                      passwordTextFormFild(
                        context,
                        'Password',
                        controlPass,
                        sec1,
                        context.read<RegisterCubit>().secPass1,
                      ),
                      //Password Confirmation
                      myTextFormFildName('Password Confirmation'),
                      passwordTextFormFild(
                        context,
                        'Password Confirmation',
                        controlPassConfirm,
                        sec2,
                        context.read<RegisterCubit>().secPass2,
                      ),
                      //ChackBox
                      Row(
                        children: [
                          Checkbox(
                            value: context.watch<RegisterCubit>().textCheckBox,
                            onChanged: (v) {
                              v = !v!;
                              context.read<RegisterCubit>().etidChackBox(v);
                            },
                          ),
                          textCheckBox(
                              'I accept the ', ColorsConst.color171725),
                          textCheckBox(
                              'Terms of Use ', ColorsConst.color2ECC71),
                          textCheckBox('and ', ColorsConst.color171725),
                          textCheckBox(
                              'Privacy Policy', ColorsConst.color2ECC71),
                        ],
                      ),
                      //Sign Up
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
                          'Sign Up',
                          style: MyTextStyleComp.myTextStyle(
                            color: ColorsConst.colorWhitee,
                            weight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/screens', (route) => false);
                        },
                      ),
                      //or use
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'or use',
                          style: MyTextStyleComp.myTextStyle(
                            color: ColorsConst.color92929D,
                            fontSize: 16,
                            weight: FontWeight.w400,
                          ),
                        ),
                      ),
                      //Sign Up whit Google
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: ColorsConst.colorWhitee,
                          fixedSize: Size(
                            MediaQuery.of(context).size.width,
                            52,
                          ),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side: BorderSide(
                              color: ColorsConst.color92929D,
                            ),
                          ),
                        ),
                        child: Text(
                          'Sign Up with Google',
                          style: MyTextStyleComp.myTextStyle(
                            color: ColorsConst.color171725,
                            weight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
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

  Text textCheckBox(type, color) {
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

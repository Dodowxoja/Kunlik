// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kunlik/core/components/buttons/next_button_page_comp.dart';
import 'package:kunlik/core/components/texts/my_text_style_comp.dart';
import 'package:kunlik/core/constants/colors_const.dart';
import 'package:kunlik/core/functions/sign_in_func.dart';
import 'package:kunlik/core/widgets/my_text_form_fild_widget.dart';
import 'package:kunlik/service/mock/user_data.dart';
import 'package:kunlik/view/auth/sign_in/cubit/signin_cubit.dart';

class SignInView extends StatefulWidget {
  SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController controllerPhoneCode = TextEditingController();

  TextEditingController controllerPhoneNumber = TextEditingController();

  TextEditingController controllerPassword = TextEditingController();

  var data = UserData.phoneNumber;

  String signIntext2 =
      'Welcome to Organico Mobile Apps. Please fill in the field below to sign in.';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: Scaffold(
        body: BlocConsumer<SignInCubit, SignInState>(
          listener: (context, state) {},
          builder: (context, state) {
            bool scureText = context.watch<SignInCubit>().obscure;

            return SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(child: Image.asset('assets/images/sign_in.png')),
                      Text(
                        'Welcome',
                        style: MyTextStyleComp.myTextStyle(
                          color: ColorsConst.color171725,
                          fontSize: 20,
                          weight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        signIntext2,
                        style: MyTextStyleComp.myTextStyle(
                          color: ColorsConst.color92929D,
                          fontSize: 16,
                          weight: FontWeight.w400,
                        ),
                      ),
                      //PHONE NUMBER
                      MyTextFormFildWidget(
                        controllerPhoneCode: controllerPhoneCode,
                        controllerPhoneNumber: controllerPhoneNumber,
                        cubit: context.watch<SignInCubit>(),
                      ),
                      //Password
                      Container(
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
                          controller: controllerPassword,
                          obscureText: scureText,
                          decoration: InputDecoration(
                            prefixIcon: SizedBox(
                              child: IconButton(
                                icon: SvgPicture.asset('assets/icons/lock.svg'),
                                onPressed: () {},
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon:
                                  SvgPicture.asset('assets/icons/eye_min.svg'),
                              onPressed: () {
                                context
                                    .read<SignInCubit>()
                                    .securityPass(!scureText);
                              },
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                      ),
                      //Forgot Password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          child: Text(
                            'Forgot Password',
                            style: MyTextStyleComp.myTextStyle(
                                color: ColorsConst.color2ECC71,
                                weight: FontWeight.w600),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/forgot_password',
                            );
                          },
                        ),
                      ),
                      //Register
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          child: Text(
                            'Register',
                            style: MyTextStyleComp.myTextStyle(
                              color: ColorsConst.color2ECC71,
                              weight: FontWeight.w600,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/register',
                            );
                          },
                        ),
                      ),
                      //Sign In
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
                        onPressed: () async {
                          await SignInFunc.signInFunc(
                            context,
                            controllerPhoneCode,
                            controllerPhoneNumber,
                            controllerPassword,
                            data,
                          );
                        },
                        child: const Text('Sign In'),
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
}

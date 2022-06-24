// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kunlik/core/components/my_flag.dart';
import 'package:kunlik/core/components/my_text_style_comp.dart';
import 'package:kunlik/core/constants/colors_const.dart';
import 'package:kunlik/core/functions/sign_in_func.dart';
import 'package:kunlik/core/widgets/my_text_form_fild_widget.dart';
import 'package:kunlik/service/mock/user_data.dart';
import 'package:kunlik/view/auth/sign_in/cubit/signin_cubit.dart';

class SignInView extends StatelessWidget {
  SignInView({Key? key}) : super(key: key);
  TextEditingController controllerPhoneCode = TextEditingController();
  TextEditingController controllerPhoneNumber = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  var data = UserData.phoneNumber;

  String? number;

  String? signIntext2 =
      'Welcome to Organico Mobile Apps. Please fill in the field below to sign in.';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: Scaffold(
        body: BlocConsumer<SignInCubit, SignInState>(
          listener: (context, state) {},
          builder: (context, state) {
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
                      const Text('Welcome'),
                      Text(signIntext2!),
                      //PHONE NUMBER
                      MyTextFormFildWidget(
                        controllerPhoneCode: controllerPhoneCode,
                        controllerPhoneNumber: controllerPhoneNumber,
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
                          decoration: InputDecoration(
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

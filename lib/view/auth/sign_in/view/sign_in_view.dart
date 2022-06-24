// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kunlik/core/constants/colors_const.dart';
import 'package:kunlik/view/auth/sign_in/cubit/signin_cubit.dart';

class SignInView extends StatelessWidget {
  SignInView({Key? key}) : super(key: key);
  TextEditingController? controllerPhoneCode;
  TextEditingController? controllerPhoneNumber;

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
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(child: Image.asset('assets/images/sign_in.png')),
                const Text('Welcome'),
                Text(signIntext2!),
                //PHONE NUMBER
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 48,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        width: 1.5,
                        color: ColorsConst.colorEAEAEA,
                      ),
                    ),
                    child: Row(
                      children: [
                        //Flag Phone Code
                        SizedBox(
                          width: 90,
                          height: 48,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: controllerPhoneCode,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                icon: context.watch<SignInCubit>().flag ==
                                        'null'
                                    ? const Icon(Icons.flag, size: 16)
                                    : flag(context.watch<SignInCubit>().flag),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              onChanged: (v) {
                                context.read<SignInCubit>().phoneCode(v);
                              },
                            ),
                          ),
                        ),
                        Container(
                          height: 48,
                          width: 1.5,
                          color: ColorsConst.colorEAEAEA,
                        ),
                        //Flag Phone Number
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: 48,
                          child: TextFormField(
                            controller: controllerPhoneNumber,
                            decoration: const InputDecoration(
                              hintText: 'Your Phone Number',
                              contentPadding: EdgeInsets.only(left: 20),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 48,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  CircleAvatar flag(flagName) {
    return CircleAvatar(
      radius: 10,
      backgroundImage: AssetImage('assets/icons/flags/$flagName.png'),
    );
  }
}

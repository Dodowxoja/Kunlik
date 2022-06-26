import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kunlik/core/components/my_flag.dart';
import 'package:kunlik/core/components/my_text_style_comp.dart';
import 'package:kunlik/core/constants/colors_const.dart';
import 'package:kunlik/view/auth/sign_in/cubit/signin_cubit.dart';

class MyTextFormFildWidget extends StatelessWidget {
  final TextEditingController controllerPhoneCode;
  final TextEditingController controllerPhoneNumber;
  final cubit;

  const MyTextFormFildWidget({
    required this.controllerPhoneCode,
    required this.controllerPhoneNumber,
    required this.cubit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  icon: cubit.flag == 'null'
                      ? const Icon(Icons.flag, size: 16)
                      : MyFlag.flag(cubit.flag),
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
          ),
        ],
      ),
    );
  }
}

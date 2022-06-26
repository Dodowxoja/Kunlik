import 'package:kunlik/core/constants/colors_const.dart';
import 'package:kunlik/core/extensions/context_extensions.dart';
import 'package:kunlik/view/screens/profile/pages/account_password/account_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordComp {
  static Container changePassword(
      BuildContext context, sec, hintText, password) {
    return Container(
      padding: EdgeInsets.only(left: context.w * 0.05),
      height: 48,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(width: 1.5, color: ColorsConst.colorEAEAEA),
      ),
      child: TextFormField(
        controller: TextEditingController(text: '123'),
        obscureText: sec,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: const Icon(Icons.remove_red_eye),
            onPressed: () {
              context.read<AccountPasswordCubit>().editSec1(!sec);
            },
          ),
          hintText: hintText,
          contentPadding: EdgeInsets.zero,
          border: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
        onChanged: (value) {
          password = value;
        },
        validator: (value) {
          if (value != null && value.isEmpty) {
            return 'Password is required please enter';
          }
          return null;
        },
      ),
    );
  }
}

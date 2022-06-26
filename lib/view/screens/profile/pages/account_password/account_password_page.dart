// ignore_for_file: must_be_immutable

import 'package:kunlik/core/components/change_password_comp.dart';
import 'package:kunlik/core/components/org_text_comp.dart';
import 'package:kunlik/core/constants/fonts_const.dart';
import 'package:kunlik/core/extensions/context_extensions.dart';
import 'package:kunlik/core/widgets/app_bar_widget.dart';
import 'package:kunlik/core/widgets/elevatedbutton_widget.dart';
import 'package:kunlik/view/base/base_view.dart';
import 'package:kunlik/view/screens/profile/pages/account_password/account_password_cubit.dart';
import 'package:kunlik/view/screens/profile/pages/account_password/account_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountPasswordPage extends StatelessWidget {
  AccountPasswordPage({Key? key, this.title}) : super(key: key);

  final String _password = '';
  String? title;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModal: AccountPasswordPage,
      onPageBuilder: (context, widget) {
        return BlocProvider(
          create: (context) => AccountPasswordCubit(),
          child: Scaffold(
            appBar: OrgAppBar(title: title!),
            body: BlocConsumer<AccountPasswordCubit, AccountPasswordState>(
              listener: (context, state) {},
              builder: (context, state) {
                bool sec1 = context.watch<AccountPasswordCubit>().sec1;
                bool sec2 = context.watch<AccountPasswordCubit>().sec2;
                bool sec3 = context.watch<AccountPasswordCubit>().sec3;
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      OrgText(
                        text:
                            'Please fill in the field below to change your current password.',
                        size: FontsConst.kMediumFont16,
                        fontWeight: WeightsConst.kSmallWeight400,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            //* Current Password
                            ChangePasswordComp.changePassword(
                              context,
                              sec1,
                              'Current Password',
                              _password,
                            ),
                            SizedBox(height: context.h * 0.06),
                            //* New Password
                            ChangePasswordComp.changePassword(
                              context,
                              sec2,
                              'New Password',
                              _password,
                            ),
                            SizedBox(height: context.h * 0.06),
                            //* New Password Confirmation
                            ChangePasswordComp.changePassword(
                              context,
                              sec3,
                              'New Password Confirmation',
                              _password,
                            ),
                            SizedBox(height: context.h * 0.41),
                            RedButton(
                              text: "Create an Account",
                              onpressed: () => {
                                if (_formKey.currentState!.validate()) {},
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

import 'package:kunlik/core/components/org_text_comp.dart';
import 'package:kunlik/core/constants/colors_const.dart';
import 'package:kunlik/core/constants/fonts_const.dart';
import 'package:kunlik/core/extensions/context_extensions.dart';
import 'package:kunlik/core/widgets/app_bar_widget.dart';
import 'package:kunlik/core/widgets/elevatedbutton_widget.dart';
import 'package:kunlik/core/widgets/text_from_widget.dart';
import 'package:kunlik/view/auth/sign_in/cubit/signin_cubit.dart';
import 'package:kunlik/view/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditProfilePage extends StatelessWidget {
  final String? title;
  final String? avatar;

  EditProfilePage({Key? key, this.title, this.avatar}) : super(key: key);
  TextEditingController controllerEditPhoneCode =
      TextEditingController(text: '+1');
  TextEditingController controllerEditPhoneNumber =
      TextEditingController(text: '(307) 555-0133');

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModal: EditProfilePage,
      onPageBuilder: (context, widget) {
        return BlocProvider(
          create: (context) => SignInCubit(),
          child: _scaffold(),
        );
      },
    );
  }

  Scaffold _scaffold() {
    return Scaffold(
      appBar: OrgAppBar(
        title: title!,
      ),
      body: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: context.h * 0.04,
                          bottom: context.h * 0.03,
                        ),
                        child: CircleAvatar(
                          radius: context.h * 0.09,
                          child: Image.asset(avatar!),
                        ),
                      ),
                      Positioned(
                        top: context.h * 0.17,
                        right: context.w * 0.001,
                        child: SvgPicture.asset(
                          'assets/icons/profile/editProfile_camera.svg',
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: context.h * 0.02,
                            left: context.w * 0.02,
                            bottom: context.h * 0.01),
                        child: OrgText(
                          text: 'Name',
                          color: ColorsConst.color696974,
                          size: FontsConst.kMediumFont16,
                          fontWeight: WeightsConst.kLargeWeight800,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: context.w * 0.05),
                        height: 48,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                              width: 1.5, color: ColorsConst.colorEAEAEA),
                        ),
                        child: TextFormField(
                          controller: TextEditingController(text: 'Jane Doe'),
                          decoration: const InputDecoration(
                            hintText: 'hintText',
                            contentPadding: EdgeInsets.zero,
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: context.h * 0.02,
                            left: context.w * 0.02,
                            bottom: context.h * 0.01),
                        child: OrgText(
                          text: 'Phone',
                          color: ColorsConst.color696974,
                          size: FontsConst.kMediumFont16,
                          fontWeight: WeightsConst.kLargeWeight800,
                        ),
                      ),
                      OrgTextFormFildWidget(
                        controllerPhoneCode: controllerEditPhoneCode,
                        controllerPhoneNumber: controllerEditPhoneNumber,
                        cubit: context.watch<SignInCubit>(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: context.h * 0.02,
                            left: context.w * 0.02,
                            bottom: context.h * 0.01),
                        child: OrgText(
                          text: 'Address',
                          color: ColorsConst.color696974,
                          size: FontsConst.kMediumFont16,
                          fontWeight: WeightsConst.kLargeWeight800,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: context.w * 0.05),
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            width: 1.5,
                            color: ColorsConst.colorEAEAEA,
                          ),
                        ),
                        child: TextFormField(
                          controller: TextEditingController(
                            text: '3517 W. Gray St. Utica Pennsylvania \n57867',
                          ),
                          decoration: const InputDecoration(
                            hintText: 'hintText',
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: context.h * 0.13,
                ),
                RedButton(
                  text: 'Save',
                  onpressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

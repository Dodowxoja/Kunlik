import 'package:kunlik/core/components/my_text_style_comp.dart';
import 'package:kunlik/core/constants/colors_const.dart';
import 'package:kunlik/core/extensions/context_extensions.dart';
import 'package:kunlik/view/base/base_view.dart';
import 'package:kunlik/view/screens/profile/pages/notification_settings/notification_settings_cubit.dart';
import 'package:kunlik/view/screens/profile/pages/notification_settings/notification_settings_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationSettingsPage extends StatelessWidget {
  const NotificationSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModal: NotificationSettingsPage,
      onPageBuilder: (context, widget) {
        return BlocProvider(
          create: (context) => NotificationSettingsCubit(),
          child: _scaffold(context),
        );
      },
    );
  }

  Scaffold _scaffold(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: BlocConsumer<NotificationSettingsCubit, NotificationSettingsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: context.h * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _row(
                    context,
                    "In App Notification",
                    CupertinoSwitch(
                      thumbColor:
                          context.watch<NotificationSettingsCubit>().notValue ==
                                  true
                              ? ColorsConst.color2ECC71
                              : ColorsConst.color92929D,
                      activeColor: ColorsConst.color2ECC71_15,
                      value:
                          context.watch<NotificationSettingsCubit>().notValue,
                      onChanged: (v) {
                        context.read<NotificationSettingsCubit>().editValue1(v);
                      },
                    ),
                  ),
                  _row(
                    context,
                    "New Promo",
                    CupertinoSwitch(
                      thumbColor: context
                                  .watch<NotificationSettingsCubit>()
                                  .promoValue ==
                              true
                          ? ColorsConst.color2ECC71
                          : ColorsConst.color92929D,
                      activeColor: ColorsConst.color2ECC71_15,
                      value:
                          context.watch<NotificationSettingsCubit>().promoValue,
                      onChanged: (v) {
                        context.read<NotificationSettingsCubit>().editValue2(v);
                      },
                    ),
                  ),
                  _row(
                    context,
                    "Tips & trick",
                    CupertinoSwitch(
                      thumbColor:
                          context.watch<NotificationSettingsCubit>().tipValue ==
                                  true
                              ? ColorsConst.color2ECC71
                              : ColorsConst.color92929D,
                      activeColor: ColorsConst.color2ECC71_15,
                      value:
                          context.watch<NotificationSettingsCubit>().tipValue,
                      onChanged: (v) {
                        context.read<NotificationSettingsCubit>().editValue3(v);
                      },
                    ),
                  ),
                  _row(
                    context,
                    "Update Application",
                    CupertinoSwitch(
                      thumbColor: context
                                  .watch<NotificationSettingsCubit>()
                                  .upgradeValue ==
                              true
                          ? ColorsConst.color2ECC71
                          : ColorsConst.color92929D,
                      activeColor: ColorsConst.color2ECC71_15,
                      value: context
                          .watch<NotificationSettingsCubit>()
                          .upgradeValue,
                      onChanged: (v) {
                        context.read<NotificationSettingsCubit>().editValue4(v);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Row _row(BuildContext context, String text, Widget switchh) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: MyTextStyleComp.textStyleBlack_16_600,
        ),
        switchh
      ],
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsConst.colorTransparent,
      iconTheme: IconThemeData(color: ColorsConst.colorBlack),
      elevation: 0,
      title: Text(
        'Notification',
        style: MyTextStyleComp.textStyleBlack_18_700,
      ),
    );
  }
}

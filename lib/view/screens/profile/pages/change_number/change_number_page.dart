import 'package:kunlik/core/components/org_text_comp.dart';
import 'package:kunlik/core/constants/colors_const.dart';
import 'package:kunlik/core/constants/fonts_const.dart';
import 'package:kunlik/core/extensions/context_extensions.dart';
import 'package:kunlik/core/widgets/app_bar_widget.dart';
import 'package:kunlik/core/widgets/elevatedbutton_widget.dart';
import 'package:kunlik/view/base/base_view.dart';
import 'package:flutter/material.dart';

class ChangeNumberPage extends StatelessWidget {
  const ChangeNumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModal: ChangeNumberPage,
        onPageBuilder: (context, widget) {
          return Scaffold(
            appBar: OrgAppBar(title: 'OTAC Number'),
            body: Padding(
              padding: EdgeInsets.all(context.w * 0.05),
              child: Column(
                children: [
                  OrgText(
                    text:
                        'It looks like you changed your phone number. Please enter the OTAC number that we have sent to your new phone number.',
                    fontWeight: WeightsConst.kSmallWeight400,
                    size: FontsConst.kMediumFont16,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: context.w * 0.05,
                      bottom: context.w * 0.05,
                    ),
                    padding: EdgeInsets.only(left: context.w * 0.05),
                    height: 48,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          width: 1.5, color: ColorsConst.colorEAEAEA),
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: '6 Digit Code',
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: context.w * 0.65, bottom: context.h * 0.02),
                    child: OrgText(
                      text: 'Resend Code',
                      color: ColorsConst.color2ECC71,
                      fontWeight: WeightsConst.kLargeWeight800,
                      size: FontsConst.kMediumFont16,
                    ),
                  ),
                  RedButton(text: 'Confirm', onpressed: () {})
                ],
              ),
            ),
          );
        });
  }
}

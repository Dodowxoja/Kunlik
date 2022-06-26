import 'package:kunlik/core/components/org_text_comp.dart';
import 'package:kunlik/core/constants/colors_const.dart';
import 'package:kunlik/core/constants/fonts_const.dart';
import 'package:kunlik/core/extensions/context_extensions.dart';
import 'package:kunlik/core/widgets/app_bar_widget.dart';
import 'package:kunlik/core/widgets/elevatedbutton_widget.dart';
import 'package:kunlik/view/base/base_view.dart';
import 'package:flutter/material.dart';

class AddPaymentMethodPage extends StatefulWidget {
  const AddPaymentMethodPage({Key? key}) : super(key: key);

  @override
  State<AddPaymentMethodPage> createState() => _AddPaymentMethodPageState();
}

class _AddPaymentMethodPageState extends State<AddPaymentMethodPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModal: AddPaymentMethodPage,
      onPageBuilder: (context, widget) {
        return Scaffold(
          appBar: OrgAppBar(title: 'Add Payment Method'),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrgText(
                  text: 'Select Method',
                  color: ColorsConst.color171725,
                  size: FontsConst.kLargeFont20,
                  fontWeight: WeightsConst.kLargeWeight800,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: ColorsConst.colorBlack,
                        ),
                      ),
                      OrgText(
                        text: 'Credit Card',
                        color: ColorsConst.color171725,
                        size: FontsConst.kMediumFont16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 15),
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: ColorsConst.color92929D,
                          child: CircleAvatar(
                            radius: 9,
                            backgroundColor: ColorsConst.colorWhite,
                          ),
                        ),
                      ),
                      OrgText(
                        text: 'Paypal',
                        color: ColorsConst.color171725,
                        size: FontsConst.kMediumFont16,
                      ),
                    ],
                  ),
                ),
                OrgText(
                  text: 'Details Method',
                  color: ColorsConst.color171725,
                  size: FontsConst.kLargeFont20,
                  fontWeight: WeightsConst.kLargeWeight800,
                ),
                SizedBox(height: context.h * 0.02),
                OrgText(
                  text: 'Name',
                  color: ColorsConst.color696974,
                  size: FontsConst.kMediumFont16,
                  fontWeight: WeightsConst.kLargeWeight800,
                ),
                SizedBox(height: context.h * 0.015),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(29),
                    ),
                  ),
                ),
                SizedBox(height: context.h * 0.02),
                OrgText(
                  text: 'Credit Card Number',
                  color: ColorsConst.color696974,
                  size: FontsConst.kMediumFont16,
                  fontWeight: WeightsConst.kLargeWeight800,
                ),
                SizedBox(height: context.h * 0.015),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Credit Card Number',
                    hintStyle: TextStyle(
                      color: ColorsConst.color92929D,
                      fontSize: FontsConst.kMediumFont16,
                      fontWeight: WeightsConst.kMediumWeight600,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(29),
                    ),
                  ),
                ),
                SizedBox(height: context.h * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: context.w * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OrgText(
                            text: 'CVV',
                            color: ColorsConst.color696974,
                            size: FontsConst.kMediumFont16,
                            fontWeight: WeightsConst.kLargeWeight800,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'CVV',
                              hintStyle: TextStyle(
                                color: ColorsConst.color92929D,
                                fontSize: FontsConst.kMediumFont16,
                                fontWeight: WeightsConst.kMediumWeight600,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(29),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: context.w * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OrgText(
                            text: 'Expires',
                            color: ColorsConst.color696974,
                            size: FontsConst.kMediumFont16,
                            fontWeight: WeightsConst.kLargeWeight800,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Expires',
                              hintStyle: TextStyle(
                                color: ColorsConst.color92929D,
                                fontSize: FontsConst.kMediumFont16,
                                fontWeight: WeightsConst.kMediumWeight600,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(29),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const Spacer(),
                RedButton(
                  text: 'Save',
                  onpressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

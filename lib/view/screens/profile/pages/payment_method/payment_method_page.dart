import 'package:kunlik/core/constants/colors_const.dart';
import 'package:kunlik/core/extensions/context_extensions.dart';
import 'package:kunlik/core/widgets/app_bar_widget.dart';
import 'package:kunlik/core/widgets/elevatedbutton_widget.dart';
import 'package:kunlik/core/widgets/listTile_widget.dart';
import 'package:kunlik/view/base/base_view.dart';
import 'package:flutter/material.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModal: PaymentMethodPage,
      onPageBuilder: (context, widget) {
        return Scaffold(
          appBar: OrgAppBar(title: title!),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: context.h,
              child: Column(
                children: [
                  Container(
                    height: context.h * 0.1,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: ColorsConst.colorEAEAEA),
                    ),
                    child: ListTileWidget(
                      icon: 'assets/icons/cards/creditCard.svg',
                      title: 'Credit Card',
                      onPressed: () {
                        Navigator.pushNamed(context, '/add_payment_method');
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: context.h * 0.1,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: ColorsConst.colorEAEAEA),
                    ),
                    child: ListTileWidget(
                      icon: 'assets/icons/paypal.svg',
                      title: 'PayPal',
                      onPressed: () {
                        Navigator.pushNamed(context, '/add_payment_method');
                      },
                    ),
                  ),
                  const Spacer(),
                  RedButton(
                    text: 'Add payment',
                    onpressed: () {
                      Navigator.pushNamed(context, '/add_payment_method');
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

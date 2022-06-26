import 'package:kunlik/core/components/my_text_style_comp.dart';
import 'package:kunlik/core/constants/colors_const.dart';
import 'package:kunlik/view/screens/cart/cart_cubit.dart';
import 'package:kunlik/view/screens/cart/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyBlogPage extends StatelessWidget {
  const MyBlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: _appBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _container(context, ColorsConst.color76B226_15, "broccoli"),
                    _container(context, ColorsConst.colorEA812F_15, "carrot"),
                    _elevatedButton(context),
                    _sizedBox(),
                    _text("Address"),
                    _sizedBox(),
                    _container2(
                      context,
                      ListTile(
                        title: Text(
                          "Home",
                          style: MyTextStyleComp.textStyleBlack_16_600,
                        ),
                        subtitle: Text(
                          "3517 W. Gray St. Utica, Pennsylvania 57867",
                          style: MyTextStyleComp.textStyleDark_14_400,
                        ),
                        trailing:
                            SvgPicture.asset("assets/icons/myBag_qalam.svg"),
                      ),
                    ),
                    _sizedBox(),
                    _text("Note"),
                    _sizedBox(),
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: ColorsConst.colorEAEAEA, width: 1),
                      ),
                      child: Text(
                        "Please check the product before packaging.",
                        style: MyTextStyleComp.textStyleDark_14_400,
                      ),
                    ),
                    _sizedBox(),
                    _text("Coupon"),
                    _sizedBox(),
                    _container2(
                      context,
                      ListTile(
                        leading: SvgPicture.asset(
                          "assets/icons/cards/homeScreen_cupon.svg",
                        ),
                        title: Text(
                          "Free Shipping",
                          style: MyTextStyleComp.textStyleBlack_16_600,
                        ),
                        trailing: const Icon(Icons.chevron_right),
                      ),
                    ),
                    _sizedBox(),
                    _text("Payment method"),
                    _sizedBox(),
                    _container2(
                      context,
                      ListTile(
                        leading: SvgPicture.asset(
                          "assets/icons/cards/creditCard.svg",
                        ),
                        title: Text(
                          "Credit Card",
                          style: MyTextStyleComp.textStyleBlack_16_600,
                        ),
                        trailing: const Icon(Icons.chevron_right),
                      ),
                    ),
                    _sizedBox(),
                    _row("Subtotal", "\$9.98"),
                    _sizedBox(),
                    _row("Delivery charge", "\$1"),
                    _sizedBox(),
                    _row("Coupon", "-\$1"),
                    _sizedBox(),
                    _row("Total", "\$9.98"),
                    _sizedBox(),
                    _elevatedButton2(context),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  ElevatedButton _elevatedButton2(BuildContext context) {
    return ElevatedButton(
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
      child: const Text('Order now'),
      onPressed: () {
        Navigator.pushNamed(context, '/order_status');
      },
    );
  }

  Row _row(String text, String text2, {Color? color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: MyTextStyleComp.myTextStyle(
            color: color != null
                ? ColorsConst.color92929D
                : ColorsConst.colorBlack,
            fontSize: 18,
            weight: FontWeight.w700,
          ),
        ),
        Text(
          text2,
          style: MyTextStyleComp.myTextStyle(
            color: color != null
                ? ColorsConst.color92929D
                : ColorsConst.colorBlack,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  SizedBox _sizedBox() => const SizedBox(height: 20);

  Text _text(String text) =>
      Text(text, style: MyTextStyleComp.textStyleBlack_18_700);

  Container _container2(BuildContext context, Widget child) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorsConst.colorEAEAEA, width: 1),
      ),
      child: child,
    );
  }

  ElevatedButton _elevatedButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: ColorsConst.colorWhite,
        fixedSize: Size(
          MediaQuery.of(context).size.width,
          52,
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: ColorsConst.colorAA0023, width: 1),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Add more',
            style: MyTextStyleComp.myTextStyle(
              color: ColorsConst.colorAA0023,
              fontSize: 16,
              weight: FontWeight.w700,
            ),
          ),
          Icon(Icons.add, color: ColorsConst.colorAA0023),
        ],
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/my_bag');
      },
    );
  }

  Container _container(BuildContext context, Color color, String svg) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.13,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: ColorsConst.colorEAEAEA,
          width: 1,
        ),
      ),
      child: ListTile(
        leading: SvgPicture.asset("assets/icons/vegetables/$svg.svg"),
        trailing: SizedBox(
          width: 130,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: SvgPicture.asset(
                  "assets/icons/minus.svg",
                ),
                onTap: () {
                  context.read<CartCubit>().minus(1);
                },
              ),
              Text(
                context.watch<CartCubit>().count.toString(),
                style: MyTextStyleComp.myTextStyle(
                  color: ColorsConst.colorBlack,
                  fontSize: 25,
                  weight: FontWeight.w600,
                ),
              ),
              InkWell(
                child: SvgPicture.asset("assets/icons/plus.svg"),
                onTap: () {
                  context.read<CartCubit>().plus(1);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: ColorsConst.colorWhite,
      iconTheme: IconThemeData(color: ColorsConst.colorBlack),
      elevation: 0,
      title: Text(
        "My Cart",
        style: MyTextStyleComp.textStyleBlack_18_700,
      ),
    );
  }
}

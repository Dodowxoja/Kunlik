import 'package:kunlik/core/components/my_text_style_comp.dart';
import 'package:kunlik/core/constants/colors_const.dart';
import 'package:kunlik/models/api_model.dart';
import 'package:kunlik/view/screens/cart/cart_cubit.dart';
import 'package:kunlik/view/screens/cart/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key, this.getData}) : super(key: key);

  final ApiModel? getData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        backgroundColor: ColorsConst.colorWhite,
        appBar: _appBar(),
        body: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: ColorsConst.colorWhite,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: ColorsConst.colorEAEAEA,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading:
                              SvgPicture.asset("assets/icons/myCart_home.svg"),
                          title: Text(
                            "Popey Shop - New York",
                            style: MyTextStyleComp.textStyleBlack_16_600,
                          ),
                        ),
                        _container(
                            context, ColorsConst.color76B226_15, "broccoli"),
                        _container(
                            context, ColorsConst.colorEA812F_15, "carrot"),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: MyTextStyleComp.myTextStyle(
                              color: ColorsConst.color92929D,
                              fontSize: 16,
                              weight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "\$9.98",
                            style: MyTextStyleComp.textStyleBlack_25_600,
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: ColorsConst.colorAA0023,
                          fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.64,
                            52,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: const Text('Add to bag'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/my_bag');
                        },
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Container _container(BuildContext context, Color color, String svg) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 10),
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

import 'package:kunlik/core/constants/colors_const.dart';
import 'package:kunlik/core/extensions/context_extensions.dart';
import 'package:kunlik/core/widgets/app_bar_widget.dart';
import 'package:kunlik/core/widgets/elevatedbutton_widget.dart';
import 'package:kunlik/core/widgets/listTileAddres_widget.dart';
import 'package:kunlik/view/base/base_view.dart';
import 'package:flutter/material.dart';

class MyAddressPage extends StatelessWidget {
  const MyAddressPage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModal: MyAddressPage,
      onPageBuilder: (context, widget) {
        return Scaffold(
          appBar: OrgAppBar(title: title!),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
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
                    child: ListTileAddressWidget(
                      title: 'Home',
                      subTitle: '3517 W. Gray St. Utica, Pennsylvania 57867',
                      onPressed: () {
                        Navigator.pushNamed(context, '/select_location');
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
                    child: ListTileAddressWidget(
                      title: 'Work',
                      subTitle: '2715 Ash Dr. San Jose, South Dakota 83475',
                      onPressed: () {
                        Navigator.pushNamed(context, '/select_location');
                      },
                    ),
                  ),
                  const Spacer(),
                  RedButton(
                    text: 'Add address',
                    onpressed: () {
                      Navigator.pushNamed(context, '/select_location');
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

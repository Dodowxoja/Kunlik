import 'package:kunlik/core/components/my_text_style_comp.dart';
import 'package:kunlik/core/constants/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShowDialogWidget extends StatefulWidget {
  const ShowDialogWidget({Key? key}) : super(key: key);

  @override
  State<ShowDialogWidget> createState() => _ShowDialogWidgetState();
}

class _ShowDialogWidgetState extends State<ShowDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorsConst.colorWhite,
      elevation: 0,
      title: SvgPicture.asset('assets/icons/Union.svg'),
      contentPadding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.26,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Rate the Order",
              style: MyTextStyleComp.textStyleBlack_18_700,
            ),
            Text(
              "Rate your completed order by pressing the star below.",
              style: MyTextStyleComp.textStyleDark_14_400,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/rate_star.svg"),
                  SvgPicture.asset("assets/icons/rate_star.svg"),
                  SvgPicture.asset("assets/icons/rate_star.svg"),
                  SvgPicture.asset("assets/icons/rate_starDark.svg"),
                  SvgPicture.asset("assets/icons/rate_starDark.svg"),
                ],
              ),
            ),
            ElevatedButton(
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
              child: const Text('Rate now'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

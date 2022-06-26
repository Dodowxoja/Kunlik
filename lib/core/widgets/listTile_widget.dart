import 'package:kunlik/core/components/org_text_comp.dart';
import 'package:kunlik/core/constants/colors_const.dart';
import 'package:kunlik/core/constants/fonts_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListTileWidget extends StatelessWidget {
  ListTileWidget({
    Key? key,
    this.icon,
    this.title,
    this.onPressed,
  }) : super(key: key);

  String? icon;
  String? title;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        leading: SvgPicture.asset(icon!),
        title: OrgText(
          text: title!,
          size: FontsConst.kMediumFont16,
          fontWeight: WeightsConst.kMediumWeight600,
          color: ColorsConst.colorBlack,
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

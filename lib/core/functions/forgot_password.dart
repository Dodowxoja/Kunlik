import 'package:flutter/material.dart';
import 'package:kunlik/core/constants/colors_const.dart';
import 'package:kunlik/core/components/my_messenger.dart';

class ForgotPassword {
  static forgotPassword(
    BuildContext context,
    TextEditingController phoneCode,
    TextEditingController phoneNumber,
    List data,
  ) async {
    for (int i = 0; i < data.length; i++) {
      if (data[i]['number'].toString() ==
          phoneCode.text.toString() + phoneNumber.text.toString()) {
        MyMessenger.messenger(
          context,
          "Parolingiz: ${data[i]['password'].toString()}",
          ColorsConst.color2ECC71,
        );
      } else {
        MyMessenger.messenger(
          context,
          "Unday Nomer ro'yxatda yo'q",
          ColorsConst.color2ECC71,
        );
      }
    }
  }
}

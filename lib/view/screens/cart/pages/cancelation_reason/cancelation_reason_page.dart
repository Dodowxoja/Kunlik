import 'package:kunlik/core/components/my_text_style_comp.dart';
import 'package:kunlik/core/constants/colors_const.dart';
import 'package:flutter/material.dart';

class CancelationReasonPage extends StatelessWidget {
  const CancelationReasonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConst.colorWhite,
      appBar: _appBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Select a reason for cancellation",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              container(
                txt: "Want to change the amount",
                color: const Color(0xffe1f7ea),
              ),
              container(
                txt: "Want to change the shipping method",
              ),
              container(
                txt: "Wrongly bought a food",
              ),
              container(txt: "Etc"),
              const SizedBox(height: 270),
              SizedBox(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      primary: const Color(0xffaa0123)),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/screens', (route) => false);
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column container({String? txt, Color? color}) {
    return Column(
      children: [
        Container(
          height: 62,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Color.fromARGB(255, 198, 188, 188)),
            color: color,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "$txt",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: ColorsConst.colorWhite,
      iconTheme: IconThemeData(color: ColorsConst.colorBlack),
      elevation: 0,
      title: Text(
        "Cancelation Reason",
        style: MyTextStyleComp.textStyleBlack_18_700,
      ),
    );
  }
}

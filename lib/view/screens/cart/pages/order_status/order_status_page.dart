import 'package:kunlik/core/constants/colors_const.dart';
import 'package:kunlik/core/widgets/rate_us_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderStatusPage extends StatelessWidget {
  const OrderStatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_left_rounded),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Popey Shop - New York",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  sizedBox(h: 20),
                  const Text(
                    "Order Status",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  sizedBox(h: 20),
                  Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border:
                          Border.all(color: Color.fromARGB(255, 198, 188, 188)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Received",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "09:50 AM",
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon:
                                const Icon(Icons.keyboard_arrow_right_rounded),
                          ),
                        ],
                      ),
                    ),
                  ),
                  sizedBox(h: 20),
                  const Text(
                    "Overview",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  sizedBox(h: 20),
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color.fromARGB(255, 198, 188, 188),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          row_txt(
                            txt1: "Order ID",
                            txt2: "20210302001",
                          ),
                          row_txt(
                            txt1: "Shop Name",
                            txt2: "Popey Shop - New York",
                          ),
                          row_txt(
                            txt1: "Date",
                            txt2: "20210302001",
                          ),
                          row_txt(
                            txt1: "Order ID",
                            txt2: "20210302001",
                          ),
                        ],
                      ),
                    ),
                  ),
                  sizedBox(h: 20),
                  Container(
                    height: 110,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color.fromARGB(255, 198, 188, 188),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              color: ColorsConst.colorE3553F_15,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/vegetables/carrot.svg",
                            ),
                          ),
                          sizedBox(w: 10),
                          Container(
                            padding: const EdgeInsets.all(5),
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              color: ColorsConst.color76B226_15,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/vegetables/broccoli.svg",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  sizedBox(h: 20),
                  const Text(
                    "Delivery",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  sizedBox(h: 20),
                  Container(
                    height: 110,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color.fromARGB(255, 198, 188, 188),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                    color: Color(0xffE9F0F7),
                                    borderRadius: BorderRadius.circular(15)),
                                child:
                                    const Icon(Icons.card_membership_outlined),
                              ),
                              sizedBox(w: 20),
                              const Text(
                                "Free Shipping",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  sizedBox(h: 20),
                  const Text(
                    "Payment Method",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  sizedBox(h: 20),
                  Container(
                    height: 110,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color.fromARGB(255, 198, 188, 188),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                    color: Color(0xffE9F0F7),
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Icon(
                                    Icons.featured_play_list_rounded),
                              ),
                              sizedBox(w: 20),
                              const Text(
                                "Credit Card",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  sizedBox(h: 20),
                  row_txtt(
                    txt1: "Subtotal",
                    txt2: "\$9.98",
                  ),
                  sizedBox(h: 20),
                  row_txtt(
                    txt1: "Delivery charge",
                    txt2: "\$1",
                  ),
                  sizedBox(h: 20),
                  row_txtt(
                    txt1: "Coupon",
                    txt2: "\$1",
                  ),
                  sizedBox(h: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Total",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        "\$9.98",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ],
                  ),
                  sizedBox(h: 20),
                  sizedBox(
                    h: 52,
                    w: double.infinity,
                    ch: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xffAA0023),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        "Order again",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/cancelation_reason");
                      },
                    ),
                  ),
                  sizedBox(h: 20),
                  sizedBox(
                    h: 52,
                    w: double.infinity,
                    ch: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color(0xffAA0023),
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        "Rate now",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xffAA0023),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => ShowDialogWidget(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row row_txt({String? txt1, String? txt2}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$txt1",
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        const Text(
          ":",
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        Text(
          "$txt2",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }

  Row row_txtt({String? txt1, String? txt2}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$txt1",
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        Text(
          "$txt2",
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      ],
    );
  }

  SizedBox sizedBox({double? h, double? w, Widget? ch}) => SizedBox(
        height: h,
        width: w,
        child: ch,
      );
}

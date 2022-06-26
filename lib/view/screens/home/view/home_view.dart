import 'package:kunlik/core/components/my_text_style_comp.dart';
import 'package:kunlik/core/constants/colors_const.dart';
import 'package:kunlik/models/api_model.dart';
import 'package:kunlik/service/api_service.dart';
import 'package:kunlik/view/screens/cart/view/cart_view.dart';
import 'package:kunlik/view/screens/home/pages/detail/detail_page.dart';
import 'package:kunlik/view/screens/home/pages/vegetables/vegetables_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Your Location",
                style: MyTextStyleComp.myTextStyle(
                    color: ColorsConst.color696974, fontSize: 15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "User, Location",
                    style: MyTextStyleComp.myTextStyle(
                        color: ColorsConst.colorBlack, fontSize: 18),
                  ),
                ],
              ),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.only(left: 12),
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: ColorsConst.colorF1F1F5),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: ColorsConst.color92929D),
                      const SizedBox(width: 12),
                      Text(
                        "Search doctors by name or position",
                        style: MyTextStyleComp.myTextStyle(
                            color: ColorsConst.color92929D, fontSize: 16),
                      ),
                      const SizedBox(width: 5),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/search');
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: SvgPicture.asset(
                  "assets/icons/cards/homeScreen_cupon.svg",
                ),
                title: Text("User Cupons",
                    style: MyTextStyleComp.textStyleBlack_18_700),
                subtitle: Text("Let’s use this coupon",
                    style: MyTextStyleComp.textStyleDark_14_400),
                trailing: const Icon(Icons.chevron_right),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Choose Category",
                      style: MyTextStyleComp.textStyleBlack_18_700),
                  Text("See all", style: MyTextStyleComp.textStyleDark_14_400),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: _category(context, "broccoli", "Vegetables",
                        ColorsConst.color76B226_15),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VegetablesPage(),
                        ),
                      );
                    },
                  ),
                  InkWell(
                    child: _category(context, "banana", "Fruits",
                        ColorsConst.colorF3A20C_15),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VegetablesPage(),
                        ),
                      );
                    },
                  ),
                  InkWell(
                    child: _category(
                        context, "meat", "Meats", ColorsConst.colorFE706E_25),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VegetablesPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Best Selling",
                      style: MyTextStyleComp.textStyleBlack_18_700),
                  Text("See all", style: MyTextStyleComp.textStyleDark_14_400),
                ],
              ),
              FutureBuilder(
                future: ApiService.getData(),
                builder: ((context, AsyncSnapshot<List<ApiModel>> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text("No Network"),
                    );
                  } else {
                    var dataa = snapshot.data;
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 1,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            child: Container(
                              margin: const EdgeInsets.only(right: 12),
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorsConst.color(
                                  dataa![index].name!.type.toString(),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      height: 80,
                                      width: 100,
                                      child: Image.asset(
                                        "assets/images/${dataa[index].category}/${dataa[index].name!.img}.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      dataa[index].name!.type.toString(),
                                      style:
                                          MyTextStyleComp.textStyleBlack_16_600,
                                    ),
                                    Text(
                                      dataa[index].category.toString(),
                                      style:
                                          MyTextStyleComp.textStyleDark_14_400,
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          dataa[index].name!.price.toString(),
                                          style: MyTextStyleComp
                                              .textStyleBlack_16_600,
                                        ),
                                        InkWell(
                                          child: SvgPicture.asset(
                                              "assets/icons/plus.svg"),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return CartView(
                                                    getData: dataa[index],
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    getData: dataa[index],
                                    index: index,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        itemCount: dataa!.length,
                      ),
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _category(
      BuildContext context, String icon, String text, Color color) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.16,
      width: MediaQuery.of(context).size.width * 0.28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/icons/vegetables/$icon.svg"),
          const SizedBox(height: 15),
          Text(
            text,
            style: MyTextStyleComp.myTextStyle(
              color: ColorsConst.colorBlack,
              fontSize: 15,
              weight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:kunlik/core/components/my_text_style_comp.dart';
import 'package:kunlik/core/constants/colors_const.dart';
import 'package:kunlik/models/api_model.dart';
import 'package:kunlik/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VegetablesPage extends StatelessWidget {
  const VegetablesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: FutureBuilder(
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
            var data = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(20),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 0.78,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: data!.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 12),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorsConst.color(
                        data[index].name!.type.toString(),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 80,
                            width: 100,
                            child: Image.asset(
                              "assets/images/${data[index].category}/${data[index].name!.img}.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            data[index].name!.type.toString(),
                            style: MyTextStyleComp.textStyleBlack_16_600,
                          ),
                          Text(
                            data[index].category.toString(),
                            style: MyTextStyleComp.textStyleDark_14_400,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data[index].name!.price.toString(),
                                style: MyTextStyleComp.textStyleBlack_16_600,
                              ),
                              InkWell(
                                child:
                                    SvgPicture.asset("assets/icons/plus.svg"),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        }),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      iconTheme: IconThemeData(color: ColorsConst.colorBlack),
      elevation: 0,
      backgroundColor: ColorsConst.colorWhite,
      title: Text(
        "Vegetables",
        style: MyTextStyleComp.textStyleBlack_18_700,
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset("assets/icons/sort.svg"),
          onPressed: () {},
        ),
      ],
    );
  }
}

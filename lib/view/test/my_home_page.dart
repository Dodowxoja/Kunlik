import 'package:flutter/material.dart';
import 'package:kunlik/models/api_model.dart';
import 'package:kunlik/service/api/api_date.dart';
import 'package:kunlik/view/test/categoriy_page.dart';

class MyHomePage extends StatelessWidget {
  final List<ApiModel> apiData = [];
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Home Page'),
      ),
      body: FutureBuilder(
          future: ApiService.getData(),
          builder: (context, AsyncSnapshot<List<ApiModel>> snap) {
            if (!snap.hasData) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (snap.hasError) {
              return const Center(child: Text('No Internet'));
            } else {
              List<ApiModel> data = snap.data!;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    button(context, 'Vegetables', data),
                    button(context, 'Fruits', data),
                    button(context, 'Meats', data),
                  ],
                ),
              );
            }
          }),
    );
  }

  ElevatedButton button(context, String categ, List<ApiModel> data) {
    return ElevatedButton(
      child: Text(categ),
      onPressed: () {
        for (var i = 0; i < data.length; i++) {
          if (data[i].category.toString() == categ) {
            apiData.add(data[i]);
          }
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CategPage(name: apiData)),
        );
      },
    );
  }
}

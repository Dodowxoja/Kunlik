import 'package:flutter/material.dart';
import 'package:kunlik/models/api_model.dart';
import 'package:kunlik/service/api/api_date.dart';

class CategPage extends StatelessWidget {
  final List<ApiModel> name; //!

  const CategPage({required this.name, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            name.clear();
            Navigator.pop(context);
          },
        ),
        title: const Text('Category Page'),
      ),
      body: FutureBuilder(
        future: ApiService.getData(),
        builder: (context, AsyncSnapshot<List<ApiModel>> snap) {
          if (!snap.hasData) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (snap.hasError) {
            return const Center(child: Text('No Internet'));
          } else {
            return grid1(name);
          }
        },
      ),
    );
  }

  Center grid1(List<ApiModel> data) {
    return Center(
      child: SizedBox(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1.1,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemCount: data.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(data[index].name!.toString()),
            );
          },
        ),
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kunlik/models/kunlik_model.dart';
import 'package:kunlik/service/api/api_date.dart';
import 'package:kunlik/view/auth/view/auth_view.dart';
import 'routes/my_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kunlik',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: MyRoutes.instanse.onGenerate,
      initialRoute: '/splash',
      // home: const LoginPage(),
      // home: const MyWidget(),
    );
  }
}

// class MyWidget extends StatelessWidget {
//   const MyWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: ApiService.getData(),
//       builder: (context, AsyncSnapshot<List<KunlikModels>> snap) {
//         if (!snap.hasData) {
//           return const Center(child: CircularProgressIndicator.adaptive());
//         } else if (snap.hasError) {
//           return const Center(child: Text('No Internet'));
//         } else {
//           var data = snap.data;
//           return Scaffold(
//             body: Center(
//               child: ListView.builder(
//                 itemBuilder: (ctx, inx) {
//                   return ListTile(
//                     leading: Container(
//                       height: 100,
//                       width: 100,
//                       decoration: BoxDecoration(
//                         color: Colors.transparent,
//                         border: Border.all(width: 2, color: Colors.black),
//                       ),
//                       child: Image.asset(
//                         "assets/images/${data![inx].category}/${data[inx].name!.img}.png",
//                       ),
//                     ),
//                     title: Text(data[inx].name!.type.toString()),
//                     subtitle: Text(data[inx].category.toString()),
//                   );
//                 },
//                 itemCount: data!.length,
//               ),
//             ),
//           );
//         }
//       },
//     );
//   }
// }


// TODO
// !
// ?
// //
// *
// @pram runApp

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:kunlik/models/kunlik_model.dart';
import 'package:kunlik/service/api_date.dart';
import 'routes/my_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.useAuthEmulator('localhost', 8080);
  await FirebaseStorage.instance.useStorageEmulator('localhost', 8080);
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
      // home: const MyWidget(),
    );
  }
}

// class MyWidget extends StatefulWidget {
//   const MyWidget({Key? key}) : super(key: key);

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
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
//                       height: 60,
//                       width: 60,
//                       decoration: BoxDecoration(
//                         color: Colors.transparent,
//                         border: Border.all(width: 2, color: Colors.black),
//                       ),
//                       child: SizedBox(
//                         height: 20,
//                         width: 20,
//                         child: Image.asset(
//                             "assets/images/${data![inx].category}/${data[inx].name!.img}.png"),
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

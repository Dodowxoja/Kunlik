import 'package:dio/dio.dart';
import 'package:kunlik/models/kunlik_model.dart';

class ApiService {
  static Future<List<KunlikModels>> getData() async {
    Response res = await Dio().get("http://192.168.1.103:8080/api");
    return (res.data as List).map((e) => KunlikModels.fromJson(e)).toList();
  }
}

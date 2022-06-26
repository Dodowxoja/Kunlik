import 'package:get_storage/get_storage.dart';

class GetStorageService {
  // static final GetStorageService _instance = GetStorageService._instance;
  // static GetStorageService get instace => _instance;
  // GetStorageService.init();

  static final box = GetStorage();
  static int count = 1;
}

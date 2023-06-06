import 'package:get/get.dart';
import 'package:pharma_man/controllers/auth/login_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences shared;

  Future<MyServices> init() async {
    shared = await SharedPreferences.getInstance();
    return this;
  }



}

initialService() async {
  await Get.putAsync(() => MyServices().init(),);
}

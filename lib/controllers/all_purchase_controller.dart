import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_man/model/purchase.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../core/const/api.dart';

class AllPurchaseController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  
  RxBool isloading = false.obs;
  @override
  onInit() {
    super.onInit();
    getPurchase();
  }

  Future getPurchase() async {
    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String? token = sh.getString('signup');
      final url = Uri.parse('${Api}purchases');
      var response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonData = response.body;
        return purchasesFromJson(jsonData);
      }
    } catch (e) {
      Get.snackbar(
            'Error',
            'Something went wrong',
            backgroundColor: Color.fromARGB(255, 245, 113, 103),
            snackPosition: SnackPosition.BOTTOM,
          );
    }
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

import '../const/api.dart';

class AddPurchaseController extends GetxController {
  late final TextEditingController name;
  late final TextEditingController netPrice;
  late final TextEditingController salePrice;
  late final TextEditingController supplier;
  late final TextEditingController expiryDate;
  late final TextEditingController quantity;
  late final TextEditingController cat;
  late final TextEditingController res;
final RxString scanResult = RxString('');

  Future<void> addPurchase(
    String name,
    String netPrice,
    String salePrice,
    String cat,
    String supplier,
    String expiryDate,
    String quantity,
    String res,
  ) async {
    var response =
        await http.post(Uri.parse('${Api}add-purchase'), body: <String, String>{
      'name': name,
      'net_price': netPrice,
      'salling_price': salePrice,
      'category': cat,
      'supplier': supplier,
      'expiry_date': expiryDate,
      'quantity': quantity,
      'paracode': res,
    });
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map responseBody = jsonDecode(response.body);
      Get.snackbar('Success', 'Done',
          padding: const EdgeInsets.all(10),
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.TOP);
    } else {
      //isLoading.value = false;
      Get.snackbar('Email or password', 'your information is wrong',
          padding: EdgeInsets.all(2.h),
          backgroundColor: Color.fromARGB(255, 245, 113, 103),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

 Future<void> scanCode() async {
    try {
      final result = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 
        'cancel', 
        true, 
        ScanMode.BARCODE
      );
      scanResult.value = result;
    } on PlatformException {
      scanResult.value = 'Failed';
    }
  }
  @override
  void onInit() {
    name = TextEditingController();
    netPrice = TextEditingController();
    salePrice = TextEditingController();
    supplier = TextEditingController();
    expiryDate = TextEditingController();
    quantity = TextEditingController();
    cat = TextEditingController();
    res = TextEditingController();
    super.onInit();
  }
}

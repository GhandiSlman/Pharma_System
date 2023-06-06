import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class BacodeController extends GetxController {
  RxString barcode = 'Scan it'.obs;
  String scannedBarcode = '';

  Future<void> scanBarcode() async {
    try {
      scannedBarcode = await FlutterBarcodeScanner.scanBarcode(
          '#2011CF', 'cancel', true, ScanMode.BARCODE);
      
      barcode.value = scannedBarcode;
    } catch (e) {
      barcode.value = 'unable to read this ';
    }
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

import 'controllers/barcode_controller.dart';
import 'model/test.dart';

class BarCodeTest extends StatelessWidget {
  
 BacodeController controller = Get.put(BacodeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                  '#ff6666',
                  'Cancel',
                  true,
                  ScanMode.BARCODE,
                );
                if (barcodeScanRes == '-1') {
                  controller.barCode.text = barcodeScanRes;
                  // update textfield value using GetX
                  controller.updateText(barcodeScanRes);
                }
              },
              child: Text('Scan Barcode'),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: controller.barCode,
                decoration: InputDecoration(
                  labelText: 'Scanned Value',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

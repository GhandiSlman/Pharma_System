import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:pharma_man/core/const/appcolor.dart';
import 'package:pharma_man/core/const/routes.dart';
import 'package:pharma_man/view/widgets/custom_floating_button.dart';
import 'package:pharma_man/view/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

class GetInvoiceScreen extends StatelessWidget {
  const GetInvoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
        floatingActionButton: CustomFloatingButton(
          icon: Icon(Icons.add),
          color: AppColor.color1,
          onPressed: () {
            Get.toNamed(AppRoute.addpurchase);
          },
        ),
        body: Container(
          padding: EdgeInsets.all(3.h),
          child:
           ListView(children: [
            Column(children: [
                CustomText(text: 'Invoices', size: 18.sp, wieght: FontWeight.bold, color: AppColor.color2)
            ],)
           ],)
           ,));
  }
}

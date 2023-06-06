import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_man/const/appcolor.dart';
import 'package:pharma_man/const/routes.dart';
import 'package:pharma_man/widgets/customtext.dart';
import 'package:sizer/sizer.dart';

import '../widgets/customfloatingbutton.dart';

class DebtScreen extends StatelessWidget {
  const DebtScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.white,
        
        floatingActionButton: CustomFloatingButton(
            onPressed: () {
              
              Get.toNamed(AppRoute.addDebt);
            },
            
            color: AppColor.color1,
            icon: Icon(Icons.add)),
        body: Container(
            padding: EdgeInsets.all(3.h),
            child: ListView(
              children: [
                Column(children: [
                  CustomText(
                    color: AppColor.color2,
                    text: 'Debt book',
                    size: 18.sp,
                    wieght: FontWeight.bold,
                  )
                ]),
              ],
            )),
      ),
    );
  }
}

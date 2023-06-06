import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_man/const/appcolor.dart';
import 'package:pharma_man/controllers/customer_controller.dart';
import 'package:pharma_man/controllers/sale_controller.dart';
import 'package:pharma_man/widgets/custombutton.dart';
import 'package:pharma_man/widgets/customiconbutton.dart';
import 'package:pharma_man/widgets/customtext.dart';
import 'package:pharma_man/widgets/customtextformauth.dart';
import 'package:sizer/sizer.dart';

class Customer1 extends StatelessWidget {
  CustomerController controller = Get.put(CustomerController());
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Container(
          padding: EdgeInsets.only(left: 2.h, right: 1.h),
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  CustomText(
                      text: 'Customer one', size: 15.sp, wieght: FontWeight.bold, color: AppColor.color1),
                  SizedBox(height: 3.h),
                     Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         CustomButtom(text: 'Search for medicines',width: 32.h,
                         color: AppColor.color4,
                         textColor: AppColor.color1,
                         onPressed: () {
                         showSearch(context: context, delegate: SearchDelegateX());
                           },
                         ),
                         SizedBox(width: 5.h,),
                       Padding(
                         padding: EdgeInsets.only(top: 1.h),
                         child: CustomIconButton(
                          icon: Icon(Icons.qr_code,color: AppColor.grey,),
                          onPressed: () {
                           
                          },
                         ),
                       ),
                       ],
                     ),
                ],
              ),
            ],
          )),
    );
  }
}
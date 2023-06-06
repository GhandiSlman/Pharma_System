import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_man/const/appcolor.dart';
import 'package:pharma_man/widgets/customappbar.dart';
import 'package:pharma_man/widgets/customback.dart';
import 'package:pharma_man/widgets/custombutton.dart';
import 'package:pharma_man/widgets/customiconbutton.dart';
import 'package:pharma_man/widgets/customtext.dart';
import 'package:pharma_man/widgets/customtextbutton.dart';
import 'package:pharma_man/widgets/customtextform.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/addpurchase_controller.dart';
import '../../functions/menu.dart';
import '../../test.dart';

class AddPurchase extends StatelessWidget {
  final AddPurchaseController controller = Get.put(AddPurchaseController());
  String? vaass;
  String? nfv;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: CustomAppBar(
        title: 'Add invoice',
        actions: [
          CustomIconButton(
              icon: Icon(
                Icons.supervisor_account_outlined,
                color: AppColor.white,
              ),
              onPressed: () {
                showPopupMenu(
                  context,
                );
              }),
          CustomIconButton(
              icon: Icon(Icons.category_outlined),
              onPressed: () {
                showPopupMenu2(context);
              })
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(3.h),
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 13.h,),
                Row(
                  children: [
                    SizedBox(
                      width: 66.w,
                      child: CustomTextForm(hint: 'Barcode',
                      icon: Icons.qr_code_2_outlined,
                      )
                      ),
                      SizedBox(width:6.w,),
                        CustomIconButton(
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          color: AppColor.grey,
                        ),
                        onPressed: () {})
                  ],
                ),
                SizedBox(height: 1.5.h,),
                CustomTextForm(hint: 'Name of medicine',
                icon: Icons.medication_outlined,
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    SizedBox(width: 41.w,child: CustomTextForm(hint: 'Net price',
                    icon: Icons.attach_money_rounded,
                    )),
                    SizedBox(width: 5.w,),
                    SizedBox(width:41.w,child: CustomTextForm(hint: 'Sale price',
                    icon: Icons.attach_money_rounded,
                    )),
                  ],
                ),
                SizedBox(height: 1.5.h),
                Row(
                  children: [
                    SizedBox(width: 41.w,child: CustomTextForm(hint: 'Expiry date',
                    icon: Icons.history_toggle_off,
                    )),
                    SizedBox(width: 5.w,),
                    SizedBox(width:41.w,child: CustomTextForm(hint: 'Quantity',
                    icon: Icons.add
                    ),),
                  ],
                ),
                SizedBox(height: 1.5.h,),
                 CustomButtom(text: 'Add Image',
                 width: 12.h,
                 onPressed: (){},
                 color: AppColor.color1,
                 // gradient: LinearGradient(colors: [AppColor.color1,AppColor.color2],begin: Alignment.bottomCenter,end: Alignment.topCenter),
                    textColor: AppColor.white,
                 ),
                SizedBox(
                  height: 2.5.h,
                ),
                SizedBox(height: 6.h),
                CustomButtom(
                    text: 'Add Invoice',
                   
                    onPressed: () {},
                    gradient: LinearGradient(colors: [AppColor.color1,AppColor.color2],begin: Alignment.bottomCenter,end: Alignment.topCenter),
                    textColor: AppColor.white,
                    width: double.infinity),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

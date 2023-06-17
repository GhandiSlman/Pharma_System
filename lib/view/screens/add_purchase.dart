
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pharma_man/controllers/barcode_controller.dart';
import 'package:pharma_man/controllers/categories_controller.dart';
import 'package:sizer/sizer.dart';
import '../../controllers/add_purchase_controller.dart';
import '../../controllers/suppliers_controller.dart';
import '../../core/const/appcolor.dart';
import '../../core/functions/valid.dart';
import '../widgets/card_categories.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/custom_supplier.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form.dart';

class AddPurchase extends StatelessWidget {
  AddPurchase({Key? key}) : super(key: key);
  final AddPurchaseController controller = Get.put(AddPurchaseController());
  final BacodeController controller1 = Get.put(BacodeController());
  final Catergores controller2 = Get.put(Catergores());
  final SuppliersCotroller controller3 = Get.put(SuppliersCotroller());
 // final ImageController controller4 = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          backgroundColor: AppColor.white,
          appBar: CustomAppBar(
            title: 'Add invoice',
            actions: [CustomIconButton(icon: Icon(Icons.image_outlined), onPressed: (){}),],
          ),
          body: Obx(
            () => controller.isLoading.value
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: CircularProgressIndicator(
                        color: AppColor.color1,
                      )),
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomText(
                          text: 'Adding...',
                          size: 10.sp,
                          wieght: FontWeight.bold,
                          color: AppColor.grey),
                    ],
                  )
                : Container(
                       padding: EdgeInsets.all(2.h),
                      child: Form(
                        key: controller.formState,
                        child: ListView(
                          children: [
                            Column(children: [
                               SizedBox(
                              height: 4.h,
                            ),
                                CustomText(
                                  text: 'choose category: ',
                                  size: 15.sp,
                                  wieght: FontWeight.normal,
                                  color: AppColor.grey,
                                  fontFamily: 'Pacifico',
                                ),
                                SizedBox(height: 1.h,),
                                CardCategories(),
                              
                            SizedBox(
                              height: 2.h,
                            ),
                           
                                SizedBox(
                                  width: 0.9.w,
                                ),
                                CustomText(
                                  text: 'choose supplier: ',
                                  size: 15.sp,
                                  wieght: FontWeight.normal,
                                  color: AppColor.grey,
                                  fontFamily: 'Pacifico',
                                ),
                                 SizedBox(height: 1.h,),
                                 CustomSuppliers(),
                             
                            SizedBox(
                              height: 1.5.h,
                            ),
                           
                            //  padding: EdgeInsets.all(3.h),
                               
                                  Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                    indent: 20,
                                    endIndent: 20,
                                  ),
                                  SizedBox(
                                    height: 2.5.h,
                                  ),
                                  Row(
                                    //mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          width: 65.w,
                                          child: CustomTextForm(
                                            mycontroller: controller1.barCode,
                                            hint: 'Barcode',
                                            icon: Icons.qr_code_2_outlined,
                                          )),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      CustomIconButton(
                                        icon: Icon(
                                          Icons.camera_alt_outlined,
                                          color: AppColor.grey,
                                        ),
                                        onPressed: () async {
                                          controller1.scanBarcode();
                                        },
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                  CustomTextForm(
                                    hint: 'Name of medicine',
                                    mycontroller: controller.name,
                                    icon: Icons.medication_outlined,
                                    validator: (val) {
                                      return validInput(val!, 0, 50, '');
                                    },
                                  ),
                                  SizedBox(height: 5.h),
                                  Row(
                                    children: [
                                      SizedBox(
                                          width: 41.w,
                                          child: CustomTextForm(
                                            mycontroller: controller.netPrice,
                                            hint: 'Net price',
                                            icon: Icons.attach_money_rounded,
                                            validator: (val) {
                                              return validInput(val!, 0, 50, '');
                                            },
                                          )),
                                      SizedBox(
                                        width: 9.w,
                                      ),
                                      SizedBox(
                                          width: 41.w,
                                          child: CustomTextForm(
                                            hint: 'Sale price',
                                            mycontroller: controller.salePrice,
                                            icon: Icons.attach_money_rounded,
                                            validator: (val) {
                                              return validInput(val!, 0, 50, '');
                                            },
                                          )),
                                    ],
                                  ),
                                  SizedBox(height: 1.5.h),
                                  Row(
                                    children: [
                                      SizedBox(
                                          width: 41.w,
                                          child: CustomTextForm(
                                            hint: 'Expiry date',
                                            mycontroller: controller.expiryDate,
                                            icon: Icons.history_toggle_off,
                                            validator: (val) {
                                              return validInput(val!, 0, 50, '');
                                            },
                                          )),
                                      SizedBox(
                                        width: 9.w,
                                      ),
                                      SizedBox(
                                        width: 41.w,
                                        child: CustomTextForm(
                                            hint: 'Quantity',
                                            mycontroller: controller.quantity,
                                            validator: (val) {
                                              return validInput(val!, 0, 50, '');
                                            },
                                            icon: Icons.add),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  CustomButtom(
                                      text: 'Add Invoice',
                                      onPressed: () {
                                        controller.addpurchase(
                                            controller.name.text,
                                            controller.netPrice.text,
                                            controller.salePrice.text,
                                            controller2.id.value.toString(),
                                            controller3.id.value.toString(),
                                            controller.expiryDate.text,
                                            controller.quantity.text,
                                            controller1.barCode.text);
                                      },
                                      gradient: LinearGradient(
                                          colors: [
                                            AppColor.color1,
                                            AppColor.color2
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter),
                                      textColor: AppColor.white,
                                      width: double.infinity),
 
                            ]),
                          ],   
                        ),
                      ),
                    ),
                  ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pharma_man/controllers/drawer_controller.dart';
import 'package:pharma_man/controllers/home_controller.dart';


import 'package:sizer/sizer.dart';

import '../../core/const/appcolor.dart';
import '../../core/const/routes.dart';
import '../widgets/card_items.dart';
import '../widgets/carousel_items.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/custom_text.dart';

class HomePage extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());
  DrawController controller2 = Get.put(DrawController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(2.sp),
      child: Scaffold(
        key: controller2.key,
        drawer: Drawer(
           width: 70.w,
            child: ListView(
              children: [
                Container(
                  width: double.infinity,
                  height: 20.h,
                  child: Center(
                    child: CustomText(
                        text: 'Pharma Care',
                        size: 20.sp,
                        wieght: FontWeight.normal,
                        color: AppColor.white),
                  ),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(5.h),
                    topLeft: Radius.circular(5.h)),
                        color: AppColor.color1
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                ListTile(
                  leading: Icon(Icons.add),
                  title: CustomText(
                      text: 'Add Supplier',
                      size: 12.sp,
                      wieght: FontWeight.bold,
                      color: AppColor.black),
                  onTap: () {
                    Get.toNamed(AppRoute.postSuppliersScreen);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.supervisor_account_outlined),
                  title: CustomText(
                      text: 'All Suppliers',
                      size: 12.sp,
                      wieght: FontWeight.bold,
                      color: AppColor.black),
                  onTap: () {
                    Get.toNamed(AppRoute.allsuppliers);
                  },
                ),
                 ListTile(
                  leading: Icon(Icons.add),
                  title: CustomText(
                      text: 'Add Employes',
                      size: 12.sp,
                      wieght: FontWeight.bold,
                      color: AppColor.black),
                  onTap: () {
                    Get.toNamed(AppRoute.addEmploye);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.supervisor_account_outlined),
                  title: CustomText(
                      text: 'All Employes',
                      size: 12.sp,
                      wieght: FontWeight.bold,
                      color: AppColor.black),
                  onTap: () {
                    Get.toNamed(AppRoute.allEmployees);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings_outlined),
                  title: CustomText(
                      text: 'Settings',
                      size: 12.sp,
                      wieght: FontWeight.bold,
                      color: AppColor.black),
                  onTap: () {},
                ),
              ],
            )),
        backgroundColor: AppColor.white,
        body: Column(children: [
          Stack(
            children: [
              Container(
                height: 21.h,
                // MediaQuery.of(context).size.height-590,
                width: double.infinity,
                decoration: BoxDecoration(
                  // gradient: LinearGradient(
                  //       colors: [AppColor.color1, AppColor.color2]),
                  color: AppColor.color1,
                  borderRadius: BorderRadius.only(
                    // bottomLeft: Radius.circular(70),
                    bottomRight: Radius.circular(5.h),
                    topLeft: Radius.circular(5.h)
                  ),
              
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomIconButton(
                              icon: Icon(
                                Icons.menu_sharp,
                                color: AppColor.white,
                                size: 4.h,
                              ),
                              onPressed: () {
                                controller2.openDrawer();
                              }),
                          SizedBox(
                            height: 7.h,
                            width: 70.w,
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: CustomText(
                        overflow: TextOverflow.clip,
                        text: 'Pharma_Care',
                        size: 25.sp,
                        color: AppColor.white,
                        wieght: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
          
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          CarouselSliderItems(),
          
          CardItems(),
        ]),
      ),
    );
  }
}

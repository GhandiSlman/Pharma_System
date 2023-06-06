import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_man/const/appcolor.dart';
import 'package:pharma_man/const/routes.dart';
import 'package:pharma_man/controllers/auth/login_controller.dart';
import 'package:pharma_man/controllers/drawer_controller.dart';
import 'package:pharma_man/controllers/home_controller.dart';
import 'package:pharma_man/widgets/card_items.dart';
import 'package:pharma_man/widgets/customiconbutton.dart';
import 'package:pharma_man/widgets/customtext.dart';

import 'package:sizer/sizer.dart';

import '../widgets/carousel_items.dart';

class HomePage extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());
  DrawController controller2 = Get.put(DrawController());
  
  LoginController controller3 = Get.find<LoginController>();
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                      // gradient: LinearGradient(
                      //     colors: [AppColor.color1, AppColor.color2]),
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(5.h)),
                      color: AppColor.color1),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Obx(() {
                  
                  if (controller3.isAdmin.value) {
                    return Column(
                      children: [
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
                          leading: Icon(Icons.settings_outlined),
                          title: CustomText(
                              text: 'Settings',
                              size: 12.sp,
                              wieght: FontWeight.bold,
                              color: AppColor.black),
                          onTap: () {},
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
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
                          leading: Icon(Icons.settings_outlined),
                          title: CustomText(
                              text: 'Settings',
                              size: 12.sp,
                              wieght: FontWeight.bold,
                              color: AppColor.black),
                          onTap: () {},
                        ),
                      ],
                    );
                  }
                })
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
                    bottomRight: Radius.circular(10.h),
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
              Positioned(
                bottom: -10,
                right: 30,
                child: Stack(
                  children: [],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          CarouselSliderItems(),
          const SizedBox(
            height: 10,
          ),
          CardItems(),
        ]),
      ),
    );
  }
}

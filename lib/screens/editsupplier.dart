import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_man/const/routes.dart';
import 'package:pharma_man/controllers/postsupplier_controller.dart';
import 'package:pharma_man/widgets/customappbar.dart';
import 'package:pharma_man/widgets/custombutton.dart';
import 'package:sizer/sizer.dart';

import '../const/appcolor.dart';
import '../widgets/customtextform.dart';

class EditSupplier extends StatelessWidget {
  PostSupplierController controller = Get.put(PostSupplierController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Edit the info',
        ),
        body: Container(
          padding: EdgeInsets.only(right: 3.h, left: 3.h, top: 25.h),
          child: ListView(
            //   mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                  // shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: 41.w,
                            child: CustomTextForm(
                              hint: 'Name',
                              mycontroller: controller.name,
                              onChanged: (value) =>
                                  controller.editedSupplier.value.name = value,
                            )),
                        SizedBox(
                          width: 4.w,
                        ),
                        SizedBox(
                          width: 41.w,
                          child: CustomTextForm(
                            hint: 'Phone',
                            mycontroller: controller.phone,
                            onChanged: (value) =>
                                controller.editedSupplier.value.phone = value,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: 41.w,
                            child: CustomTextForm(
                              hint: 'Company',
                              mycontroller: controller.company,
                              onChanged: (value) => controller
                                  .editedSupplier.value.company = value,
                            )),
                        SizedBox(
                          width: 4.w,
                        ),
                        SizedBox(
                            width: 41.w,
                            child: CustomTextForm(
                              hint: 'Address',
                              mycontroller: controller.address,
                              onChanged: (value) => controller
                                  .editedSupplier.value.address = value,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: 41.w,
                            child: CustomTextForm(
                              hint: 'Email',
                              mycontroller: controller.email,
                              type: TextInputType.emailAddress,
                              onChanged: (value) =>
                                  controller.editedSupplier.value.email = value,
                            )),
                        SizedBox(
                          width: 4.w,
                        ),
                        SizedBox(
                            width: 41.w,
                            child: CustomTextForm(
                              hint: 'Description',
                              onChanged: (value) =>
                                  controller.editedSupplier.value.desc = value,
                              mycontroller: controller.desc,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomButtom(
                      text: 'Done',
                      onPressed: () async {
                        await controller.updateNote(
                            controller.id,
                            controller.name.text,
                            controller.email.text,
                            controller.phone.text,
                            controller.address.text,
                            controller.company.text,
                            controller.desc.text);
                        Get.offNamed(AppRoute.allsuppliers);
                        //controller.update();
                      },
                      textColor: AppColor.white,
                      gradient: LinearGradient(
                          colors: [
                            AppColor.color1,
                            AppColor.color2,
                            AppColor.color3
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter),
                      width: double.infinity,
                    )
                  ]),
            ],
          ),
        ));
  }
}

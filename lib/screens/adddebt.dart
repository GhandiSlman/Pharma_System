import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:pharma_man/const/appcolor.dart';
import 'package:pharma_man/functions/valid.dart';
import 'package:pharma_man/widgets/customappbar.dart';
import 'package:pharma_man/widgets/custombutton.dart';
import 'package:pharma_man/widgets/customiconbutton.dart';
import 'package:pharma_man/widgets/customtextform.dart';
import 'package:sizer/sizer.dart';

import '../widgets/customback.dart';

class AddDebt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add Debt',
      ),
      backgroundColor: AppColor.white,
      body: Container(
        padding: EdgeInsets.all(3.h),
        child: Form(
          child: ListView(children: [
            Column(
              children: [
                
                SizedBox(
                  height: 14.h,
                ),
                CustomTextForm(hint: 'Name of person',
                icon: Icons.person_outline_outlined,
                 validator: (val) {
                   return validInput(val!, 3, 50, 'username');
                  },
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                CustomTextForm(hint: 'Name of midicines',
                icon: Icons.medication_outlined,
                 validator: (val) {
                   return validInput(val!, 3, 50, '');
                  },
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                CustomTextForm(hint: 'Date of debt',
                icon: Icons.history_toggle_off,
                 validator: (val) {
                   return validInput(val!, 3, 50, '');
                  },
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                CustomTextForm(
                  hint: 'price',
                  icon: Icons.attach_money_rounded,
                  validator: (val) {
                   return validInput(val!, 3, 50, '');
                  },
                ),
                SizedBox(
                  height: 18.h,
                ),
               
                CustomButtom(
                  text: 'Add',
                  onPressed: () {},
                  gradient: LinearGradient(colors: [AppColor.color1,AppColor.color2],begin: Alignment.bottomCenter,end: Alignment.topCenter),
                  textColor: AppColor.white,
                  width: double.infinity,
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}

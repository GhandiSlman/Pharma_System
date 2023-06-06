import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pharma_man/const/appcolor.dart';
import 'package:pharma_man/controllers/auth/login_controller.dart';
import 'package:pharma_man/screens/alarm.dart';
import 'package:pharma_man/screens/getinvoice.dart';
import 'package:pharma_man/screens/home.dart';

import 'package:sizer/sizer.dart';

import '../controllers/main_controller.dart';
import '../controllers/sale_controller.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  MainController controller = Get.put(MainController());
  LoginController controller2 = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // appBar: AppBar(backgroundColor: AppColor.color1,),
      //   drawer:Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       DrawerHeader(
      //         child: Text('Drawer Header'),
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //       ),
      //       ListTile(
      //         title: Text('Item 1'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Item 2'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      backgroundColor: AppColor.white,
//         bottomNavigationBar: CurvedNavigationBar(
//             color: AppColor.color1,
//             backgroundColor: AppColor.white,
//             height: 50,
//             animationDuration: const Duration(
//               milliseconds: 10,
//             ),
//             items: [
//               Icon(Icons.home, size: 30, color: AppColor.white),
//               Icon(Icons.money_off, size: 30, color: AppColor.white),
//               Icon(Icons.person_add, size: 30, color: AppColor.white),
//               Icon(Icons.alarm, size: 30, color: AppColor.white),
//             ],
//             index: controller.currentIndexNav.value,
//             onTap: (selectedIndex) {
//               controller.currentIndexNav.value = selectedIndex;
//             }),
//         body: getSelectedWidget(index: controller.currentIndexNav.value),
//       );
//     }));
//   }
// }

// Widget getSelectedWidget({required int index}) {
//   Widget widget;
//   switch (index) {
//     case 0:
//       widget = HomePage();
//       break;
//     case 1:
//       widget = const DebtScreen();
//       break;
//     case 2:
//       widget = const GetSuppliersScreen();
//       break;
//     case 3:
//       widget = const AlarmScreen();
//       break;
//     default:
//       widget = HomePage();
//       break;
//   }
//   return widget;
// }
      body: Obx(() => controller2.isAdmin.value? controller.pages[controller.selectedIndex.value]:controller.pages2[controller.selectedIndex.value],),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(1.5.h),
        child: Container(
          padding: EdgeInsets.all(1.5.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.h),
            color: AppColor.color1,
          ),
          child: 
          controller2.isAdmin.value == true ?
          GNav(
              backgroundColor: AppColor.color1,
              color: AppColor.white,
              activeColor: AppColor.white,
              tabBackgroundColor: AppColor.white,
              padding: EdgeInsets.all(0.5.h),
              selectedIndex: controller.selectedIndex.value,
              onTabChange: (selectedIndex) {
                controller.selectedIndex.value = selectedIndex;
              },
              gap: 10,
               
              tabs: [
                
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Home',
                  textColor: AppColor.color1,
                  iconActiveColor: AppColor.color1,
                ),
                GButton(
                  icon: Icons.local_offer_outlined,
                  text: 'Sales',
                  textColor: AppColor.color1,
                  iconActiveColor: AppColor.color1,
                ),
                GButton(
                  icon: Icons.insert_invitation_outlined,
                  text: 'Invoices',
                  textColor: AppColor.color1,
                  iconActiveColor: AppColor.color1,
                ),
                GButton(
                  icon: Icons.monetization_on_outlined,
                  text: 'Debt',
                  textColor: AppColor.color1,
                  iconActiveColor: AppColor.color1,
                ),
                GButton(
                  icon: Icons.notifications_none_outlined,
                  text: 'Notifications',
                  textColor: AppColor.color1,
                  iconActiveColor: AppColor.color1,
                ),
              ]):GNav(
              backgroundColor: AppColor.color1,
              color: AppColor.white,
              activeColor: AppColor.white,
              tabBackgroundColor: AppColor.white,
              padding: EdgeInsets.all(0.5.h),
              selectedIndex: controller.selectedIndex.value,
              onTabChange: (selectedIndex) {
                controller.selectedIndex.value = selectedIndex;
              },
              gap: 10,
               
              tabs: [
                
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Home',
                  textColor: AppColor.color1,
                  iconActiveColor: AppColor.color1,
                ),
                GButton(
                  icon: Icons.local_offer_outlined,
                  text: 'Sales',
                  textColor: AppColor.color1,
                  iconActiveColor: AppColor.color1,
                ),
                GButton(
                  icon: Icons.insert_invitation_outlined,
                  text: 'Invoices',
                  textColor: AppColor.color1,
                  iconActiveColor: AppColor.color1,
                ),
                
                GButton(
                  icon: Icons.notifications_none_outlined,
                  text: 'Notifications',
                  textColor: AppColor.color1,
                  iconActiveColor: AppColor.color1,
                ),
              ]),
        ),
      ),
    ));
  }
}

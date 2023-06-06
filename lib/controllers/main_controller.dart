import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pharma_man/controllers/auth/login_controller.dart';
import 'package:pharma_man/screens/alarm.dart';
import 'package:pharma_man/screens/allsuppliers.dart';
import 'package:pharma_man/screens/getinvoice.dart';

import '../screens/debt.dart';
import '../screens/home.dart';
import '../screens/sale/mainsale.dart';

class MainController extends GetxController {
  LoginController controller = Get.put(LoginController());
// RxInt currentIndexNav = 0.obs;
  RxInt currentIndexCarousel = 0.obs;
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
  
  final List<Widget> pages = [
    HomePage(),
    MainSale(),
    GetInvoiceScreen(),
    DebtScreen(),
    AlarmScreen(),
  ];
  final List<Widget> pages2 = [
    HomePage(),
    MainSale(),
    GetInvoiceScreen(),
    AlarmScreen(),
  ];
  final selectedIndex = RxInt(0);
}

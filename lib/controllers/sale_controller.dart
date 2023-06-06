import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pharma_man/const/appcolor.dart';
import 'package:pharma_man/screens/sale/customer2.dart';
import 'package:pharma_man/screens/sale/customer3.dart';
import 'package:pharma_man/screens/sale/customer4.dart';

import '../screens/sale/customer1.dart';

class SaleController extends GetxController {
  final List<Widget> pages = [
    Customer1(),
    Customer2(),
    Customer3(),
    Customer4(),
  ];

  final selectedIndex = RxInt(0);

}

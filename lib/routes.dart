import 'package:get/get.dart';
import 'package:pharma_man/screens/adddebt.dart';
import 'package:pharma_man/screens/allsuppliers.dart';
import 'package:pharma_man/screens/auth/checkcode.dart';
import 'package:pharma_man/screens/auth/forgetpass.dart';
import 'package:pharma_man/screens/auth/login.dart';
import 'package:pharma_man/screens/auth/signup.dart';
import 'package:pharma_man/screens/editsupplier.dart';
import 'package:pharma_man/screens/home.dart';
import 'package:pharma_man/screens/main.dart';
import 'package:pharma_man/screens/postsupplier.dart';
import 'package:pharma_man/screens/purchase.dart';
import 'package:pharma_man/screens/sale/addpurchase.dart';
import 'package:pharma_man/screens/sale/mainsale.dart';
import 'package:pharma_man/screens/sales.dart';

import 'middleware/auth_middleware.dart';
List<GetPage<dynamic>>? routes = [
    GetPage(name: '/', page:() => Login(),middlewares: [MyMiddleWare()]),
    GetPage(name: '/signup', page:() => SignUp()),
    GetPage(name: '/home', page:() => HomePage()),
    GetPage(name: '/forgetpass', page:() => ForgetPass()),
    GetPage(name: '/checkcode', page:() => CheckCode()),
    GetPage(name: '/mainscreen', page: () => MainScreen()),
    GetPage(name: '/purchasesscreen', page: ()=> PurchasesScreen()),
    GetPage(name: '/slaesscreen', page: ()=> SalesScreen() ),
    GetPage(name: '/postsuppliers', page: ()=> PostSuppliersScreen() ),
    GetPage(name: '/addpurchase', page:() => AddPurchase()),
    GetPage(name: '/mainsale', page:() => MainSale()),
    GetPage(name: '/adddebt', page:() => AddDebt()),
    GetPage(name: '/allsuppliers', page:() => AllSuppliers()),
    GetPage(name: '/editsupplier', page:() => EditSupplier()),
];

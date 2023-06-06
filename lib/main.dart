import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pharma_man/routes.dart';
import 'package:pharma_man/screens/auth/login.dart';
import 'package:pharma_man/screens/bar.dart';
import 'package:pharma_man/screens/postsupplier.dart';
import 'package:pharma_man/services/services.dart';
import 'package:pharma_man/test.dart';
import 'package:sizer/sizer.dart';
import 'const/routes.dart';
import 'controllers/auth/login_controller.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await initialService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetBuilder<LoginController>( 

          init: LoginController(),
          builder: (controller) =>
          GetMaterialApp(
        debugShowCheckedModeBanner: false,

        getPages: routes,
        // home:Login(),
      )
          );
    });
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:pharma_man/routes.dart';
// import 'package:pharma_man/screens/auth/login.dart';
// import 'package:pharma_man/screens/bar.dart';
// import 'package:pharma_man/screens/postsupplier.dart';
// import 'package:pharma_man/services/services.dart';
// import 'package:pharma_man/test.dart';
// import 'package:sizer/sizer.dart';
// import 'const/routes.dart';
// import 'controllers/auth/login_controller.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await initialService();
//   await GetStorage.init();
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return Sizer(builder: (context, orientation, deviceType) {
//       return GetMaterialApp(
//         debugShowCheckedModeBanner: false,
//         initialBinding: BindingsBuilder(() {
//           Get.put(LoginController());
//           Get.put(MyServices());
//         }),
//         getPages: routes,
//         // home:Login(),
//         builder: (context, child) {
//           return GetBuilder<LoginController>(
//             init: LoginController(),
//             builder: (controller) {
//               return GestureDetector(
//                 onTap: () {
//                   FocusScopeNode currentFocus = FocusScope.of(context);
//                   if (!currentFocus.hasPrimaryFocus &&
//                       currentFocus.focusedChild != null) {
//                     currentFocus.focusedChild?.unfocus();
//                   }
//                 },
//                 child: child,
//               );
//             },
//           );
//         },
//       );
//     });
//   }
// }

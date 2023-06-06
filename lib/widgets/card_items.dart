import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_man/const/appcolor.dart';
import 'package:pharma_man/widgets/customtext.dart';


import '../controllers/home_controller.dart';
import '../model/product.dart';
import '../screens/productdetails.dart';

class CardItems extends StatelessWidget {
  CardItems({Key? key}) : super(key: key);
  final ProductController controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Padding(
          padding: EdgeInsets.only(top: 130),
          child: CircularProgressIndicator(
            color: AppColor.color1,
          ),
        );
      } else {
        return Expanded(
          child: GridView.builder(
              itemCount: controller.productList.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 2,
                maxCrossAxisExtent: MediaQuery.of(context).size.width,
              ),
              itemBuilder: (context, index) {
                return buildCardItems(
                  image: controller.productList[index].image,
                  price: controller.productList[index].price,


                  rating: controller.productList[index].rating,
                  title: controller.productList[index].title,
                  description: controller.productList[index].description,
                  ontap: () {
                    Get.to(()=>ProductDetails(
                      product: controller.productList[index],
                    ));
                  },
                );
              }),
        );
      }
    });
  }
}

Widget buildCardItems({
  required String image,
  required double price,
  required Rating rating,
  required String title,
  required String description,
  required Function() ontap,
}) {
  return Padding(
    padding: EdgeInsets.all(5),
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 3,
                    blurRadius: 5,
                  ),
                ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: ontap,
            child: Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: AppColor.white),
              child: Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Container(
                      height: 140,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(
                        image,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Expanded(
                    child: Container(
                      // color: black,
                      height: 140,
                      width: 200,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //   crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            CustomText(
                              textAlign: TextAlign.center,
                              text: title,
                              size: 20,
                              color: AppColor.black,
                              wieght: FontWeight.w900,
                              overflow: TextOverflow.ellipsis,
                              textDirection: TextDirection.ltr,
                            ),
                            CustomText(
                              textAlign: TextAlign.center,
                              text: description,
                              size: 15,
                              color: AppColor.grey,
                              wieght: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                              textDirection: TextDirection.ltr,
                              
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 9),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
                                    child: CustomText(
                                        overflow: TextOverflow.clip,
                                        text: "\$${price}",
                                        size: 15,
                                        color: Colors.black,
                                        wieght: FontWeight.w400),
                                  ),
                                  Container(
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: AppColor.mainColor,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(1),
                                      child: Center(
                                        child: CustomText(
                                            text: '${rating.rate} ★',
                                            size: 15.5,
                                            color: AppColor.white,
                                            wieght: FontWeight.w400),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}

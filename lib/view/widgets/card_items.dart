import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:pharma_man/core/const/appcolor.dart';
import 'package:pharma_man/view/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/home_controller.dart';
import '../../model/product.dart';
import '../screens/product_details.dart';

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
        return
            Swiper(
          itemCount: controller.productList.length,
          itemWidth: 450,
          itemHeight: 280,
          duration: 300,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return buildCardItems(
                image: controller.productList[index].image,
                price: controller.productList[index].price,
                rating: controller.productList[index].rating,
                title: controller.productList[index].title,
                description: controller.productList[index].description,
                ontap: () {
                  Get.to(() => ProductDetails(
                        product: controller.productList[index],
                      ));
                });
          },
          layout: SwiperLayout.TINDER,
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
  return Stack(
    children: [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
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
            height: 270,
            width: 400,
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

                           Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [

                                 CustomText(
                                    overflow: TextOverflow.clip,
                                    text: "\$${price}",
                                    size: 15,
                                    color: Colors.black,
                                    wieght: FontWeight.w400),

                              Container(
                                width: 50,
                                decoration: BoxDecoration(
                                  color: AppColor.mainColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child:  Center(
                                    child: CustomText(
                                        text: '${rating.rate} ★',
                                        size: 15.5,
                                        color: AppColor.white,
                                        wieght: FontWeight.w400),
                                  ),

                              ),
                              SizedBox(width: 1.w,)
                            ],
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
  );
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_man/const/appcolor.dart';
import 'package:pharma_man/test.dart';
import 'package:pharma_man/widgets/customback.dart';
import 'package:pharma_man/widgets/customtext.dart';
import 'package:sizer/sizer.dart';

import '../model/product.dart';


class ProductDetails extends StatelessWidget {
  final Product product;
  const ProductDetails({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          
          backgroundColor: AppColor.white,
      body: 
      
      Container(
        padding: EdgeInsets.all(3.h),
        child: ListView(
          children: [
             Column(
           // mainAxisAlignment: MainAxisAlignment.start,
           
            children: [
              SizedBox(height: 1.h,),
              Row(
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              
                  CustomBack(),
                  // Stack(
                  //   children: [
                  //     Icon(
                  //       Icons.circle,
                  //       color: AppColor.color1,
                  //       size: 50,
                  //     ),
                  //     IconButton(
                  //         onPressed: () {},
                  //         icon: Icon(
                  //           Icons.add,
                  //           size: 30,
                  //           color: AppColor.white,
                  //         )),
                  //   ],
                  // ),
                ],
              ),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Image.network(product.image),
              ),
             const SizedBox(
                height: 40,
              ),
              
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal:50 ),
                   child: CustomText(
                    textAlign: TextAlign.center,
                    text: product.title,
                    size: 20,
                    color: AppColor.black,
                    wieght: FontWeight.w900,
                    overflow: TextOverflow.fade,
                    textDirection: TextDirection.ltr,
                ),
                 ),
             
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 15, bottom: 30),
                child:
                
                  CustomText(
                    textAlign: TextAlign.center,
                    text: product.description,
                    size: 15,
                    color: AppColor.grey,
                    wieght: FontWeight.w500,
                    overflow: TextOverflow.fade,
                    textDirection: TextDirection.ltr,
                  ),
                
              ),
              
                 
                   
                        Container(
                          decoration: BoxDecoration(
                            color: AppColor.color1,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: CustomText(
                                text: 'Amont : ${product.price} ',
                                size: 20,
                                color: AppColor.white,
                                wieght: FontWeight.w400),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                      decoration: BoxDecoration(
                        color: AppColor.color1,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: CustomText(
                            text: 'Expiry date : ${product.price}/${product.rating.rate}',
                            size: 20,
                            color: AppColor.white,
                            wieght: FontWeight.w400),
                      ),
                    ),
                   
                  SizedBox(height: 10,),
               
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.color1,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: CustomText(
                            text: 'Price : ${product.price} ',
                            size: 20,
                            overflow: TextOverflow.ellipsis,
                            color: AppColor.white,
                            wieght: FontWeight.w400),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.color1,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: CustomText(
                            text: 'Barcode : ${product.id}',
                            size: 20,
                            color: AppColor.white,
                            wieght: FontWeight.w400),
                      ),
                    ),
                      ],
                    ),
                    
            ],
          ),
      ),
 
        
    ));
  }
}
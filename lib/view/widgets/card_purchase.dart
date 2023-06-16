import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pharma_man/model/purchase.dart';
import 'package:pharma_man/view/widgets/custom_text.dart';

import 'package:sizer/sizer.dart';

import '../../controllers/all_purchase_controller.dart';
import '../../core/const/appcolor.dart';


class CardPurchase extends StatelessWidget {
  CardPurchase({Key? key}) : super(key: key);
  final AllPurchaseController controller = Get.put(AllPurchaseController());
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
          future: controller.getPurchase(),
          builder: (context, AsyncSnapshot snapshot) {
            Purchases? data = snapshot.data;
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: data!.data.length,
                  
                  itemBuilder: (context, int index) {

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical:7 ),
                        child: Card(
                        elevation: 10,
                        shadowColor: AppColor.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child:  Container(
                                  height: 25.h,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: AppColor.white),
                                  child: Row(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          height: 20.h,
                                          width: 29.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: SizedBox(
                                           
                                            child: Image.network(
                                              data.data[index].attributes.image,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      // SizedBox(
                                      //   width: 18,
                                      // ),
                                      Expanded(
                                        child: Container(
                                          // color: black,
                                          height: 20.h,
                                          width: 30.w,
                                          child: Column(
                                              //  mainAxisAlignment:
                                              // MainAxisAlignment
                                              //     .start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                // SizedBox(
                                                //   height: 20,
                                                // ),
                                                Row(
                                                  children: [ CustomText(
                                                  textAlign: TextAlign.center,
                                                  text: 'Name :',
                                                      
                                                  size: 20,
                                                  color: AppColor.black,
                                                  wieght: FontWeight.w900,
                                                  overflow: TextOverflow.ellipsis,
                                                  textDirection:
                                                      TextDirection.ltr,
                                                ),
                                                CustomText(
                                                  textAlign: TextAlign.center,
                                                  text: ' ${data.data[index]
                                                      .attributes.name}',
                                                  size: 20,
                                                  color: AppColor.grey,
                                                  wieght: FontWeight.w700,
                                                  overflow: TextOverflow.ellipsis,
                                                  textDirection:
                                                      TextDirection.ltr,
                                                ),],
                                                ),
                                               
                                                SizedBox(height: 3.h,),
                                                      
                                                          Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(3),
                                                              color: AppColor.mainColor
                                                            ),
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(1),
                                                              child: CustomText(
                                                                  overflow:
                                                                      TextOverflow.clip,
                                                                  text:
                                                                      "NetPrice= ${data.data[index].attributes.netPrice}\$",
                                                                  size: 15,
                                                                  color: Colors.white,
                                                                  wieght:
                                                                      FontWeight.w400),
                                                            ),
                                                          ),
                                                        
                                                      SizedBox(height: 0.5.h,),
                                                      Container(
                                                        
                                                          decoration: BoxDecoration(
                                                            color:
                                                                AppColor.mainColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(3),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(1),
                                                            
                                                                child: CustomText(
                                                                    text:
                                                                        'SallingPrice= ${data.data[index].attributes.sallingPrice}\$ ',
                                                                    size: 15.5,
                                                                    color: AppColor
                                                                        .white,
                                                                    wieght:
                                                                        FontWeight
                                                                            .w400),
                                                                ),
                                                          ),
                                                        
                                                  
                                                
                                                      
                                              
                                                     SizedBox(height: 0.5.h,),
                                                         Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(3),
                                                              color: AppColor.mainColor,
                                                            ),
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(1),
                                                              child: CustomText(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .clip,
                                                                  text:
                                                                      "Quantity= ${data.data[index].attributes.quantity}",
                                                                  size: 15,
                                                                  color: AppColor.white,
                                                                  wieght:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                        ),
                                                         
                                                      SizedBox(height: 0.5.h,),
                                                      Container(
                                                        
                                                        decoration: BoxDecoration(
                                                          color:
                                                              AppColor.mainColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(3),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(1),
                                                          
                                                              child: CustomText(
                                                                  text:
                                                                      'Date: ${data.data[index].attributes.expiryDate.toString().substring(0,10)}',
                                                                  size: 15.5,
                                                                  color: AppColor
                                                                      .white,
                                                                      overflow:
                                                                TextOverflow.clip,
                                                                  wieght:
                                                                      FontWeight
                                                                          .w400),

                                                              
                                                        ),
                                                      ),
                                                     
                                                    ],
                                                  ),
                                                ),
                                            
                                        
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            
                         
                        
                    
                      );
                  });
            } else {
              return Center(
                
                  child: CircularProgressIndicator(
                color: AppColor.color1,
              ));
            }
          }),
    );
  }
}

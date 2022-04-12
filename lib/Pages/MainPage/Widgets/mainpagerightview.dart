import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_webapp/Controllers/MainController.dart';
import 'package:multi_vendor_webapp/Pages/SellerPage/views/Sellermainpage.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';

import '../../OrderPage/orderPage.dart';
import '../../SellerPage/sellerScreen.dart';
import 'rightcardview.dart';

class MainPageRightView extends StatelessWidget {
  MainPageRightView({Key? key}) : super(key: key);

  int value = 1;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: const Size(1400, 1050),
      context: context,
      minTextAdapt: true,
    );
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(
                  left: 20.h, right: 20.h, bottom: 20.h, top: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: GetX<MainProvider>(builder: (controller) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Container(
                        // color: Colors.red,
                        padding: EdgeInsets.only(left: 15, right: 5, bottom: 0),
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomText(
                                text: "Order Overview",
                                size: 20.sp,
                                color: Colors.black,
                                weight: FontWeight.bold,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(OrderPage(value: value));
                              },
                              child: CustomText(
                                text: "View All",
                                size: 18.sp,
                                color: dark,
                                weight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RightCard(
                            "${controller.awaitingcount.value}",
                            "Pending",
                            Icon(
                              Icons.blur_circular,
                              color: Colors.grey,
                              size: 30.sp,
                            ),
                            Colors.grey.withOpacity(0.3),
                          ),
                          RightCard(
                            "${controller.acceptedcount.value}",
                            "Accepted",
                            Icon(
                              Icons.personal_injury_rounded,
                              color: Colors.green,
                              size: 30.sp,
                            ),
                            Colors.green.withOpacity(0.3),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RightCard(
                            "${controller.readytoshipcount.value}",
                            "Ready \nto Ship",
                            Icon(
                              Icons.compare_arrows_rounded,
                              color: Colors.purple,
                              size: 30.sp,
                            ),
                            Colors.purple.withOpacity(0.3),
                          ),
                          RightCard(
                            "${controller.cancelledCount.value}",
                            "Cancelled",
                            Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 30.sp,
                            ),
                            Colors.red.withOpacity(0.3),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(23.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RightCard(
                            "${controller.failedCount.value}",
                            "Failed",
                            const Icon(
                              Icons.person_pin_rounded,
                              color: Colors.blue,
                              size: 30,
                            ),
                            Colors.blue.withOpacity(0.3),
                          ),
                          RightCard(
                            "${controller.returnedCount.value}",
                            "Retured",
                            Icon(
                              Icons.reset_tv_rounded,
                              color: Colors.pink,
                              size: 30.sp,
                            ),
                            Colors.pink.withOpacity(0.3),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RightCard(
                            "${controller.shippedCount.value}",
                            "Shipped",
                            Icon(
                              Icons.car_rental,
                              color: Colors.yellow,
                              size: 30.sp,
                            ),
                            Colors.yellow.withOpacity(0.3),
                          ),
                          RightCard(
                            "${controller.deliveredcount.value}",
                            "Delivered",
                            Icon(
                              Icons.compare_arrows_rounded,
                              color: Color.fromARGB(255, 233, 30, 30),
                              size: 30.sp,
                            ),
                            Color.fromARGB(255, 233, 30, 30).withOpacity(0.3),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                );
              }),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: 20.h, right: 20.h, bottom: 20.h, top: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Container(
                      // color: Colors.red,
                      padding:
                          EdgeInsets.only(left: 15.h, right: 5.h, bottom: 0.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomText(
                              text: "Seller Overview",
                              size: 20.sp,
                              color: Colors.black,
                              weight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(SellerPage(
                                value: value,
                              ));
                            },
                            child: CustomText(
                              text: "View All",
                              size: 18.sp,
                              color: dark,
                              weight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RightCard(
                          "966",
                          "Approved",
                          Icon(
                            Icons.blur_circular,
                            color: Colors.grey,
                            size: 30.sp,
                          ),
                          Colors.grey.withOpacity(0.3),
                        ),
                        RightCard(
                          "100",
                          "Pending",
                          Icon(
                            Icons.personal_injury_rounded,
                            color: Colors.green,
                            size: 20.sp,
                          ),
                          Colors.green.withOpacity(0.3),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RightCard(
                          "27",
                          "Rejected",
                          Icon(
                            Icons.compare_arrows_rounded,
                            color: Colors.yellow.shade900,
                            size: 30.sp,
                          ),
                          Colors.yellow.withOpacity(0.3),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

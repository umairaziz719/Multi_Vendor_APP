import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/customSeller.dart';
import 'package:multi_vendor_webapp/Pages/SellerPage/widgets/customSeller.dart';
import 'package:multi_vendor_webapp/Controllers/MainController.dart';
import 'package:multi_vendor_webapp/models/ordermodel.dart';
import 'package:multi_vendor_webapp/models/productmodel33.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';

import '../../../constants/controllers.dart';
import '../../../models/customdropdownmodel.dart';
import '../../ViewOrder/vieworder.dart';
import '../../ViewOrderDetail/vieworderdetail.dart';
import 'customorderHistory.dart';

class PreviousOrderDetailWidget extends StatelessWidget {
  List<OrderModel> orderModel;
  ProductMOdel33 newlist;
  PreviousOrderDetailWidget(this.orderModel, this.newlist, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: const Size(1400, 1050),
      context: context,
      minTextAdapt: true,
    );
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 100,
              // color: Colors.red,
              padding: EdgeInsets.only(left: 20.h, right: 15.h, bottom: 0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Previous Order History of Product",
                    size: 24,
                    color: Colors.black,
                    weight: FontWeight.bold,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 70.h,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0.1),
              color: Colors.blue.withOpacity(0.1),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CustomText(
                    text: "Tracking ID",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomText(
                    text: "Date",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomText(
                    text: "Time",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomText(
                    text: "Order Amount",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Status",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Action",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
              height: 200,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: ListView(
                children: List.generate(orderModel.length, (index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      CustomOrderHistory(
                        color: Colors.white,
                        first: "${orderModel[index].OrderId}",
                        second:
                            "${orderModel[index].DateTime!.toDate().toString().split(" ")[0]}",
                        third:
                            "${orderModel[index].OrderTime!.toDate().toString().split(" ")[0]}",
                        four: orderModel[index].cartlist,
                        five: "${orderModel[index].status}",
                        six: newlist,
                        callback: () {
                          // controller.gettingUserdetails(
                          //   controller.updatedorderlist[index].UserPhone,
                          // );
                          // controller.gettingOrderdetails(
                          //   controller.updatedorderlist[index].StoreUid!,
                          // );
                          // Get.to(ViewOrderDetail(
                          //   controller.updatedorderlist[index],
                          //   controller.gettingsellerdetails(controller
                          //       .updatedorderlist[index].StoreName!),
                          // ));
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        height: 1,
                        color: Colors.black.withOpacity(.2),
                      ),
                    ],
                  );
                }),
              ))
        ],
      ),
    );
  }
}

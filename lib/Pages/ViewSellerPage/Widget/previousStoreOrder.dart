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
import 'customstoreOrder.dart';

class PreviousStoreOrderDetailWidget extends StatelessWidget {
  List<OrderModel> orderModel;
  PreviousStoreOrderDetailWidget(this.orderModel, {Key? key}) : super(key: key);

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
      margin: EdgeInsets.only(top: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Container(
              height: 100,
              // color: Colors.red,
              padding: EdgeInsets.only(left: 20.h, right: 15.h, bottom: 0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Previous Order History of Store",
                    size: 24,
                    color: Colors.black,
                    weight: FontWeight.bold,
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
                    text: "Order ID",
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
                    text: "Total",
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
                      CustomStoreOrder(
                        color: Colors.white,
                        first: "${orderModel[index].OrderId}",
                        second:
                            "${orderModel[index].DateTime!.toDate().toString().split(" ")[0]}",
                        third: "${orderModel[index].cartlist![0].price}",
                        six: "${orderModel[index].status}",
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/customSeller.dart';
import 'package:multi_vendor_webapp/Pages/SellerPage/widgets/customSeller.dart';
import 'package:multi_vendor_webapp/Controllers/MainController.dart';
import 'package:multi_vendor_webapp/Pages/ViewOrderDetail/Widgets/customOrder.dart';
import 'package:multi_vendor_webapp/Pages/ViewProductDetails/Widget/statusWidget.dart';
import 'package:multi_vendor_webapp/models/ordermodel.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';

import '../../../constants/controllers.dart';
import '../../../models/customdropdownmodel.dart';
import '../../OrderPage/Widgets/customOrder.dart';
import '../../ViewOrder/vieworder.dart';
import '../../ViewOrderDetail/vieworderdetail.dart';

class StatusDetailWidget extends StatelessWidget {
  // OrderModel orderModel;
  String? statusss;
  StatusDetailWidget(this.statusss, {Key? key}) : super(key: key);

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
    var height = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(top: 10.h, right: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Container(
              height: 100.h,
              // color: Colors.red,
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 0),
              child: CustomText(
                text: "Status of Order",
                size: 30.sp,
                color: dark,
                weight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          status(statusss!, true, context),
        ],
      ),
    );
  }
}

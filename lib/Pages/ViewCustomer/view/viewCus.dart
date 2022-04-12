import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_webapp/Controllers/AddDataController.dart';
import 'package:multi_vendor_webapp/Controllers/MainController.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/carview.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/topsellercard.dart';
import 'package:multi_vendor_webapp/Pages/SellerPage/widgets/sellerdetailed.dart';
import 'package:multi_vendor_webapp/models/ordermodel.dart';
import 'package:multi_vendor_webapp/models/usermodel.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../AddSeller/widget/customtextfield.dart';

class ViewCustomerView extends StatelessWidget {
  UserModel orderslist;
  ViewCustomerView(this.orderslist, {Key? key}) : super(key: key);
  final controller = Get.put(AddDataController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 10,
            ),
            Container(
                width: 600.h,
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 100,
                        // color: Colors.red,
                        padding:
                            EdgeInsets.only(left: 15, right: 15, bottom: 0),
                        child: CustomText(
                          text: "Customer Details",
                          size: 24,
                          color: dark,
                          weight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 1,
                            child: customText(
                                "Customer Name", orderslist.Name.toString())),
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(
                                  orderslist.Photourl!,
                                  scale: 1.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child:
                              customText("Email", orderslist.Email.toString()),
                        ),
                        Expanded(
                          flex: 1,
                          child: customText(
                              "User ID", orderslist.userId.toString()),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        customText("Phone", orderslist.PhoneNo.toString()),
                      ],
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                  ],
                )),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}

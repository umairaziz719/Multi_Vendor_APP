import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_webapp/Controllers/AddDataController.dart';
import 'package:multi_vendor_webapp/Controllers/MainController.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/carview.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/topsellercard.dart';
import 'package:multi_vendor_webapp/Pages/SellerPage/widgets/sellerdetailed.dart';
import 'package:multi_vendor_webapp/models/ordermodel.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../AddSeller/widget/customtextfield.dart';

class ViewOrderviews extends StatelessWidget {
  OrderModel orderslist;
  ViewOrderviews(this.orderslist, {Key? key}) : super(key: key);
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
                          text: "Order Details",
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
                        customText("UserName", orderslist.UserName.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: customText(
                              "Store Name", orderslist.StoreName.toString()),
                        ),
                        Expanded(
                          flex: 1,
                          child: customText(
                              "Store Email", orderslist.StoreEmail.toString()),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: customText(
                              "User Email", orderslist.UserEmail.toString()),
                        ),
                        Expanded(
                          flex: 1,
                          child: customText(
                              "Category", orderslist.category.toString()),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: customText("Store Address",
                              orderslist.StoreAddress.toString()),
                        ),
                        Expanded(
                          flex: 1,
                          child: customText("Store Latlng",
                              orderslist.StoreLatlng!.geohash.toString()),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: customText(
                              "Store Phone", orderslist.StorePhone.toString()),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: customText(
                              "Date Time",
                              orderslist.DateTime!
                                  .toDate()
                                  .toString()
                                  .split(" ")[0]),
                        ),
                        Expanded(
                          flex: 1,
                          child: customText(
                              "Store Uid", orderslist.StoreUid.toString()),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: customText(
                              "Total Price", orderslist.TotalPrice.toString()),
                        ),
                        Expanded(
                          flex: 1,
                          child: customText("User Address",
                              orderslist.UserAddress.toString()),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: customText(
                              "User Phone", orderslist.UserPhone.toString()),
                        ),
                        Expanded(
                          flex: 1,
                          child: customText(
                              "Category", orderslist.category.toString()),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height: 300,
                            width: 260,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: ListView(
                              children: List.generate(
                                  orderslist.cartlist!.length, (index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    customText(
                                        "Color",
                                        orderslist.cartlist![0].color
                                            .toString()),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    customText(
                                        "Name",
                                        orderslist.cartlist![0].name
                                            .toString()),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    customText(
                                        "Price",
                                        orderslist.cartlist![0].price
                                            .toString()),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    customText(
                                        "Qunantity",
                                        orderslist.cartlist![0].quantity
                                            .toString()),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    customText(
                                        "Size",
                                        orderslist.cartlist![0].size
                                            .toString()),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: NetworkImage(
                                          orderslist.cartlist![0].image
                                              .toString(),
                                          scale: 1.0),
                                    ),
                                    Divider(
                                      height: 1,
                                      color: Colors.black.withOpacity(.2),
                                    ),
                                  ],
                                );
                              }),
                            )),
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

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/customSeller.dart';
import 'package:multi_vendor_webapp/Pages/SellerPage/widgets/customSeller.dart';
import 'package:multi_vendor_webapp/Controllers/MainController.dart';
import 'package:multi_vendor_webapp/Pages/ViewOrderDetail/Widgets/customOrder.dart';
import 'package:multi_vendor_webapp/models/ordermodel.dart';
import 'package:multi_vendor_webapp/models/sellermodel.dart';
import 'package:multi_vendor_webapp/models/usermodel.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';

import 'customuser.dart';

class UserDetailPAge extends StatelessWidget {
  UserModel usermodel;
  UserDetailPAge(this.usermodel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GetX<MainProvider>(builder: (controller) {
            return CustomUser(
              first: "${usermodel.Photourl}",
              second: "${usermodel.Name}",
              third: "Customer",
              four: "${controller.uspending.value}",
              five: "${controller.usdelivery.value}",
              siz: "${controller.uscancel.value}",
              sev: "${usermodel.Name}",
              ei: "${usermodel.Email}",
              nine: "${usermodel.PhoneNo}",
            );
          }),
          // Padding(
          //   padding: const EdgeInsets.only(top: 10),
          //   child: Container(
          //     height: 100,
          //     // color: Colors.red,
          //     padding: EdgeInsets.only(left: 15, right: 15, bottom: 0),
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: CustomText(
          //         text: "Seller Details",
          //         size: 30,
          //         color: dark,
          //         weight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),

          // SizedBox(
          //   height: 5,
          // ),
          // Container(
          //   height: 70,
          //   padding: EdgeInsets.all(10),
          //   margin: EdgeInsets.only(left: 10, right: 10),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(0.1),
          //     color: Colors.blue.withOpacity(0.1),
          //   ),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         flex: 2,
          //         child: CustomText(
          //           text: "Image",
          //           size: 20,
          //           color: dark,
          //           weight: FontWeight.bold,
          //         ),
          //       ),
          //       Expanded(
          //         flex: 2,
          //         child: CustomText(
          //           text: "Product Name",
          //           size: 20,
          //           color: dark,
          //           weight: FontWeight.bold,
          //         ),
          //       ),
          //       Expanded(
          //         flex: 2,
          //         child: CustomText(
          //           text: "Id",
          //           size: 20,
          //           color: dark,
          //           weight: FontWeight.bold,
          //         ),
          //       ),
          //       Expanded(
          //         flex: 1,
          //         child: CustomText(
          //           text: "Price",
          //           size: 20,
          //           color: dark,
          //           weight: FontWeight.bold,
          //         ),
          //       ),
          //       Expanded(
          //         flex: 2,
          //         child: CustomText(
          //           text: "Date",
          //           size: 20,
          //           color: dark,
          //           weight: FontWeight.bold,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Container(
          //     height: 140,
          //     padding: EdgeInsets.all(10),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(20),
          //       color: Colors.white,
          //     ),
          //     child: Column(
          //       children: [
          //         SizedBox(
          //           height: 10,
          //         ),
          //         CustomOrdero(
          //           color: Colors.white,
          //           first: "${orderModel.cartlist![0].image}",
          //           second: "${orderModel.cartlist![0].name}",
          //           third: "${orderModel.StoreUid}",
          //           four: "\$ ${orderModel.cartlist![0].price}",
          //           five:
          //               "${orderModel.OrderTime!.toDate().toString().split(" ")[0]}",
          //         ),
          //         SizedBox(
          //           height: 10,
          //         ),
          //       ],
          //     ))
        ],
      ),
    );
  }
}

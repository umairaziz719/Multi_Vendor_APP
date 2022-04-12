import 'package:color_parser/color_parser.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/customSeller.dart';
import 'package:multi_vendor_webapp/Pages/SellerPage/widgets/customSeller.dart';
import 'package:multi_vendor_webapp/Controllers/MainController.dart';
import 'package:multi_vendor_webapp/Pages/ViewOrderDetail/Widgets/customOrder.dart';
import 'package:multi_vendor_webapp/models/ordermodel.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';

import '../../../constants/controllers.dart';
import '../../../models/customdropdownmodel.dart';
import '../../OrderPage/Widgets/customOrder.dart';
import '../../ViewOrder/vieworder.dart';
import '../../ViewOrderDetail/vieworderdetail.dart';

class ViewOrderDetailedWidget extends StatelessWidget {
  OrderModel orderModel;
  ViewOrderDetailedWidget(this.orderModel, {Key? key}) : super(key: key);
  ColorParser? parser;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 100,
              // color: Colors.red,
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      text: "Order Details",
                      size: 30,
                      color: dark,
                      weight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                          text: "Tracking ID",
                          size: 20,
                          color: dark,
                          weight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                          text: "${orderModel.OrderId}",
                          size: 10,
                          color: Colors.black,
                          weight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 70,
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
                    text: "Image",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomText(
                    text: "Product Name",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomText(
                    text: "Quantity",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Price",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomText(
                    text: "Size",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomText(
                    text: "Color",
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
                children: List.generate(orderModel.cartlist!.length, ((index) {
                  bool co = true;

                  if (orderModel.cartlist![index].color != null) {
                    co = false;
                    parser = ColorParser.value(
                        0xff + orderModel.cartlist![index].color!);
                    print(parser);
                  } else {
                    co = true;
                  }
                  return Column(
                    children: [
                      SizedBox(
                        height: 2,
                      ),
                      CustomOrdero(
                        color: Colors.white,
                        first: "${orderModel.cartlist![index].image}",
                        second: "${orderModel.cartlist![index].name}",
                        third: "${orderModel.cartlist![index].quantity}",
                        four: "\$ ${orderModel.cartlist![index].price}",
                        five: orderModel.cartlist![index].size != null
                            ? "${orderModel.cartlist![index].size}"
                            : "--",
                        six: orderModel.cartlist![index].color != null
                            ? "Black"
                            : "--",
                        color2:
                            Color(0xff + orderModel.cartlist![index].color!),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Divider(
                        height: 1,
                        thickness: 0.2,
                        color: Colors.grey.withOpacity(0.2),
                      )
                    ],
                  );
                })),
              ))
        ],
      ),
    );
  }
}

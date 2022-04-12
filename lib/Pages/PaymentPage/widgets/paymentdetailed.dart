import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/customSeller.dart';
import 'package:multi_vendor_webapp/Pages/PaymentPage/widgets/custompayment.dart';

import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';

class PaymentDetail extends StatelessWidget {
  PaymentDetail({Key? key}) : super(key: key);

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
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 100,
              // color: Colors.red,
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 0),
              child: Row(
                children: [
                  Expanded(
                    child: CustomText(
                      text: "Payment Request",
                      size: 18,
                      color: Colors.black,
                      weight: FontWeight.bold,
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {},
                  //   child: CustomText(
                  //     text: "Add",
                  //     size: 16,
                  //     color: dark,
                  //     weight: FontWeight.w500,
                  //   ),
                  // ),
                  const SizedBox(
                    width: 5,
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0.1),
              color: Colors.blue.withOpacity(0.1),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Seller Name",
                    size: 14,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Account number",
                    size: 14,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Date",
                    size: 14,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Type",
                    size: 14,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Status",
                    size: 14,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "",
                    size: 14,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Actions",
                    size: 14,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "",
                    size: 14,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
              height: 600,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: ListView(
                children: List.generate(custom.length, (index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      custom[index],
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
              )),
        ],
      ),
    );
  }

  List<CustomPayment> custom = const [
    CustomPayment(
        color: Colors.white,
        first: 'Asher Resherfield',
        second: '123 222 0005',
        third: '5/7/16',
        fourth: 'Add fund',
        fifth: 'Completed',
        six: Icon(
          Icons.edit,
          color: Colors.black,
        ),
        seven: Icon(
          Icons.done,
          color: Colors.green,
        ),
        eight: Icon(
          Icons.delete,
          color: Colors.red,
        )),
  ];
}

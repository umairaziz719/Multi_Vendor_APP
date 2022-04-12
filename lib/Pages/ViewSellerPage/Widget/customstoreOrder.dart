import 'package:flutter/material.dart';
import 'package:multi_vendor_webapp/models/ordermodel.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';

import 'package:multi_vendor_webapp/widgets/customText.dart';

import '../../../models/productmodel33.dart';

class CustomStoreOrder extends StatelessWidget {
  final Color color;
  final String first;
  final String second;
  final String third;

  final String six;

  final VoidCallback callback;

  const CustomStoreOrder({
    Key? key,
    required this.color,
    required this.first,
    required this.second,
    required this.third,
    required this.six,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(10),
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: CustomText(
              text: "$first",
              color: Colors.black,
              size: 18,
              weight: FontWeight.normal,
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomText(
              text: "$second",
              color: Colors.black,
              size: 18,
              weight: FontWeight.normal,
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomText(
              text: third != null || third != "" ? "$third" : "--",
              color: Colors.black,
              size: 18,
              weight: FontWeight.normal,
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomText(
              text: six,
              color: six == "Accepted" || six == "Delivered"
                  ? Colors.green
                  : six == "Pending"
                      ? Colors.yellow
                      : six == "Rejected"
                          ? Colors.red
                          : Colors.yellow,
              size: 20,
              weight: FontWeight.bold,
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: callback,
              child: Container(
                width: 30,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue.withOpacity(0.1),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.remove_red_eye,
                        color: dark,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      CustomText(
                        text: "View",
                        size: 20,
                        color: dark,
                        weight: FontWeight.bold,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

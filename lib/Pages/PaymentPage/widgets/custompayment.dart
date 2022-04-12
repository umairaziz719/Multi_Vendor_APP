import 'package:flutter/material.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';

import 'package:multi_vendor_webapp/widgets/customText.dart';

class CustomPayment extends StatelessWidget {
  final Color color;
  final String first;
  final String second;
  final String third;
  final String fourth;
  final String fifth;
  final Icon six;
  final Icon seven;
  final Icon eight;

  const CustomPayment({
    Key? key,
    required this.color,
    required this.first,
    required this.second,
    required this.third,
    required this.fourth,
    required this.fifth,
    required this.six,
    required this.seven,
    required this.eight,
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
            flex: 1,
            child: CustomText(
              text: "$first",
              color: Colors.black,
              size: 14,
              weight: FontWeight.normal,
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomText(
              text: "$second",
              color: Colors.black,
              size: 14,
              weight: FontWeight.normal,
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomText(
              text: "$third",
              color: Colors.black,
              size: 14,
              weight: FontWeight.normal,
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomText(
              text: "$fourth",
              color: Colors.black,
              size: 14,
              weight: FontWeight.normal,
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomText(
              text: "$fifth",
              color: Colors.black,
              size: 14,
              weight: FontWeight.normal,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: six,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: seven,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: eight,
            ),
          ),
        ],
      ),
    );
  }
}

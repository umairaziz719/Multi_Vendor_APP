import 'package:flutter/material.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';

import 'package:multi_vendor_webapp/widgets/customText.dart';

class CustomPromo extends StatelessWidget {
  final Color color;
  final String first;
  final String second;
  final Image third;
  final String fourth;
  final String fifth;
  final String six;
  final String seven;
  final String eight;
  final String nine;
  final Widget ten;

  const CustomPromo({
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
    required this.nine,
    required this.ten,
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
          SizedBox(
            width: 40,
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
          SizedBox(
            width: 15,
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
            child: CustomText(
              text: "$six",
              color: Colors.black,
              size: 14,
              weight: FontWeight.normal,
            ),
          ),
          SizedBox(
            width: 35,
          ),
          Expanded(
            flex: 1,
            child: CustomText(
              text: "$seven",
              color: Colors.black,
              size: 14,
              weight: FontWeight.normal,
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomText(
              text: "$eight",
              color: Colors.black,
              size: 14,
              weight: FontWeight.normal,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: CustomText(
              text: "$nine",
              color: Colors.black,
              size: 14,
              weight: FontWeight.normal,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: ten,
            ),
          ),
        ],
      ),
    );
  }
}

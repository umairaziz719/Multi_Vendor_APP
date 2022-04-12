import 'package:flutter/material.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';

import 'package:multi_vendor_webapp/widgets/customText.dart';

class CustomDelivery extends StatelessWidget {
  final Color color;
  final String first;
  final CircleAvatar se;
  final String third;
  final String four;

  final String six;

  final Widget ten;
  const CustomDelivery({
    Key? key,
    required this.color,
    required this.first,
    required this.se,
    required this.third,
    required this.four,
    required this.six,
    required this.ten,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
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
              child: Center(
                child: se,
              )),
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
              text: six,
              color: Colors.black,
              size: 14,
              weight: FontWeight.normal,
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomText(
              text: "$four",
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

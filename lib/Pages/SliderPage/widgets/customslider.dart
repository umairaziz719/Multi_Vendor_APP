import 'package:flutter/material.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';

import 'package:multi_vendor_webapp/widgets/customText.dart';

class CustomSlider extends StatelessWidget {
  final Color color;
  final String first;
  final String se;
  final String third;
  final Container fourth;
  final Widget nine;

  const CustomSlider({
    Key? key,
    required this.color,
    required this.first,
    required this.se,
    required this.third,
    required this.fourth,
    required this.nine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.only(left: 7),
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
              text: "$se",
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
            flex: 3,
            child: Center(
              child: fourth,
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: nine,
            ),
          ),
        ],
      ),
    );
  }
}

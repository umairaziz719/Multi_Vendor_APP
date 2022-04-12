import 'package:flutter/material.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';

import 'package:multi_vendor_webapp/widgets/customText.dart';

class CustomUser extends StatelessWidget {
  final Color color;
  final String first;
  final String second;
  final String third;
  final String four;

  const CustomUser({
    Key? key,
    required this.color,
    required this.first,
    required this.second,
    required this.third,
    required this.four,
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
              text: "$third",
              color: Colors.black,
              size: 18,
              weight: FontWeight.normal,
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomText(
              text: "$four",
              color: Colors.black,
              size: 18,
              weight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

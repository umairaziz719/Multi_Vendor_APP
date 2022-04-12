import 'package:flutter/material.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';

import 'package:multi_vendor_webapp/widgets/customText.dart';

class CustomSystem extends StatelessWidget {
  final Color color;
  final String first;
  final CircleAvatar se;
  final String third;

  final Widget ten;
  const CustomSystem({
    Key? key,
    required this.color,
    required this.first,
    required this.se,
    required this.third,
    required this.ten,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.only(left: 10),
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
          SizedBox(
            width: 55,
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
            flex: 7,
            child: ten,
          ),
        ],
      ),
    );
  }
}

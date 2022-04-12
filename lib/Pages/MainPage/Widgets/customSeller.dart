import 'package:flutter/material.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';

import 'package:multi_vendor_webapp/widgets/customText.dart';

class Custom_User extends StatelessWidget {
  final Color color;
  final String first;
  final String second;
  final String third;
  final String four;
  const Custom_User(
      {Key? key,
      required this.color,
      required this.first,
      required this.second,
      required this.third,
      required this.four})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: CustomText(
              text: "$first",
              color: dark,
              size: 20,
              weight: FontWeight.bold,
            ),
          ),
          Expanded(
              flex: 2,
              child: CircleAvatar(
                  child: Image.asset(
                second,
                height: 20,
              ))),
          Expanded(
            flex: 3,
            child: CustomText(
              text: "$third",
              color: Colors.black,
              size: 15,
              weight: FontWeight.normal,
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomText(
              text: "$four",
              color: Colors.black,
              size: 18,
              weight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

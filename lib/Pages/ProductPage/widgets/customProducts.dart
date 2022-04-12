import 'package:flutter/material.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';

import 'package:multi_vendor_webapp/widgets/customText.dart';

class CustomProducts extends StatelessWidget {
  final Color color;
  final String first;
  final String second;
  final String third;
  final String four;
  final String five;
  final String six;
  final Widget ei;
  final Widget nig;
  final Widget ten;

  const CustomProducts({
    Key? key,
    required this.color,
    required this.first,
    required this.second,
    required this.third,
    required this.four,
    required this.five,
    required this.six,
    required this.ei,
    required this.nig,
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
              color: dark,
              size: 20,
              weight: FontWeight.bold,
            ),
          ),
          Expanded(
              flex: 2,
              child: Center(
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(second),
                ),
              )),
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
            flex: 1,
            child: CustomText(
              text: "$four",
              color: Colors.black,
              size: 18,
              weight: FontWeight.normal,
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomText(
              text: five,
              color: five == "Live"
                  ? Colors.green
                  : five == "Pending"
                      ? Colors.amber
                      : Colors.red,
              size: 18,
              weight: FontWeight.bold,
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomText(
              text: six,
              color: Colors.black,
              size: 18,
              weight: FontWeight.normal,
            ),
          ),
          Expanded(
              flex: 1,
              child: Center(
                child: ei,
              )),
          Expanded(
            flex: 1,
            child: Center(
              child: nig,
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

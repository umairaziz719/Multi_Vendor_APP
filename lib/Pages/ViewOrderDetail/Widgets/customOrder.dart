import 'package:flutter/material.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';

import 'package:multi_vendor_webapp/widgets/customText.dart';

class CustomOrdero extends StatelessWidget {
  final Color color;
  final String first;
  final String second;
  final String third;
  final String four;
  final String five;
  final String six;
  final Color color2;

  const CustomOrdero({
    Key? key,
    required this.color,
    required this.first,
    required this.second,
    required this.third,
    required this.four,
    required this.five,
    required this.six,
    required this.color2,
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
              child: Center(
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(first),
                ),
              )),
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
            flex: 1,
            child: CustomText(
              text: "$four",
              color: Colors.black,
              size: 18,
              weight: FontWeight.normal,
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomText(
              text: five,
              color: Colors.black,
              size: 18,
              weight: FontWeight.normal,
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: color2,
                ),
                const SizedBox(
                  width: 4,
                ),
                CustomText(
                  text: six,
                  color: Colors.black,
                  size: 18,
                  weight: FontWeight.normal,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

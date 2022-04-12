import 'package:flutter/material.dart';

import '../../../widgets/customtext.dart';

class SellerFullOverview extends StatelessWidget {
  final String first;
  final String second;
  final String third;
  final String four;
  final String five;
  final String siz;
  final String sev;

  SellerFullOverview({
    Key? key,
    required this.first,
    required this.second,
    required this.third,
    required this.four,
    required this.five,
    required this.siz,
    required this.sev,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Email",
                  color: Colors.black,
                  size: 20,
                  weight: FontWeight.bold,
                ),
                CustomText(
                  text: "$first",
                  color: Colors.black,
                  size: 18,
                  weight: FontWeight.normal,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "Phone Number",
                  color: Colors.black,
                  size: 20,
                  weight: FontWeight.bold,
                ),
                CustomText(
                  text: "$second",
                  color: Colors.black,
                  size: 18,
                  weight: FontWeight.normal,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "Store Name",
                  color: Colors.black,
                  size: 20,
                  weight: FontWeight.bold,
                ),
                CustomText(
                  text: "$third",
                  color: Colors.black,
                  size: 18,
                  weight: FontWeight.normal,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "Location",
                  color: Colors.black,
                  size: 20,
                  weight: FontWeight.bold,
                ),
                CustomText(
                  text: "$four",
                  color: Colors.black,
                  size: 18,
                  weight: FontWeight.normal,
                ),
              ],
            ),
          ],
        ));
  }
}

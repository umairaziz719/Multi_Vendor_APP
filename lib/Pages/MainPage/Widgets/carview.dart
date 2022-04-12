import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';

Widget Cardview(String first, String second, Icon icondata, Color color,
    double fi, double se, double left, double right) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    margin: EdgeInsets.all(2),
    padding: EdgeInsets.all(15),
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: color,
          child: icondata,
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: left, right: right),
              child: CustomText(
                text: first,
                color: dark,
                size: fi,
                weight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.only(left: left, right: right),
              child: CustomText(
                text: second,
                color: Colors.black87,
                size: se,
                weight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

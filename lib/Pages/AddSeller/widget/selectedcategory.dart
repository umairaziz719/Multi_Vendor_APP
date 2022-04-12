import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/customText.dart';

Widget selectedcat(String title) {
  return Container(
    margin: EdgeInsets.only(right: 10),
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(0.5),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 10),
            child: CustomText(
              text: "$title",
              color: Colors.black87,
              size: 18,
              weight: FontWeight.normal,
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Icon(
            Icons.close,
            color: Colors.black,
          ),
        ],
      ),
    ),
  );
}

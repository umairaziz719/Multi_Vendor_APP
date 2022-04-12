import 'package:flutter/material.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';

import '../../../widgets/customText.dart';

Widget customTextfield(
    String title, String subtitle, TextEditingController controller) {
  return Container(
    margin: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "$title",
          size: 16,
          color: Colors.black,
          weight: FontWeight.bold,
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.black54),
              hintText: "$subtitle"),
        )
      ],
    ),
  );
}

Widget customTextfield22(String title, String subtitle,
    TextEditingController controller, String errormsg) {
  return Container(
    margin: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "$title",
          size: 16,
          color: Colors.black,
          weight: FontWeight.bold,
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.black54),
              hintText: "$subtitle"),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '$errormsg';
            }
            return null;
          },
        )
      ],
    ),
  );
}

Widget customText(String title, String subtitle) {
  return Container(
    margin: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "$title",
          size: 18,
          color: Colors.black,
          weight: FontWeight.bold,
        ),
        SizedBox(
          height: 10,
        ),
        CustomText(
          text: "$subtitle",
          size: 16,
          color: dark,
          weight: FontWeight.normal,
        ),
      ],
    ),
  );
}

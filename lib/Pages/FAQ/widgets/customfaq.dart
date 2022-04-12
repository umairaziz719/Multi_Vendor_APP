import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/customText.dart';

Widget detailcontainer(
  String title,
) {
  return Container(
    height: 100,
    child: Row(
      children: [
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: CustomText(
            text: "$title",
            size: 14,
            color: Color(0xff454662),
            weight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Icon(Icons.edit),
        ),
        TextButton(
          onPressed: () {},
          child: Icon(Icons.delete),
        ),
        TextButton(
          onPressed: () {},
          child: Icon(Icons.expand_less_rounded),
        ),
      ],
    ),
  );
}

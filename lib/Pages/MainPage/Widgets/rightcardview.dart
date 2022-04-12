import 'package:flutter/material.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';

Widget RightCard(String first, String second, Icon icons, Color color,
        {String? asd}) =>
    Container(
      padding: EdgeInsets.only(left: 15, right: 5, bottom: 10, top: 10),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: icons,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 10),
                child: CustomText(
                  text: first,
                  color: dark,
                  size: 25,
                  weight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 10),
                child: CustomText(
                  text: second,
                  color: Colors.black87,
                  size: 18,
                  weight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ],
      ),
    );

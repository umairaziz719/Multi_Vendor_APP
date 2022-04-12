import 'package:flutter/material.dart';

import '../../../widgets/customtext.dart';

class SellerOverview extends StatelessWidget {
  final String first;
  final String second;
  final String third;
  final String four;
  final String five;
  final String siz;
  final String sev;

  const SellerOverview({
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
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(first),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomText(
            text: "$second",
            color: Colors.black,
            size: 20,
            weight: FontWeight.bold,
          ),
          SizedBox(
            height: 10,
          ),
          CustomText(
            text: "$third",
            color: Colors.black,
            size: 20,
            weight: FontWeight.normal,
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: 100,
            height: 1,
            color: Colors.grey,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  CustomText(
                    text: "$four",
                    color: Colors.black,
                    size: 20,
                    weight: FontWeight.normal,
                  ),
                  CustomText(
                    text: "Awaiting",
                    color: Colors.black,
                    size: 20,
                    weight: FontWeight.normal,
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 50,
                width: 1,
                color: Colors.grey,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  CustomText(
                    text: "$five",
                    color: Colors.black,
                    size: 20,
                    weight: FontWeight.normal,
                  ),
                  CustomText(
                    text: "Pending",
                    color: Colors.black,
                    size: 20,
                    weight: FontWeight.normal,
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 50,
                width: 1,
                color: Colors.grey,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  CustomText(
                    text: "$siz",
                    color: Colors.black,
                    size: 20,
                    weight: FontWeight.normal,
                  ),
                  CustomText(
                    text: "Delivery",
                    color: Colors.black,
                    size: 20,
                    weight: FontWeight.normal,
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 50,
                width: 1,
                color: Colors.grey,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  CustomText(
                    text: "$sev",
                    color: Colors.black,
                    size: 20,
                    weight: FontWeight.normal,
                  ),
                  CustomText(
                    text: "Rejected",
                    color: Colors.black,
                    size: 20,
                    weight: FontWeight.normal,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

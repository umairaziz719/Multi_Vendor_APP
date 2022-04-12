import 'package:flutter/material.dart';

import '../../../../widgets/customText.dart';

class UserOverview extends StatelessWidget {
  final String first;
  final String second;
  final String third;
  final String four;
  final String five;
  final String siz;

  const UserOverview({
    Key? key,
    required this.first,
    required this.second,
    required this.third,
    required this.four,
    required this.five,
    required this.siz,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(first),
            ),
            SizedBox(
              width: 10,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            ])
          ]),
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
                    text: "$five",
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
                    text: "$siz",
                    color: Colors.black,
                    size: 20,
                    weight: FontWeight.normal,
                  ),
                  CustomText(
                    text: "Cancel",
                    color: Colors.black,
                    size: 20,
                    weight: FontWeight.normal,
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
            ],
          )
        ],
      ),
    );
  }
}

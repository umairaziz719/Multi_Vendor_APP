import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/customtext.dart';

class CustomUser extends StatelessWidget {
  final String first;
  final String second;
  final String third;
  final String four;
  final String five;
  final String siz;
  final String sev;
  final String ei;
  final String nine;

  const CustomUser({
    Key? key,
    required this.first,
    required this.second,
    required this.third,
    required this.four,
    required this.five,
    required this.siz,
    required this.sev,
    required this.ei,
    required this.nine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: const Size(1400, 1050),
      context: context,
      minTextAdapt: true,
    );
    return Container(
      height: 300,
      padding: EdgeInsets.all(13),
      child: Row(
        children: [
          Column(
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
                height: 20,
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
          SizedBox(
            width: 40,
          ),
          Container(
            width: 1,
            height: 200,
            color: Colors.grey,
          ),
          SizedBox(
            width: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Name",
                color: Colors.black,
                size: 20,
                weight: FontWeight.normal,
              ),
              SizedBox(
                height: 2,
              ),
              CustomText(
                text: "$sev",
                color: Colors.grey,
                size: 18,
                weight: FontWeight.normal,
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: "Email Address",
                color: Colors.black,
                size: 20,
                weight: FontWeight.normal,
              ),
              SizedBox(
                height: 2,
              ),
              CustomText(
                text: "$ei",
                color: Colors.grey,
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
                weight: FontWeight.normal,
              ),
              CustomText(
                text: "$nine",
                color: Colors.grey,
                size: 18,
                weight: FontWeight.normal,
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ],
      ),
    );
  }
}

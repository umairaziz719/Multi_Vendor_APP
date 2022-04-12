import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/customtext.dart';

class Customdetails extends StatelessWidget {
  final String first;
  final String second;
  final String third;
  final String four;

  final String five;
  final String siz;
  final String sev;
  final String ei;
  final String nine;
  final String nine1;
  final String four1;

  const Customdetails({
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
    required this.nine1,
    required this.four1,
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
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Email",
                color: Colors.black,
                size: 20,
                weight: FontWeight.normal,
              ),
              SizedBox(
                height: 2,
              ),
              CustomText(
                text: "$first",
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
              SizedBox(
                height: 2,
              ),
              CustomText(
                text: "$second",
                color: Colors.grey,
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
                weight: FontWeight.normal,
              ),
              CustomText(
                text: "$third",
                color: Colors.grey,
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
                weight: FontWeight.normal,
              ),
              CustomText(
                text: "$four",
                color: Colors.grey,
                size: 18,
                weight: FontWeight.normal,
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 1,
            height: 200,
            color: Colors.grey,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: "Id Card Number",
                color: Colors.black,
                size: 20,
                weight: FontWeight.normal,
              ),
              CustomText(
                text: "$five",
                color: Colors.grey,
                size: 18,
                weight: FontWeight.normal,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 70,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.withOpacity(0.5),
                        image: new DecorationImage(
                            fit: BoxFit.cover, image: new NetworkImage(siz))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 70,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.withOpacity(0.5),
                        image: new DecorationImage(
                            fit: BoxFit.cover, image: new NetworkImage(sev))),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 1,
            height: 200,
            color: Colors.grey,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: "Account Name",
                color: Colors.black,
                size: 20,
                weight: FontWeight.normal,
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
                text: "Account Number",
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
                height: 10,
              ),
              CustomText(
                text: "Account Ids",
                color: Colors.black,
                size: 20,
                weight: FontWeight.normal,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 70,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.withOpacity(0.5),
                        image: new DecorationImage(
                            fit: BoxFit.cover, image: new NetworkImage(nine1))),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          )
        ],
      ),
    );
  }
}

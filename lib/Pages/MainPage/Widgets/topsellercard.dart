import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';

import 'customSeller.dart';

class TopSellerCard extends StatelessWidget {
  TopSellerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: const Size(375, 812),
      context: context,
      minTextAdapt: true,
    );

    return Container(
      height: 300.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Container(
              // color: Colors.red,
              padding: EdgeInsets.only(left: 15.h, right: 5.h, bottom: 0),
              child: Row(
                children: [
                  Expanded(
                    child: CustomText(
                      text: "Top Sellers",
                      size: 24.sp,
                      color: Colors.black,
                      weight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            height: 70.h,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Rank",
                    size: 20.sp,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomText(
                    text: "Picture",
                    size: 20.sp,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: CustomText(
                    text: "Name",
                    size: 20.sp,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomText(
                    text: "Earning",
                    size: 20.sp,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
              height: 160.h,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: ListView(
                children: List.generate(custom.length, (index) {
                  return Column(
                    children: [
                      custom[index],
                      Divider(
                        height: 1,
                        color: Colors.black.withOpacity(.2),
                      ),
                    ],
                  );
                }),
              )),
        ],
      ),
    );
  }

  List<Custom_User> custom = [
    Custom_User(
        color: Colors.white,
        first: '01',
        second: "assets/images/person1.jpg",
        third: "Asher Nohaa",
        four: "\$ 12323"),
    Custom_User(
        color: Colors.white,
        first: '02',
        second: "assets/images/person2.jpg",
        third: "Asher Nohaa",
        four: "\$ 12323"),
    Custom_User(
        color: Colors.white,
        first: '03',
        second: "assets/images/person3.jpg",
        third: "Asher Nohaa",
        four: "\$ 12323"),
    Custom_User(
        color: Colors.white,
        first: '04',
        second: "assets/images/person4.jpg",
        third: "Asher Nohaa",
        four: "\$ 12323"),
    Custom_User(
        color: Colors.white,
        first: '05',
        second: "assets/images/person5.jpg",
        third: "Asher Nohaa",
        four: "\$ 12323"),
    Custom_User(
        color: Colors.white,
        first: '06',
        second: "assets/images/person1.jpg",
        third: "Asher Nohaa",
        four: "\$ 12323"),
    Custom_User(
        color: Colors.white,
        first: '07',
        second: "assets/images/person2.jpg",
        third: "Asher Nohaa",
        four: "\$ 12323")
  ];
}

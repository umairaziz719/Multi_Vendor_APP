import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/styles.dart';
import '../../../widgets/customText.dart';

Widget status(String? status, bool nextstatus, BuildContext context) {
  ScreenUtil.init(
    BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height),
    designSize: const Size(1400, 1050),
    context: context,
    minTextAdapt: true,
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.only(left: 20.h, right: 10.h, bottom: 10.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 20.w,
                  backgroundColor: dark,
                  child: Icon(Icons.timer_sharp, color: Colors.white),
                ),
                SizedBox(
                  height: 5,
                ),
                CustomText(
                  text: "Awaiting",
                  size: 18.sp,
                  color: dark,
                  weight: FontWeight.bold,
                ),
              ],
            ),
            Row(
                children: List.generate(
              10,
              (index) => Container(
                height: 10.h,
                margin: EdgeInsets.only(right: 5.h),
                width: 15.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: 0 < stt.indexOf(status!)
                      ? dark
                      : Colors.grey.withOpacity(0.2),
                ),
              ),
            )),
            Column(
              children: [
                CircleAvatar(
                  radius: 20.w,
                  backgroundColor: dark,
                  child: Icon(Icons.timer_sharp, color: Colors.white),
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomText(
                  text: "Pending",
                  size: 15.sp,
                  color: dark,
                  weight: FontWeight.bold,
                ),
              ],
            ),
            Row(
                children: List.generate(
              10,
              (index) => Container(
                height: 10.h,
                margin: EdgeInsets.only(right: 5.h),
                width: 15.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: 1 < stt.indexOf(status!)
                      ? dark
                      : Colors.grey.withOpacity(0.2),
                ),
              ),
            )),
            Column(
              children: [
                CircleAvatar(
                  radius: 20.w,
                  backgroundColor: dark,
                  child: Icon(Icons.timer_sharp, color: Colors.white),
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomText(
                  text: "Accepted",
                  size: 15.sp,
                  color: dark,
                  weight: FontWeight.bold,
                ),
              ],
            ),

            // Ready to ship ..............
            Row(
                children: List.generate(
              10,
              (index) => Container(
                height: 10.h,
                margin: EdgeInsets.only(right: 5.h),
                width: 15.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: 2 < stt.indexOf(status!)
                      ? dark
                      : Colors.grey.withOpacity(0.2),
                ),
              ),
            )),

            Column(
              children: [
                CircleAvatar(
                  radius: 20.w,
                  backgroundColor: dark,
                  child: Icon(Icons.timer_sharp, color: Colors.white),
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomText(
                  text: "Ready to Ship",
                  size: 15.sp,
                  color: dark,
                  weight: FontWeight.bold,
                ),
              ],
            ),

            // Ready to ship ..............
            Row(
                children: List.generate(
              10,
              (index) => Container(
                height: 10.h,
                margin: EdgeInsets.only(right: 5.h),
                width: 15.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: 3 < stt.indexOf(status!)
                      ? dark
                      : Colors.grey.withOpacity(0.2),
                ),
              ),
            )),

            Column(
              children: [
                CircleAvatar(
                  radius: 20.w,
                  backgroundColor: dark,
                  child: Icon(Icons.timer_sharp, color: Colors.white),
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomText(
                  text: "Shipped",
                  size: 15.sp,
                  color: dark,
                  weight: FontWeight.bold,
                ),
              ],
            ),

            // Ready to ship ..............
            Row(
                children: List.generate(
              10,
              (index) => Container(
                height: 10.h,
                margin: EdgeInsets.only(right: 5.h),
                width: 15.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: 4 < stt.indexOf(status!)
                      ? dark
                      : Colors.grey.withOpacity(0.2),
                ),
              ),
            )),
            Column(
              children: [
                CircleAvatar(
                  radius: 20.w,
                  backgroundColor: dark,
                  child: Icon(Icons.timer_sharp, color: Colors.white),
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomText(
                  text: "Delivered",
                  size: 15.sp,
                  color: dark,
                  weight: FontWeight.bold,
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

List<String> stt = [
  "Awaiting",
  "Pending",
  "Accepted",
  "Ready to Ship",
  "Shipped",
  "Delivered",
];

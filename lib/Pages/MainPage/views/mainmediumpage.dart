import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:multi_vendor_webapp/Controllers/AuthController.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/mainpagemiddleview.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/mainpagerightview.dart';
import 'package:multi_vendor_webapp/constants/controllers.dart';
import 'package:multi_vendor_webapp/utils/databasemanager.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';
import 'package:multi_vendor_webapp/widgets/top_Navbar.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/MainController.dart';

class MainMediumPage extends StatelessWidget {
  MainMediumPage({Key? key}) : super(key: key);
  // final GlobalKey<ScaffoldState> _scaffoldstate = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      // designSize: const Size(375, 812),
      context: context,
      minTextAdapt: true,
    );
    final con = Get.put(AuthController());

    return SingleChildScrollView(
      child: Container(
        color: hoverbackground,
        padding: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => topnavbarrr(
                menuController.activeItem.value,
                con.model.isEmpty ? "" : "${con.model[0].imgurl}",
                () {},
                true,
                "${con.username.value}")),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Expanded(
                //   child: Container(
                //     child: Text("asdasdasd"),
                //   ),
                // ),
                // Expanded(
                //   flex: 3,
                //   child: Container(
                //     child: Text("sadqwwqwqwq"),
                //   ),
                // ),
                Expanded(flex: 10, child: MainPageMiddleView()),
                Expanded(flex: 5, child: MainPageRightView()),

                // Expanded(flex: 3, child: MainPageMiddleView())
              ],
            )

            // Container(
            //   child: Row(
            //     children: [
            //       CustomText(
            //         text: "New Main Page",
            //       )
            //       // Expanded(flex: 3, child: CardContainer()),
            //       // Expanded(flex: 3, child: PollCard()),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 40,
            // ),
            // Container(
            //   child: Row(
            //     children: [
            //       // Expanded(flex: 3, child: QuestionCard()),
            //       // Expanded(flex: 3, child: UserCard()),
            //     ],
            //   ),
            // ),

            // Container(
            //   height: 300,
            //   padding: EdgeInsets.all(20),
            //   decoration: BoxDecoration(
            //       color: light, borderRadius: BorderRadius.circular(10)),
            //   child: Column(
            //     children: [
            //       CustomText(
            //         text: "Lorem iprsum statistics are shown here ...",
            //         color: blackColor.withOpacity(.2),
            //       ),
            //       ListView(
            //         scrollDirection: Axis.horizontal,
            //         children: [
            //           Container(
            //             width: 200,
            //             color: blackColor,
            //           ),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Container(
            //             width: 200,
            //             color: blackColor,
            //           ),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Container(
            //             width: 200,
            //             color: blackColor,
            //           ),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Container(
            //             width: 200,
            //             color: blackColor,
            //           ),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Container(
            //             width: 200,
            //             color: blackColor,
            //           ),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Container(
            //             width: 200,
            //             color: blackColor,
            //           ),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Container(
            //             width: 200,
            //             color: lightGreys,
            //           ),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Container(
            //             width: 200,
            //             color: lightGreys,
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // CustomText(
            //   text: "Users (13)",
            //   size: 20,
            //   color: blackColor,
            //   weight: FontWeight.w400,
            // ),
            // SizedBox(
            //   height: 20,
            // ),
          ],
        ),
      ),
    );
  }
}

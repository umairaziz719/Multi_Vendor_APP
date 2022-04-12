import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:multi_vendor_webapp/Controllers/AuthController.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/mainpagemiddleview.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/mainpagerightview.dart';
import 'package:multi_vendor_webapp/constants/controllers.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';
import 'package:multi_vendor_webapp/widgets/top_Navbar.dart';

import 'views/Slidermainpage.dart';

class SliderPage extends StatelessWidget {
  SliderPage({Key? key}) : super(key: key);
  final con = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: hoverbackground,
        padding: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => topnavbarrr(menuController.activeItem.value,
                con.model.isEmpty
                    ? ""
                    : "${con.model[0].imgurl}",
                () {},
                false,
               "${con.username.value}")),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Expanded(child: SliderMainPage()),
              ],
            )
          ],
        ),
      ),
    );
  }
}

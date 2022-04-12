import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:multi_vendor_webapp/Controllers/AuthController.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/mainpagemiddleview.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/mainpagerightview.dart';
import 'package:multi_vendor_webapp/constants/controllers.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';
import 'package:multi_vendor_webapp/widgets/top_Navbar.dart';

import '../../widgets/sitemap.dart';
import 'views/Sellermainpage.dart';

class SellerPage extends StatelessWidget {
  int value;
  SellerPage({Key? key, this.value = 0}) : super(key: key);
  final con = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          value == 1
              ? Expanded(
                  child: Container(
                      width: double.infinity,
                      height: double.infinity,

                      // color: dark,
                      child: SideMenu()),
                )
              : Container(),
          Expanded(
            flex: 7,
            child: SingleChildScrollView(
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
                        false,
                        "${con.username.value}")),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Expanded(child: SellerMainPage()),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:multi_vendor_webapp/constants/controllers.dart';
import 'package:multi_vendor_webapp/helper/responseiveness.dart';
import 'package:multi_vendor_webapp/routing/routes.dart';

import 'customText.dart';
import 'sitemenuItem.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          if (Responsiveness.isLargeScreen(context))
            SizedBox(
              height: 4,
            ),
          Container(
            width: 3,
            child: Image.asset(
              "assets/icons/logo33.png",
              width: 20,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: sideMenuItems
                .map((itemName) => SideMenuItem(
                    itemName: itemName,
                    onTap: () {
                      if (!menuController.isActiveItem(itemName)) {
                        menuController.changeActiveItem(itemName);
                        if (Responsiveness.isSmallScreen(context)) Get.back();
                        // go to itemName navigation
                        navigationController.navigateto(itemName);
                      }
                    }))
                .toList(),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: CustomText(
              text: "11.2.5\n App Version",
              color: Colors.white,
              size: 16,
              weight: FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}

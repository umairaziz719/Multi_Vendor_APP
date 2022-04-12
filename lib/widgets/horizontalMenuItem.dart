import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:multi_vendor_webapp/constants/controllers.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';

import 'customText.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;
  const HorizontalMenuItem(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value
            ? menuController.hoverItem(itemName)
            : menuController.hoverItem("no hovering");
      },
      child: Obx(() => Container(
            decoration: BoxDecoration(
              color: menuController.isHoveringItem(itemName)
                  ? hoverbackground
                  : menuController.isActiveItem(itemName)
                      ? hoverbackground
                      : Colors.transparent,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30)),
            ),
            child: Row(
              children: [
                Visibility(
                  visible: menuController.isHoveringItem(itemName) ||
                      menuController.isActiveItem(itemName),
                  child: Container(
                    width: 6,
                    height: 40,
                    color: lightGrey,
                  ),
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                ),
                SizedBox(
                  width: _width / 80,
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: menuController.returnIconfor(itemName),
                ),
                if (!menuController.isActiveItem(itemName))
                  Flexible(
                    child: CustomText(
                      text: itemName,
                      color: menuController.isHoveringItem(itemName)
                          ? dark
                          : lightGrey,
                    ),
                  )
                else
                  Flexible(
                      child: CustomText(
                    text: itemName,
                    color: dark,
                    size: 18,
                    weight: FontWeight.bold,
                  ))
              ],
            ),
          )),
    );
  }
}

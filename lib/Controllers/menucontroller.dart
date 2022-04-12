import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:multi_vendor_webapp/routing/routes.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = MainDashboard.obs;
  var hoverItem = "".obs;

  changeActiveItem(String ItemName) {
    activeItem.value = ItemName;
  }

  onHover(String ItemName) {
    if (!isActiveItem(ItemName)) hoverItem.value = ItemName;
  }

  isActiveItem(String ItemName) => activeItem.value == ItemName;

  isHoveringItem(String ItemName) => hoverItem.value == ItemName;

  Widget returnIconfor(String ItemName) {
    switch (ItemName) {
      case MainDashboard:
        return _customIcon(Icons.menu, ItemName);
      case Seller:
        return _customIcon(Icons.book, ItemName);
      case Orders:
        return _customIcon(Icons.poll, ItemName);
      case Products:
        return _customIcon(Icons.question_answer, ItemName);
      case Customers:
        return _customIcon(Icons.person, ItemName);
      default:
        return _customIcon(Icons.exit_to_app, ItemName);
    }
  }

  Widget _customIcon(IconData iconData, String ItemName) {
    if (isActiveItem(ItemName)) return Icon(iconData, size: 22, color: dark);

    return Icon(
      iconData,
      color: isHoveringItem(ItemName) ? dark : lightGrey,
    );
  }
}

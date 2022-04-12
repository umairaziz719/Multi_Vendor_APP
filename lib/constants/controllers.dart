import 'package:flutter/material.dart';
import 'package:multi_vendor_webapp/Controllers/menucontroller.dart';
import 'package:multi_vendor_webapp/Controllers/navigationcontroller.dart';

import '../models/customdropdownmodel.dart';

MenuController menuController = MenuController.instance;
NavigationController navigationController = NavigationController.instance;

class Constants {
  static List<CustomDropDownItem> customDropDownItems = [
    CustomDropDownItem(
        name: "Live",
        icon: Icon(
          Icons.done,
          color: Colors.green,
        )),
    CustomDropDownItem(name: "Pending", icon: Icon(Icons.pending_rounded)),
    CustomDropDownItem(
        name: "Rejected",
        icon: Icon(
          Icons.close_rounded,
          color: Colors.red,
        )),
    CustomDropDownItem(
        name: "No Selected",
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.transparent,
        )),
  ];

  static List<CustomDropDownItem> customDropDownItems22 = [
    CustomDropDownItem(
        name: "Approved",
        icon: Icon(
          Icons.done,
          color: Colors.green,
        )),
    CustomDropDownItem(name: "Pending", icon: Icon(Icons.pending_rounded)),
    CustomDropDownItem(
        name: "Rejected",
        icon: Icon(
          Icons.close_rounded,
          color: Colors.red,
        )),
    CustomDropDownItem(
        name: "No Selected",
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.transparent,
        )),
  ];

  static List<CustomDropDownItem> customDropDownItems00 = [
    CustomDropDownItem(
        name: "Logout",
        icon: Icon(
          Icons.lock,
          color: Color.fromARGB(255, 83, 160, 86),
        )),
    CustomDropDownItem(
        name: "",
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.transparent,
        )),
  ];

  static List<CustomDropDownItem> customDropDownItems33 = [
    CustomDropDownItem(
        name: "Accepted",
        icon: Icon(
          Icons.done,
          color: Colors.green,
        )),
    CustomDropDownItem(name: "Pending", icon: Icon(Icons.pending_rounded)),
    CustomDropDownItem(
        name: "Ready to Ship", icon: Icon(Icons.pending_rounded)),
    CustomDropDownItem(
        name: "Shipped",
        icon: Icon(
          Icons.close_rounded,
          color: Colors.red,
        )),
    CustomDropDownItem(
        name: "Delivered",
        icon: Icon(
          Icons.close_rounded,
          color: Colors.red,
        )),
    CustomDropDownItem(
        name: "Cancelled",
        icon: Icon(
          Icons.close_rounded,
          color: Colors.red,
        )),
    CustomDropDownItem(
        name: "Failed Delivery",
        icon: Icon(
          Icons.close_rounded,
          color: Colors.red,
        )),
    CustomDropDownItem(
        name: "Returned",
        icon: Icon(
          Icons.close_rounded,
          color: Colors.red,
        )),
    CustomDropDownItem(
        name: "No Selected",
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.transparent,
        )),
  ];
}

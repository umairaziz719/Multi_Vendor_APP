import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_webapp/Controllers/AuthController.dart';

import 'package:multi_vendor_webapp/utils/styles.dart';

import '../Controllers/MainController.dart';
import '../Pages/LoginForm/login.dart';
import '../constants/controllers.dart';
import '../models/customdropdownmodel.dart';
import 'customtext.dart';

Widget topnavbarrr(String value, String asset, VoidCallback func,
        bool isvisible, String name) =>
    Container(
      height: 100,
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 20,
          ),
          isvisible
              ? IconButton(
                  onPressed: func,
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black.withOpacity(0.8),
                  ))
              : SizedBox(),
          // Container(
          //   child: CustomText(
          //     text: value,
          //     color: dark,
          //     size: 25,
          //     weight: FontWeight.bold,
          //   ),
          // ),
          Spacer(),
          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(30),
          //   ),
          //   child: Container(
          //     margin: EdgeInsets.all(2),
          //     padding: EdgeInsets.all(2),
          //     child: CircleAvatar(
          //       child: Image.asset("assets/icons/logo2.png"),
          //     ),
          //   ),
          // ),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: light,
                borderRadius: BorderRadius.circular(30),
              ),
              margin: EdgeInsets.all(2),
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: light,
                    child: Icon(
                      Icons.person,
                      color: Colors.black87,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2, right: 10),
                    child: CustomText(
                      text: "Support",
                      color: Colors.black87,
                      size: 14,
                      weight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Container(
          //   width: 30,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage("assets/icons/logo2.png"),
          //         fit: BoxFit.cover),
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(30),
          //   ),
          // ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              margin: EdgeInsets.all(2),
              padding: EdgeInsets.all(2),
              child: CircleAvatar(
                child: asset == "" ? Container() : Image.network(asset),
              ),
            ),
          ),
          CustomText(
            text: name == "" ? "username" : "$name",
          ),
          GetX<AuthController>(builder: (controller) {
            return controller.popupMenuItemIndex.value != null
                ? PopupMenuButton(
                    onSelected: (value) {
                      _onMenuItemSelected(
                          value as int, controller.popupMenuItemIndex.value);
                    },
                    itemBuilder: (ctx) => [
                      _buildPopupMenuItem(
                          'Logout', Icons.exit_to_app, Options.Logout.index),
                    ],
                    icon: Icon(Icons.settings),
                  )
                : PopupMenuButton(
                    onSelected: (value) {
                      _onMenuItemSelected(
                          value as int, controller.popupMenuItemIndex.value);
                    },
                    itemBuilder: (ctx) => [
                      _buildPopupMenuItem(
                          'Logout', Icons.exit_to_app, Options.Logout.index),
                    ],
                    icon: Icon(Icons.settings),
                  );
          })
        ],
      ),
    );

PopupMenuItem _buildPopupMenuItem(
    String title, IconData iconData, int position) {
  return PopupMenuItem(
    value: position,
    child: Row(
      children: [
        Icon(
          iconData,
          color: Colors.black,
        ),
        Text(title),
      ],
    ),
  );
}

Color _changeColorAccordingToMenuItem = Colors.red;

enum Options { Logout }

_onMenuItemSelected(int value, int oo) async {
  oo = value;

  print(oo);

  if (value == Options.Logout.index) {
    _changeColorAccordingToMenuItem = Colors.red;
    await _signOut();
  } else {
    _changeColorAccordingToMenuItem = Colors.purple;
  }
}

final FirebaseAuth _auth = FirebaseAuth.instance;
Future<void> _signOut() async {
  User? currentuserss = _auth.currentUser;

  await _auth.signOut();
  if (currentuserss != null) {
    Get.snackbar("Logged-out", "You have successfully logout");
    Get.offAll(LoginForm());
  } else {
    Get.snackbar("Already logged-out", "You have to login");
  }
}

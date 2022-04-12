import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/mainpagemiddleview.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/mainpagerightview.dart';
import 'package:multi_vendor_webapp/constants/controllers.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';
import 'package:multi_vendor_webapp/widgets/top_Navbar.dart';

import '../../Controllers/AuthController.dart';
import 'View/sliderformView.dart';

class SliderForm extends StatelessWidget {
  SliderForm({Key? key}) : super(key: key);
  final controllerss = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: hoverbackground,
          padding: EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => topnavbarrr(
                  menuController.activeItem.value,
                  controllerss.model.isEmpty
                      ? ""
                      : "${controllerss.model[0].imgurl}",
                  () {},
                  false,
                  "${controllerss.username.value}")),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Expanded(child: SliderView()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

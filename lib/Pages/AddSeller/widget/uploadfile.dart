import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_webapp/Controllers/AddDataController.dart';
import 'package:multi_vendor_webapp/Controllers/AuthController.dart';

import '../../../widgets/customText.dart';

Widget uploadFile(String title, AddDataController controller) {
  return InkWell(
    onTap: () {
      if (title == "Upload your ID card front side") {
        controller.getLogoImage("idfront");
      }
      if (title == "Upload your ID card Back side") {
        controller.getLogoImage("idback");
      }
      if (title == "Upload your Store Logo") {
        controller.getLogoImage("logo");
      }
      if (title == "Upload your Store Cover Photo") {
        controller.getLogoImage("cover");
      }
      if (title == "Upload your Profile Picture") {}
    },
    child: Container(
      height: 200,
      padding: EdgeInsets.all(10), //padding of outer Container
      margin: EdgeInsets.all(10),
      child: DottedBorder(
        color: Colors.black.withOpacity(0.4), //color of dotted/dash line
        strokeWidth: 3, //thickness of dash/dots
        dashPattern: [10, 6],
        child: Container(
          width: double.infinity,
          color: Colors.grey.withOpacity(0.2),
          child: GetX<AddDataController>(builder: (controller) {
            return title == "Upload your ID card front side"
                ? controller.fakemap22['idfront'] == '' ||
                        controller.fakemap22['idfront'] == null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cloud,
                            color: Colors.grey.withOpacity(0.4),
                            size: 30,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: "$title",
                            size: 16,
                            color: Colors.black.withOpacity(0.4),
                            weight: FontWeight.bold,
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Visibility(
                              visible: controller.fakemap22['idfront'] == '' ||
                                      controller.fakemap22['idfront'] == null
                                  ? false
                                  : true,
                              child: Container(
                                height: 150,
                                child: Image.network(
                                  controller.fakemap22['idfront'],
                                  fit: BoxFit.cover,
                                  height: 150,
                                  width: double.infinity,
                                ),
                              )),
                        ],
                      )
                : title == "Upload your ID card Back side"
                    ? controller.fakemap22['idback'] == '' ||
                            controller.fakemap22['idback'] == null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.cloud,
                                color: Colors.grey.withOpacity(0.4),
                                size: 30,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CustomText(
                                text: "$title",
                                size: 16,
                                color: Colors.black.withOpacity(0.4),
                                weight: FontWeight.bold,
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Visibility(
                                  visible: controller.fakemap22['idback'] ==
                                              '' ||
                                          controller.fakemap22['idback'] == null
                                      ? false
                                      : true,
                                  child: Container(
                                    height: 150,
                                    child: Image.network(
                                      controller.fakemap22['idback'],
                                      fit: BoxFit.cover,
                                      height: 150,
                                      width: double.infinity,
                                    ),
                                  )),
                            ],
                          )
                    : title == "Upload your Store Logo"
                        ? controller.fakemap22['logo'] == '' ||
                                controller.fakemap22['logo'] == null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.cloud,
                                    color: Colors.grey.withOpacity(0.4),
                                    size: 30,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomText(
                                    text: "$title",
                                    size: 16,
                                    color: Colors.black.withOpacity(0.4),
                                    weight: FontWeight.bold,
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Visibility(
                                      visible: controller.fakemap22['logo'] ==
                                                  '' ||
                                              controller.fakemap22['logo'] ==
                                                  null
                                          ? false
                                          : true,
                                      child: Container(
                                        height: 150,
                                        child: Image.network(
                                          controller.fakemap22['logo'],
                                          fit: BoxFit.cover,
                                          height: 150,
                                          width: double.infinity,
                                        ),
                                      )),
                                ],
                              )
                        : controller.fakemap22['cover'] == '' ||
                                controller.fakemap22['cover'] == null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.cloud,
                                    color: Colors.grey.withOpacity(0.4),
                                    size: 30,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomText(
                                    text: "$title",
                                    size: 16,
                                    color: Colors.black.withOpacity(0.4),
                                    weight: FontWeight.bold,
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Visibility(
                                      visible: controller.fakemap22['cover'] ==
                                                  '' ||
                                              controller.fakemap22['cover'] ==
                                                  null
                                          ? false
                                          : true,
                                      child: Container(
                                        height: 150,
                                        child: Image.network(
                                          controller.fakemap22['cover'],
                                          fit: BoxFit.cover,
                                          height: 150,
                                          width: double.infinity,
                                        ),
                                      )),
                                ],
                              );
          }),
        ),
      ),
    ),
  );
}

Widget uploadFile33(String title, AuthController controller) {
  return InkWell(
    onTap: () async {
      if (title == "Upload your Profile Picture") {
        await controller.getLogoImage("admin_img");
        print(controller.profile.value);
      }
    },
    child: Container(
      height: 200,
      padding: EdgeInsets.all(10), //padding of outer Container
      margin: EdgeInsets.all(10),
      child: DottedBorder(
        color: Colors.black.withOpacity(0.4), //color of dotted/dash line
        strokeWidth: 3, //thickness of dash/dots
        dashPattern: [10, 6],
        child: Container(
          width: double.infinity,
          color: Colors.grey.withOpacity(0.2),
          child: GetX<AuthController>(builder: (controller) {
            return controller.profile.value == ''
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cloud,
                        color: Colors.grey.withOpacity(0.4),
                        size: 30,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "$title",
                        size: 16,
                        color: Colors.black.withOpacity(0.4),
                        weight: FontWeight.bold,
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                          visible:
                              controller.profile.value == '' ? false : true,
                          child: Container(
                            height: 150,
                            child: Image.network(
                              controller.profile.value,
                              fit: BoxFit.cover,
                              height: 150,
                              width: double.infinity,
                            ),
                          )),
                    ],
                  );
          }),
        ),
      ),
    ),
  );
}

Widget uploadFile92(String title, AddDataController controller) {
  return InkWell(
    onTap: () async {
      if (title == "Upload your Banner Picture") {
        await controller.getLogoImage("slider_img");
        print(controller.sliderimg.value);
      }
    },
    child: Container(
      height: 200,
      padding: EdgeInsets.all(10), //padding of outer Container
      margin: EdgeInsets.all(10),
      child: DottedBorder(
        color: Colors.black.withOpacity(0.4), //color of dotted/dash line
        strokeWidth: 3, //thickness of dash/dots
        dashPattern: [10, 6],
        child: Container(
          width: double.infinity,
          color: Colors.grey.withOpacity(0.2),
          child: GetX<AddDataController>(builder: (controller) {
            return controller.sliderimg.value == ''
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cloud,
                        color: Colors.grey.withOpacity(0.4),
                        size: 30,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "$title",
                        size: 16,
                        color: Colors.black.withOpacity(0.4),
                        weight: FontWeight.bold,
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                          visible:
                              controller.sliderimg.value == '' ? false : true,
                          child: Container(
                            height: 150,
                            child: Image.network(
                              controller.sliderimg.value,
                              fit: BoxFit.cover,
                              height: 150,
                              width: double.infinity,
                            ),
                          )),
                    ],
                  );
          }),
        ),
      ),
    ),
  );
}

Widget uploadFile88(String title, AddDataController controller) {
  return InkWell(
    onTap: () async {
      if (title == "Upload delivery Profile Picture") {
        await controller.getLogoImage("delivery");
        print(controller.deliveryprofile);
      }
    },
    child: Container(
      height: 200,
      padding: EdgeInsets.all(10), //padding of outer Container
      margin: EdgeInsets.all(10),
      child: DottedBorder(
        color: Colors.black.withOpacity(0.4), //color of dotted/dash line
        strokeWidth: 3, //thickness of dash/dots
        dashPattern: [10, 6],
        child: Container(
          width: double.infinity,
          color: Colors.grey.withOpacity(0.2),
          child: GetX<AddDataController>(builder: (controller) {
            return controller.deliveryprofile.value == ''
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cloud,
                        color: Colors.grey.withOpacity(0.4),
                        size: 30,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "$title",
                        size: 16,
                        color: Colors.black.withOpacity(0.4),
                        weight: FontWeight.bold,
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                          visible: controller.deliveryprofile.value == ''
                              ? false
                              : true,
                          child: Container(
                            height: 150,
                            child: Image.network(
                              controller.deliveryprofile.value,
                              fit: BoxFit.cover,
                              height: 150,
                              width: double.infinity,
                            ),
                          )),
                    ],
                  );
          }),
        ),
      ),
    ),
  );
}

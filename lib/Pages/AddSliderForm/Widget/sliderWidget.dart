import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:multi_vendor_webapp/Controllers/AddDataController.dart';
import 'package:multi_vendor_webapp/Controllers/AuthController.dart';
import 'package:multi_vendor_webapp/Controllers/MainController.dart';
import 'package:multi_vendor_webapp/Pages/AddSeller/widget/selectedcategory.dart';
import 'package:multi_vendor_webapp/Pages/AddSeller/widget/selectioncategory.dart';
import 'package:multi_vendor_webapp/Pages/AddSeller/widget/uploadfile.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/customSeller.dart';
import 'package:multi_vendor_webapp/Pages/SellerPage/widgets/customSeller.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';

import '../../../constants/controllers.dart';
import '../../../models/customdropdownmodel.dart';
import '../../../utils/routes.dart';
import '../../AddSeller/addseller.dart';
import '../../AddSeller/widget/customtextfield.dart';

class SliderWidget extends StatelessWidget {
  SliderWidget({Key? key}) : super(key: key);
  final controller = Get.put(AddDataController());
  final formKey2 = GlobalKey<FormState>();
  final contro = Get.put(MainProvider());
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Container(
        width: 700,
        margin: EdgeInsets.only(top: 10),
        child: Form(
          key: formKey2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10),
                    child: Container(
                      height: 100,
                      // color: Colors.red,
                      padding: EdgeInsets.only(left: 15, right: 15, bottom: 0),
                      child: CustomText(
                        text: "Multi-Vendor DashBoard",
                        size: 35,
                        color: dark,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  height: 100,
                  // color: Colors.red,
                  padding: EdgeInsets.only(left: 15, right: 15, bottom: 0),
                  child: CustomText(
                    text: "Slider Form",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              customTextfield22("Name", "Type your Name", controller.sliname,
                  "Name is not valid"),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: dark,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.all(0.5),
                        padding: EdgeInsets.all(15),
                        child: GetX<MainProvider>(builder: (controller) {
                          return DropdownButton<CustomDropDownItem>(
                              value: controller.selectedcatItem.value,
                              items: controller.catlistitems
                                  .map<DropdownMenuItem<CustomDropDownItem>>(
                                      (CustomDropDownItem value) {
                                return DropdownMenuItem<CustomDropDownItem>(
                                    value: value,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                            width: 150,
                                            child: Text(value.name!)),
                                      ],
                                    ));
                              }).toList(),
                              onChanged: (CustomDropDownItem? newValue) {
                                controller.setDropDownselectedValue(newValue!);

                                // if (newValue.name == "No Data Selected") {
                                //   Provider.of<JobProvider>(context,
                                //           listen: false)
                                //       .selectedDriverVehicle = "";
                                // } else {
                                //   Provider.of<JobProvider>(context,
                                //           listen: false)
                                //       .selectedDriverVehicle = newValue.name!;
                                // }
                              },
                              underline: DropdownButtonHideUnderline(
                                  child: Container()));
                        })),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.transparent,
                      )),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              GetBuilder<AddDataController>(builder: (controller) {
                return Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: uploadFile92(
                            "Upload your Banner Picture", controller)),
                    Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.transparent,
                        )),
                  ],
                );
              }),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GetX<AddDataController>(builder: (controller) {
                    return !controller.issliderloading.value
                        ? Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.height *
                                          0.01)),
                              elevation: 2.0,
                              clipBehavior: Clip.antiAlias,
                              child: MaterialButton(
                                color: dark,
                                splashColor: Colors.white,
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Center(
                                      child: Text(
                                        'Submitt',
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                          fontFamily: 'MontRegular',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )),
                                onPressed: () {
                                  print("?asdasd");

                                  if (formKey2.currentState!.validate()) {
                                    controller.issliderloading.value = true;
                                    controller
                                        .slidersettingupdata(contro.name!);
                                  } else {
                                    Get.snackbar("Empty", "Fields are empty");
                                  }
                                },
                              ),
                            ),
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.height *
                                          0.01)),
                              elevation: 2.0,
                              clipBehavior: Clip.antiAlias,
                              child: MaterialButton(
                                color: dark,
                                splashColor: Colors.white,
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )),
                                onPressed: () {},
                              ),
                            ),
                          );
                  }),
                ],
              ),
            ],
          ),
        ));
  }
}

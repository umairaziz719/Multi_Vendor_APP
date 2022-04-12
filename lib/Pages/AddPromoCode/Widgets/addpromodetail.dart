import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:multi_vendor_webapp/Controllers/AddDataController.dart';
import 'package:multi_vendor_webapp/Controllers/MainController.dart';
import 'package:multi_vendor_webapp/Pages/AddSeller/widget/selectedcategory.dart';
import 'package:multi_vendor_webapp/Pages/AddSeller/widget/selectioncategory.dart';
import 'package:multi_vendor_webapp/Pages/AddSeller/widget/uploadfile.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/customSeller.dart';
import 'package:multi_vendor_webapp/Pages/SellerPage/widgets/customSeller.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';

import '../../AddSeller/addseller.dart';
import '../../AddSeller/widget/customtextfield.dart';

class AddPromoDetail extends StatelessWidget {
  AddPromoDetail({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Container(
      width: 600.h,
      margin: EdgeInsets.only(top: 10),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: 100,
                // color: Colors.red,
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 0),
                child: CustomText(
                  text: "Add Promo Code Form",
                  size: 24,
                  color: dark,
                  weight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            GetBuilder<AddDataController>(builder: (controller) {
              return Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: customTextfield22("User of Number", "000",
                        controller.userno, "Enter details"),
                  ),
                  Expanded(
                      flex: 1,
                      child: customTextfield22("Code", "Type your code here",
                          controller.code, "Enter Code please")),
                ],
              );
            }),
            GetBuilder<AddDataController>(builder: (controller) {
              return Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: customTextfield22(
                        "Message", "Type your", controller.msg, "Enter msg"),
                  ),
                  Expanded(
                      flex: 1,
                      child: customTextfield22(
                          "Order Amount",
                          "Type your Amount here",
                          controller.orderamount,
                          "Enter Order Please")),
                ],
              );
            }),
            GetBuilder<AddDataController>(builder: (controller) {
              return Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: customTextfield22("Discount Type", "Cash Discount",
                        controller.distype, "Enter Discount Type please"),
                  ),
                  Expanded(
                      flex: 1,
                      child: customTextfield22(
                          "Discount",
                          "CounchersCodes.co.uk",
                          controller.dis,
                          "Enter Discunt")),
                ],
              );
            }),
            GetBuilder<AddDataController>(builder: (controller) {
              return Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: customTextfield22("Discount Amount", "30%",
                        controller.disamount, "Enter Discount Amount"),
                  ),
                  Expanded(
                      flex: 1,
                      child: customTextfield22("Repeat Usage", "No",
                          controller.repeat, "Enter Repeat Usage")),
                ],
              );
            }),
            GetBuilder<AddDataController>(builder: (controller) {
              return Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: customTextfield22("Start Date", "03/02/2022",
                        controller.stDate, "Enter Start Date"),
                  ),
                  Expanded(
                      flex: 1,
                      child: customTextfield22("End Date", "10/02/2022",
                          controller.enDate, "Enter End Date")),
                ],
              );
            }),
            GetBuilder<AddDataController>(builder: (controller) {
              return customTextfield22("Status", "Type your status",
                  controller.status, "Enter Status");
            }),
            SizedBox(
              height: 10.w,
            ),
            GetX<AddDataController>(builder: (controller) {
              return !controller.ispromoloading.value
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Material(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.height * 0.01)),
                        elevation: 2.0,
                        clipBehavior: Clip.antiAlias,
                        child: MaterialButton(
                          color: dark,
                          splashColor: Colors.white,
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02,
                                    fontFamily: 'MontRegular',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              controller.ispromoloading.value = true;
                              controller.promosettingupdata();
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
                                MediaQuery.of(context).size.height * 0.01)),
                        elevation: 2.0,
                        clipBehavior: Clip.antiAlias,
                        child: MaterialButton(
                          color: dark,
                          splashColor: Colors.white,
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: CircularProgressIndicator(),
                              )),
                          onPressed: () {},
                        ),
                      ),
                    );
            }),
          ],
        ),
      ),
    );
  }
}

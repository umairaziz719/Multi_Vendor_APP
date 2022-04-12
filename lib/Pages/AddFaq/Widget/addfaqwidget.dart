import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
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

class AddFAQWidget extends StatelessWidget {
  AddFAQWidget({Key? key}) : super(key: key);
  final controller = Get.put(AddDataController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return 
    Container(
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
                    text: "Add FAQ Form",
                    size: 24,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              customTextfield22("Question", "Type your question here",
                  controller.ques, " Add Question here"),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: customTextfield22("Answer", "Type your Answer here",
                        controller.ans, "Add your answer"),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.transparent,
                      )),
                ],
              ),
              SizedBox(
                height: 10.w,
              ),
              GetX<AddDataController>(builder: (controller) {
                return !controller.questionloading.value
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
                                controller.questionloading.value = true;
                                controller.faqsettingupdata();
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
        ));
  }
}

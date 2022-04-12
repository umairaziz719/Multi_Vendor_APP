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
import 'package:multi_vendor_webapp/utils/routes.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';

import '../../AddSeller/addseller.dart';
import '../../AddSeller/widget/customtextfield.dart';

class LoginFormWidget extends StatelessWidget {
  LoginFormWidget({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();
  final loginformKey = GlobalKey<FormState>();
  final control = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Container(
      width: 700,
      margin: EdgeInsets.only(top: 10),
      child: Form(
        key: loginformKey,
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
                  text: "Login Form",
                  size: 20,
                  color: dark,
                  weight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            customTextfield22("Email", "Type your Email@", control.loginEmail,
                "Please enter your Email"),
            SizedBox(
              height: 5,
            ),
            customTextfield22("Password", "Type your Password here",
                control.loginpassword, "Please enter your Password"),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GetX<AuthController>(builder: (controller) {
                  return !controller.isloginloading.value
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
                                      'Login',
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
                                if (loginformKey.currentState!.validate()) {
                                  controller.isloginloading.value = true;
                                  controller.authenticatingLoginForm();
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
                                  child: const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )),
                              onPressed: () {},
                            ),
                          ),
                        );
                }),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

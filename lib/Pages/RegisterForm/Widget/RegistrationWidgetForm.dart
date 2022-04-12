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

import '../../../utils/routes.dart';
import '../../AddSeller/addseller.dart';
import '../../AddSeller/widget/customtextfield.dart';

class RegisterWidget extends StatelessWidget {
  RegisterWidget({Key? key}) : super(key: key);
  final controller = Get.put(AuthController());
  final registerformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Container(
        width: 700,
        margin: EdgeInsets.only(top: 10),
        child: Form(
          key: registerformKey,
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
                    text: "Registration Form",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              customTextfield22("UserName", "Type your Username",
                  controller.registerusername, "Username is not valid"),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: customTextfield22("Email", "Type your Email",
                        controller.registerEmail, "Email is not valid"),
                  ),
                  Expanded(
                      flex: 1,
                      child: customTextfield22(
                          "Password",
                          "Type your password",
                          controller.registerpassword,
                          "Password not be empty!")),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: uploadFile33(
                          "Upload your Profile Picture", controller)),
                  Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.transparent,
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
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
                                'Register',
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                  fontFamily: 'MontRegular',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                        onPressed: () {
                          print("?asdasd");

                          if (registerformKey.currentState!.validate()) {
                            print("?asdasd");
                            controller.isregisterloading.value = true;
                            controller.authenticateRegister();
                          } else {
                            Get.snackbar("Empty", "Fields are empty");
                          }
                        },
                      ),
                    ),
                  ),
                  Spacer(),
                  CustomText(
                    text: "Already have an Account! ",
                    size: 16,
                    color: Colors.black,
                    weight: FontWeight.w500,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.login);
                    },
                    child: CustomText(
                      text: "Login",
                      size: 20,
                      color: dark,
                      weight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

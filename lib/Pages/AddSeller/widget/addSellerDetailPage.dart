import 'package:flutter/material.dart';
import 'package:flutter_geo_hash/geohash.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
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
import 'customtextfield.dart';
import 'google_map_widget.dart';

class AddSellerDetailPage extends StatelessWidget {
  AddSellerDetailPage({Key? key}) : super(key: key);
  double lat = 51.5074;
  double lng = 0.1278;
  MyGeoHash myGeoHash = MyGeoHash();
  final controller = Get.put(AddDataController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String pathToReference = "Sites";

    return Container(
        width: 600.h,
        margin: EdgeInsets.only(top: 10),
        child: GetBuilder<AddDataController>(builder: (controller) {
          return Form(
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
                      text: "Add Seller Form",
                      size: 24,
                      color: dark,
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                customTextfield22("Owner Name", "Type your name here",
                    controller.ownerName, "Please type your name"),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: customTextfield22("Email", "Type your Email here",
                          controller.stemail, "Enter your email"),
                    ),
                    Expanded(
                        flex: 1,
                        child: customTextfield22(
                            "Phone",
                            "Type your Phone here",
                            controller.stphone,
                            "Enter youe phone")),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: customTextfield22(
                            "Location",
                            "Type your Location ",
                            controller.stlocatio,
                            "Enter your Current Location")),
                    Expanded(
                      flex: 1,
                      child: Container(
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
                                    'User Current Location',
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
                            onPressed: () {},
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.w,
                ),
                Container(
                    height: 200,
                    color: Colors.grey.shade200,
                    child: GoogleMapWidget()),
                SizedBox(
                  height: 10.w,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: customTextfield22(
                          "Store Name",
                          "Type your Store name here",
                          controller.storename,
                          "Enter your Store name"),
                    ),
                    Expanded(
                        flex: 1,
                        child: customTextfield22(
                            "Store Tagline",
                            "Type your Store Tagline here",
                            controller.storetag,
                            "Enter your Tagline")),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: customTextfield22("Description", "add",
                          controller.stdes, "Enter your Store Description"),
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
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: customTextfield22(
                          "Password",
                          "Type your Password here",
                          controller.stpassword,
                          "Enter your Password"),
                    ),
                    Expanded(
                        flex: 1,
                        child: customTextfield22(
                            "Address",
                            "Type your Address here",
                            controller.staddress,
                            "Enter your Address")),
                  ],
                ),
                SizedBox(
                  height: 10.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 100,
                        // color: Colors.red,
                        padding:
                            EdgeInsets.only(left: 15, right: 15, bottom: 0),
                        child: CustomText(
                          text: "Identity Information",
                          size: 20,
                          color: Colors.black,
                          weight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                GetBuilder<AddDataController>(builder: (controller) {
                  return Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: uploadFile(
                              "Upload your ID card front side", controller)),
                      Expanded(
                          flex: 1,
                          child: uploadFile(
                              "Upload your ID card Back side", controller)),
                    ],
                  );
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 50,
                        // color: Colors.red,
                        padding:
                            EdgeInsets.only(left: 15, right: 15, bottom: 0),
                        child: CustomText(
                          text: "Bank Information",
                          size: 20,
                          color: Colors.black,
                          weight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: customTextfield22("Account Number", "#1234567",
                          controller.staccNumber, "Enter your Account Number"),
                    ),
                    Expanded(
                        flex: 1,
                        child: customTextfield22(
                            "Holder Name",
                            "Type your Name here",
                            controller.stholdername,
                            "Enter your Holder Name")),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: customTextfield22("Bank Name", "Bank of America",
                          controller.Bankname, "Enter your Bank Name"),
                    ),
                    Expanded(
                        flex: 1,
                        child: customTextfield22("Account Type", "Fixed",
                            controller.Accounttype, "Enter your Account type")),
                  ],
                ),

                SizedBox(
                  height: 10.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 100,
                        // color: Colors.red,
                        padding:
                            EdgeInsets.only(left: 15, right: 15, bottom: 0),
                        child: CustomText(
                          text: "Store Information",
                          size: 20,
                          color: Colors.black,
                          weight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                GetBuilder<AddDataController>(builder: (controller) {
                  return Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child:
                              uploadFile("Upload your Store Logo", controller)),
                      Expanded(
                          flex: 1,
                          child: uploadFile(
                              "Upload your Store Cover Photo", controller)),
                    ],
                  );
                }),
                customTextfield22("Account Status", "Type your account Status",
                    controller.accountstatus, "Enter your Account Status"),
                SizedBox(
                  height: 10.w,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 50,
                        // color: Colors.red,
                        padding: EdgeInsets.only(left: 15, right: 5, bottom: 0),
                        child: CustomText(
                          text: "Main Category of Store",
                          size: 20,
                          color: Colors.black,
                          weight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomText(
                      text: " (You can select Only 1)",
                      size: 20,
                      color: Colors.black,
                      weight: FontWeight.normal,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    selectioncat("Food", controller, "main"),
                    selectioncat("Men", controller, "main"),
                    selectioncat("Wonmen", controller, "main"),
                    selectioncat("Kids", controller, "main"),
                    selectioncat("Gifts", controller, "main"),
                    selectioncat("Outdoors", controller, "main"),
                  ],
                ),
                SizedBox(
                  height: 4.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "You have selected: ",
                      size: 20,
                      color: Colors.black,
                      weight: FontWeight.normal,
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.w,
                ),
                Row(
                  children: [
                    Container(
                      height: 50,

                      child: selectedcat("${controller.maincat.value}"),

                      //   selectedcat("Food"),
                      //   selectedcat("Men"),
                      //   selectedcat("Wonmen"),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                      ),
                    )
                  ],
                ),

                // Sub Category...............

                SizedBox(
                  height: 10.w,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 50,
                        // color: Colors.red,
                        padding: EdgeInsets.only(left: 15, right: 5, bottom: 0),
                        child: CustomText(
                          text: "Sub Category of Store",
                          size: 20,
                          color: Colors.black,
                          weight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomText(
                      text: " (You can select more than 1)",
                      size: 20,
                      color: Colors.black,
                      weight: FontWeight.normal,
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      selectioncat("Bakery", controller, "sub"),
                      SizedBox(
                        width: 10,
                      ),
                      selectioncat("Meal", controller, "sub"),
                      SizedBox(
                        width: 10,
                      ),
                      selectioncat("Bread", controller, "sub"),
                      SizedBox(
                        width: 10,
                      ),
                      selectioncat("Pasta", controller, "sub"),
                      SizedBox(
                        width: 10,
                      ),
                      selectioncat("Seafood", controller, "sub"),
                      SizedBox(
                        width: 10,
                      ),
                      selectioncat("Salad Dressing", controller, "sub"),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 4.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "You have selected: ",
                      size: 20,
                      color: Colors.black,
                      weight: FontWeight.normal,
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.w,
                ),
                Container(
                    height: 60,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.subcat.length,
                        itemBuilder: (context, index) {
                          return selectedcat("${controller.subcat[index]}");
                        })

                    //  List.generate(
                    //   controller.subcat.length,
                    //   (index) => selectedcat(controller.subcat[index]),
                    // )
                    //   selectedcat("Bakery"),
                    //   selectedcat("Bread"),
                    //   selectedcat("Seafood"),
                    // ],
                    ),
                SizedBox(
                  height: 4.w,
                ),
                GetX<AddDataController>(builder: (controller) {
                  return !controller.issellerloading.value
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
                                  controller.issellerloading.value = true;
                                  controller.sellersetup();
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
          );
        }));
  }
}

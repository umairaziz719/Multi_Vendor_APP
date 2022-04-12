import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:multi_vendor_webapp/Controllers/MainController.dart';
import 'package:multi_vendor_webapp/Controllers/databasemanager.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/customSeller.dart';
import 'package:multi_vendor_webapp/Pages/SellerPage/widgets/customSeller.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';

import '../../../constants/controllers.dart';
import '../../../models/customdropdownmodel.dart';
import '../../AddSeller/addseller.dart';
import '../../ViewSellerPage/viewsellerpage.dart';

class SellerDetail extends StatelessWidget {
  SellerDetail({Key? key}) : super(key: key);
  DatabaseManager dm = DatabaseManager();
  final controller = Get.put(MainProvider());
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 100,
              // color: Colors.red,
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 0),
              child: Row(
                children: [
                  Expanded(
                    child: CustomText(
                      text: "Sellers Details",
                      size: 24,
                      color: Colors.black,
                      weight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.height * 0.03)),
                      elevation: 2.0,
                      clipBehavior: Clip.antiAlias,
                      child: MaterialButton(
                        color: dark,
                        splashColor: Colors.white,
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Text(
                                'Add Seller',
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddSeller()));
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
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
                              value: controller.selectedItem22.value,
                              items: Constants.customDropDownItems22
                                  .map<DropdownMenuItem<CustomDropDownItem>>(
                                      (CustomDropDownItem value) {
                                return DropdownMenuItem<CustomDropDownItem>(
                                    value: value,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                            height: 40,
                                            // width: 40,
                                            child: value.icon),
                                        Container(
                                            width: 150,
                                            child: Text(value.name!)),
                                      ],
                                    ));
                              }).toList(),
                              onChanged: (CustomDropDownItem? newValue) {
                                controller.setDropDownValue22(newValue!);

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
                        })

                        //  Row(
                        //   children: [
                        //     Icon(
                        //       Icons.filter_9_plus,
                        //       color: dark,
                        //     ),
                        //     SizedBox(
                        //       width: 6.w,
                        //     ),
                        //     Padding(
                        //       padding: const EdgeInsets.only(left: 10, right: 3),
                        //       child: CustomText(
                        //         text: "Filter",
                        //         color: dark,
                        //         size: 16.sp,
                        //         weight: FontWeight.normal,
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 4.w,
                        //     ),
                        //     Icon(
                        //       Icons.arrow_drop_down,
                        //       color: dark,
                        //     ),
                        //   ],
                        // ),

                        ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 70,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0.1),
              color: Colors.blue.withOpacity(0.1),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "ID",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: CustomText(
                      text: "Name",
                      size: 20,
                      color: dark,
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Store Name",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomText(
                    text: "Store Type",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomText(
                    text: "Email Address",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomText(
                    text: "Account Number",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomText(
                    text: "Phone Number",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomText(
                    text: "Actions",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Obx(() {
            return !controller.issellerloading.value
                ? controller.updatedsellerlist.value.length > 0 ||
                        controller.isfiltered2222.value == true
                    ? Container(
                        height: 600,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: controller.isfiltered2222.value != true
                            ? ListView(
                                children: List.generate(
                                    controller.updatedsellerlist.length,
                                    (index) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      CustomSeller(
                                        color: Colors.white,
                                        first:
                                            "${controller.updatedsellerlist[index].uid}",
                                        second:
                                            "${controller.updatedsellerlist[index].ownerName}",
                                        third:
                                            "${controller.updatedsellerlist[index].storeName}",
                                        four:
                                            "${controller.updatedsellerlist[index].storeTag}",
                                        five:
                                            "${controller.updatedsellerlist[index].email}",
                                        six:
                                            "${controller.updatedsellerlist[index].bankAccNum}",
                                        seven:
                                            "${controller.updatedsellerlist[index].phone}",
                                        ei1: IconButton(
                                          onPressed: () async {
                                            Get.to(ViewSellerPage(
                                                controller
                                                    .updatedsellerlist[index],
                                                controller
                                                    .gettingSellerdetailsforUser(
                                                        controller
                                                            .updatedsellerlist[
                                                                index]
                                                            .uid)));
                                          },
                                          color:
                                              Color.fromARGB(255, 0, 38, 255),
                                          icon: Icon(
                                            Icons.remove_red_eye,
                                          ),
                                        ),
                                        ei: IconButton(
                                          onPressed: () async {
                                            await dm.statusStoreDatabyID(
                                                controller
                                                    .updatedsellerlist[index]
                                                    .uid!,
                                                "Pending");
                                          },
                                          color:
                                              Color.fromARGB(255, 255, 153, 0),
                                          icon: Icon(
                                            Icons.timelapse_outlined,
                                          ),
                                        ),
                                        nig: IconButton(
                                          icon: Icon(Icons.check_circle),
                                          color: Colors.green,
                                          onPressed: () async {
                                            await dm.statusStoreDatabyID(
                                                controller
                                                    .updatedsellerlist[index]
                                                    .uid!,
                                                "Approved");
                                          },
                                        ),
                                        ten: IconButton(
                                          icon: Icon(Icons.close),
                                          color: Colors.red,
                                          onPressed: () async {
                                            await dm.deleteStoreDatabyID(
                                                controller
                                                    .updatedsellerlist[index]
                                                    .uid!);
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Divider(
                                        height: 1,
                                        color: Colors.black.withOpacity(.2),
                                      ),
                                    ],
                                  );
                                }),
                              )
                            : Center(
                                child:
                                    Lottie.asset('assets//images/nodata.json'),
                              ))
                    : Container(
                        height: 600,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: ListView(
                          children: List.generate(controller.storelist.length,
                              (index) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                CustomSeller(
                                  color: Colors.white,
                                  first: "${controller.storelist[index].uid}",
                                  second:
                                      "${controller.storelist[index].ownerName}",
                                  third:
                                      "${controller.storelist[index].storeName}",
                                  four:
                                      "${controller.storelist[index].storeTag}",
                                  five: "${controller.storelist[index].email}",
                                  six:
                                      "${controller.storelist[index].bankAccNum}",
                                  seven: "${controller.storelist[index].phone}",
                                  ei1: IconButton(
                                    onPressed: () async {
                                      Get.to(ViewSellerPage(
                                          controller.storelist[index],
                                          controller
                                              .gettingSellerdetailsforUser(
                                                  controller
                                                      .storelist[index].uid)));
                                    },
                                    color: Color.fromARGB(255, 0, 38, 255),
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                    ),
                                  ),
                                  ei: IconButton(
                                    onPressed: () async {
                                      await dm.statusStoreDatabyID(
                                          controller
                                              .storelist.value[index].uid!,
                                          "Pending");
                                    },
                                    color: Color.fromARGB(255, 255, 153, 0),
                                    icon: Icon(
                                      Icons.timelapse_outlined,
                                    ),
                                  ),
                                  nig: IconButton(
                                    icon: Icon(Icons.check_circle),
                                    color: Colors.green,
                                    onPressed: () async {
                                      await dm.statusStoreDatabyID(
                                          controller
                                              .storelist.value[index].uid!,
                                          "Approved");
                                    },
                                  ),
                                  ten: IconButton(
                                    icon: Icon(Icons.close),
                                    color: Colors.red,
                                    onPressed: () async {
                                      await dm.deleteStoreDatabyID(controller
                                          .storelist.value[index].uid!);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  height: 1,
                                  color: Colors.black.withOpacity(.2),
                                ),
                              ],
                            );
                          }),
                        ))
                : Container(
                    height: 600,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
          }),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:multi_vendor_webapp/Controllers/MainController.dart';
import 'package:multi_vendor_webapp/Controllers/databasemanager.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/customSeller.dart';
import 'package:multi_vendor_webapp/Pages/ProductPage/widgets/customProducts.dart';
import 'package:multi_vendor_webapp/Pages/SellerPage/widgets/customSeller.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';

import '../../../constants/controllers.dart';
import '../../../models/customdropdownmodel.dart';
import '../../ViewProductDetails/viewproductdetail.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key}) : super(key: key);
  DatabaseManager dm = DatabaseManager();
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
                      text: "Products Details",
                      size: 24,
                      color: Colors.black,
                      weight: FontWeight.bold,
                    ),
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
                              value: controller.selectedItem.value,
                              items: Constants.customDropDownItems
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
                                controller.setDropDownValue(newValue!);

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
                  flex: 2,
                  child: Center(
                    child: CustomText(
                      text: "Image",
                      size: 20,
                      color: dark,
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomText(
                    text: "Title",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Amount",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Status",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomText(
                    text: "Date",
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
                  flex: 1,
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
          GetX<MainProvider>(builder: (controller) {
            return !controller.isproductsloading.value
                ? controller.updatedproductlist.value.length > 0 ||
                        controller.isfiltered.value == true
                    ? Container(
                        height: 600,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: controller.isfiltered.value != true
                            ? ListView(
                                children: List.generate(
                                    controller.updatedproductlist.length,
                                    (index) {
                                  return Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomProducts(
                                          color: Colors.white,
                                          first:
                                              "#${controller.updatedproductlist[index].sku}",
                                          second:
                                              "${controller.updatedproductlist[index].images![0]}",
                                          third:
                                              "${controller.updatedproductlist[index].title}",
                                          four: controller
                                                          .updatedproductlist[
                                                              index]
                                                          .sellPrice ==
                                                      null ||
                                                  controller
                                                          .updatedproductlist[
                                                              index]
                                                          .sellPrice ==
                                                      ""
                                              ? "\$${controller.updatedproductlist[index].price}"
                                              : "\$${controller.updatedproductlist[index].sellPrice}",
                                          five:
                                              "${controller.updatedproductlist[index].status}",
                                          six:
                                              "${controller.updatedproductlist[index].sellPriceDuration!.toDate().toString().split(" ")[0]}",
                                          ei: IconButton(
                                            icon: Icon(
                                              Icons.remove_red_eye,
                                            ),
                                            iconSize: 35,
                                            onPressed: () async {
                                              Get.to(
                                                ViewProductDetail(
                                                    controller
                                                            .updatedproductlist[
                                                        index],
                                                    controller
                                                        .gettingOrderdetailsForSingleProduct(
                                                            controller
                                                                .updatedproductlist[
                                                                    index]
                                                                .title)),
                                              );
                                            },
                                            color: Colors.blue,
                                          ),
                                          nig: IconButton(
                                            icon: Icon(Icons.check_circle),
                                            color: Colors.green,
                                            iconSize: 35,
                                            onPressed: () async {
                                              await dm.statusProductDatabyID(
                                                  controller
                                                      .updatedproductlist[index]
                                                      .sku,
                                                  "Live");
                                            },
                                          ),
                                          ten: IconButton(
                                            icon: Icon(Icons.close_rounded),
                                            color: Colors.red,
                                            iconSize: 35,
                                            onPressed: () async {
                                              await dm.deleteProductByID(
                                                  controller
                                                      .updatedproductlist[index]
                                                      .sku);
                                            },
                                          )),
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
                          children:
                              List.generate(controller.newlist.length, (index) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                CustomProducts(
                                    color: Colors.white,
                                    first: "#${controller.newlist[index].sku}",
                                    second:
                                        "${controller.newlist[index].images![0]}",
                                    third: "${controller.newlist[index].title}",
                                    four: controller.newlist[index].price ==
                                                "" ||
                                            controller
                                                    .newlist[index].sellPrice ==
                                                ''
                                        ? "\$${controller.newlist[index].price}"
                                        : "\$${controller.newlist[index].sellPrice}",
                                    five: "${controller.newlist[index].status}",
                                    six: controller.newlist[index]
                                                    .sellPriceDuration !=
                                                null ||
                                            controller.newlist[index]
                                                    .sellPriceDuration !=
                                                ''
                                        ? "${controller.newlist[index].sellPriceDuration!.toDate().toString().split(" ")[0]}"
                                        : "--",
                                    ei: IconButton(
                                      icon: const Icon(
                                        Icons.remove_red_eye,
                                      ),
                                      iconSize: 35,
                                      onPressed: () async {
                                        Get.to(
                                          ViewProductDetail(
                                              controller.newlist[index],
                                              controller
                                                  .gettingOrderdetailsForSingleProduct(
                                                      controller.newlist[index]
                                                          .title)),
                                        );
                                      },
                                      color: Colors.blue,
                                    ),
                                    nig: IconButton(
                                      icon: Icon(Icons.check_circle),
                                      color: Colors.green,
                                      iconSize: 35,
                                      onPressed: () async {
                                        await dm.statusProductDatabyID(
                                            controller.newlist[index].sku,
                                            "Live");
                                      },
                                    ),
                                    ten: IconButton(
                                      icon: Icon(Icons.close_rounded),
                                      color: Colors.red,
                                      iconSize: 35,
                                      onPressed: () async {
                                        await dm.deleteProductByID(
                                            controller.newlist[index].sku!);
                                      },
                                    )),
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
                    child: const Center(child: CircularProgressIndicator()),
                  );
          }),
        ],
      ),
    );
  }

  List<CustomProducts> custom = const [
    CustomProducts(
        color: Colors.white,
        first: "#12345",
        second: "assets/images/headset.jpg",
        third: "HeadSets",
        four: "\$ 600",
        five: "Live",
        six: "01 Dec, 2022",
        ei: Icon(
          Icons.remove_red_eye,
          size: 35,
          color: Colors.blue,
        ),
        nig: Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 35,
        ),
        ten: Icon(
          Icons.close_rounded,
          color: Colors.red,
          size: 35,
        )),
    CustomProducts(
        color: Colors.white,
        first: "#20034",
        second: "assets/images/headset.jpg",
        third: "HeadSets",
        four: "\$ 600",
        five: "Pending",
        six: "01 Dec, 2022",
        ei: Icon(
          Icons.remove_red_eye,
          color: Colors.blue,
          size: 35,
        ),
        nig: Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 35,
        ),
        ten: Icon(
          Icons.close_rounded,
          color: Colors.red,
          size: 35,
        )),
    CustomProducts(
        color: Colors.white,
        first: "#8999",
        second: "assets/images/pendrive.jpg",
        third: "Pen Drive",
        four: "\$ 890",
        five: "Rejected",
        six: "20 Aug, 2022",
        ei: Icon(
          Icons.remove_red_eye,
          color: Colors.blue,
          size: 35,
        ),
        nig: Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 35,
        ),
        ten: Icon(
          Icons.close_rounded,
          color: Colors.red,
          size: 35,
        )),
    CustomProducts(
        color: Colors.white,
        first: "#3290",
        second: "assets/images/watch.jpg",
        third: "Watch",
        four: "\$ 900",
        five: "Pending",
        six: "20 Jan, 2022",
        ei: Icon(
          Icons.remove_red_eye,
          size: 35,
          color: Colors.blue,
        ),
        nig: Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 35,
        ),
        ten: Icon(
          Icons.close_rounded,
          color: Colors.red,
          size: 35,
        )),
    CustomProducts(
        color: Colors.white,
        first: "#2212",
        second: "assets/images/camera.jpg",
        third: "Camera",
        four: "\$ 300",
        five: "Live",
        six: "01 Aug, 2022",
        ei: Icon(
          Icons.remove_red_eye,
          color: Colors.blue,
          size: 35,
        ),
        nig: Icon(
          Icons.check_circle,
          size: 35,
          color: Colors.green,
        ),
        ten: Icon(
          Icons.close_rounded,
          color: Colors.red,
          size: 35,
        )),
    CustomProducts(
        color: Colors.white,
        first: "#300",
        second: "assets/images/headset.jpg",
        third: "Headset",
        four: "\$ 1000",
        five: "Rejected",
        six: "22 Jan, 2022",
        ei: Icon(
          Icons.remove_red_eye,
          color: Colors.blue,
          size: 35,
        ),
        nig: Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 35,
        ),
        ten: Icon(
          Icons.close_rounded,
          size: 35,
          color: Colors.red,
        )),
    CustomProducts(
        color: Colors.white,
        first: "#9000",
        second: "assets/images/watch.jpg",
        third: "Watch",
        four: "\$ 200",
        five: "Live",
        six: "20 Jan, 2022",
        ei: Icon(
          Icons.remove_red_eye,
          color: Colors.blue,
          size: 35,
        ),
        nig: Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 35,
        ),
        ten: Icon(
          Icons.close_rounded,
          color: Colors.red,
          size: 35,
        )),
    CustomProducts(
        color: Colors.white,
        first: "#7o00",
        second: "assets/images/camera.jpg",
        third: "Canon",
        four: "\$ 1000",
        five: "Live",
        six: "10 Dec, 2022",
        ei: Icon(
          Icons.remove_red_eye,
          color: Colors.blue,
          size: 35,
        ),
        nig: Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 35,
        ),
        ten: Icon(
          Icons.close_rounded,
          color: Colors.red,
          size: 35,
        )),
    CustomProducts(
        color: Colors.white,
        first: "#9000",
        second: "assets/images/person2.jpg",
        third: "Disk Drive",
        four: "\$ 100",
        five: "Pending",
        six: "17 Feb, 2022",
        ei: Icon(
          Icons.remove_red_eye,
          color: Colors.blue,
          size: 35,
        ),
        nig: Icon(
          Icons.check_circle,
          size: 35,
          color: Colors.green,
        ),
        ten: Icon(
          Icons.close_rounded,
          color: Colors.red,
          size: 35,
        )),
  ];
  TValue case2<TOptionType, TValue>(
    TOptionType selectedOption,
    Map<TOptionType, TValue> branches, [
    TValue? defaultValue = null,
  ]) {
    if (!branches.containsKey(selectedOption)) {
      return defaultValue!;
    }

    return branches[selectedOption]!;
  }
}

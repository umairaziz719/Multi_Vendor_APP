import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/customSeller.dart';
import 'package:multi_vendor_webapp/Pages/SellerPage/widgets/customSeller.dart';
import 'package:multi_vendor_webapp/Controllers/MainController.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';

import '../../../constants/controllers.dart';
import '../../../models/customdropdownmodel.dart';
import '../../ViewOrder/vieworder.dart';
import '../../ViewOrderDetail/vieworderdetail.dart';
import 'customOrder.dart';

class OrderDetail extends StatelessWidget {
  OrderDetail({Key? key}) : super(key: key);

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
                      text: "Order Details",
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
                              value: controller.selectedItem33.value,
                              items: Constants.customDropDownItems33
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
                                controller.setDropDownValue33(newValue!);

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
                  flex: 2,
                  child: CustomText(
                    text: "User Name",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomText(
                    text: "Seller Name",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Price",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
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
                    text: "Status",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Action",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          GetX<MainProvider>(builder: (controller) {
            return controller.isorderloading.value == false
                ? controller.updatedorderlist.value.length > 0 ||
                        controller.isfilltered444.value == true
                    ? Container(
                        height: 600,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: controller.isfilltered444.value != true
                            ? ListView(
                                children: List.generate(
                                    controller.updatedorderlist.length,
                                    (index) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: CustomOrder(
                                          color: Colors.white,
                                          first:
                                              "${controller.updatedorderlist[index].UserName}",
                                          second:
                                              "${controller.updatedorderlist[index].StoreName}",
                                          third:
                                              "${controller.updatedorderlist[index].cartlist![0].name}",
                                          four:
                                              "\$ ${controller.updatedorderlist[index].TotalPrice}",
                                          five:
                                              "${controller.updatedorderlist[index].DateTime!.toDate().toString().split(" ")[0]}",
                                          six:
                                              "${controller.updatedorderlist[index].status}",
                                          callback: () {
                                            controller.gettingUserdetails(
                                              controller.updatedorderlist[index]
                                                  .UserPhone,
                                            );
                                            controller.gettingOrderdetails(
                                              controller.updatedorderlist[index]
                                                  .StoreUid!,
                                            );
                                            Get.to(ViewOrderDetail(
                                              controller
                                                  .updatedorderlist[index],
                                              controller.gettingsellerdetails(
                                                  controller
                                                      .updatedorderlist[index]
                                                      .StoreName!),
                                            ));
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
                          children: List.generate(controller.orderslist.length,
                              (index) {
                            return Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: CustomOrder(
                                    color: Colors.white,
                                    first:
                                        "${controller.orderslist[index].UserName}",
                                    second:
                                        "${controller.orderslist[index].StoreName}",
                                    third:
                                        "${controller.orderslist[index].cartlist![0].name}",
                                    four:
                                        "\$ ${controller.orderslist[index].TotalPrice}",
                                    five:
                                        "${controller.orderslist[index].DateTime!.toDate().toString().split(" ")[0]}",
                                    six:
                                        "${controller.orderslist[index].status}",
                                    callback: () {
                                      controller.gettingUserdetails(controller
                                          .orderslist[index].UserPhone!);
                                      controller.gettingOrderdetails(controller
                                          .orderslist[index].StoreUid!);
                                      Get.to(ViewOrderDetail(
                                        controller.orderslist[index],
                                        controller.gettingsellerdetails(
                                            controller
                                                .orderslist[index].StoreName!),
                                      ));
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
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
          }),
        ],
      ),
    );
  }
}

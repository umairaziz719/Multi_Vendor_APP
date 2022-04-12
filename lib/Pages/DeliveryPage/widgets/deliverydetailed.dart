import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:multi_vendor_webapp/Pages/DeliveryPage/widgets/customdelivery.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/customSeller.dart';
import 'package:multi_vendor_webapp/Controllers/MainController.dart';

import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';

import '../../../Controllers/databasemanager.dart';
import '../../AddDeliveryBuy/adddeliveryboy.dart';

class DeliveryDetail extends StatelessWidget {
  DeliveryDetail({Key? key}) : super(key: key);
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
                      text: "Delivery Boys",
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
                                'Add Delivery Boy',
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
                                  builder: (context) => AddDBoy()));
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CustomText(
                    text: "View All",
                    size: 24,
                    color: dark,
                    weight: FontWeight.w500,
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
            padding: EdgeInsets.only(left: 30),
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
                    size: 14,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Image",
                    size: 14,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Name",
                    size: 14,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Phone ",
                    size: 14,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Expanded(
                  flex: 2,
                  child: CustomText(
                    text: "Address",
                    size: 14,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: CustomText(
                      text: "Actions",
                      size: 14,
                      color: dark,
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GetX<MainProvider>(builder: (controller) {
            return !controller.isriderloading.value
                ? Container(
                    height: 600,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: ListView(
                      children:
                          List.generate(controller.riderList.length, (index) {
                        return Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            CustomDelivery(
                              color: Colors.white,
                              first: '#102525',
                              se: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "${controller.riderList[index].Imgurl}"),
                              ),
                              third: "${controller.riderList[index].UserName}",
                              four: '${controller.riderList[index].Address}',
                              six: "${controller.riderList[index].Phone}",
                              ten: IconButton(
                                icon: Icon(
                                  Icons.close_rounded,
                                ),
                                iconSize: 35,
                                onPressed: () async {
                                  await dm.deleterider(
                                      controller.riderList[index].Email!);
                                },
                                color: Colors.red,
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

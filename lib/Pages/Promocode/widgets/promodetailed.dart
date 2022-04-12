import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/customSeller.dart';

import 'package:multi_vendor_webapp/Pages/Promocode/widgets/custompromo.dart';

import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';

import '../../../Controllers/MainController.dart';
import '../../../Controllers/databasemanager.dart';
import '../../AddPromoCode/addPromo.dart';

class PromoDetail extends StatelessWidget {
  PromoDetail({Key? key}) : super(key: key);
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
                      text: "Promo Code",
                      size: 18,
                      color: Colors.black,
                      weight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddPromo()));
                    },
                    child: CustomText(
                      text: "Add",
                      size: 16,
                      color: dark,
                      weight: FontWeight.w500,
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
            padding: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0.1),
              color: Colors.blue.withOpacity(0.1),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Id",
                    size: 14,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Promo Code",
                    size: 14,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Message",
                    size: 14,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Start date",
                    size: 14,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "End date",
                    size: 14,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Discount",
                    size: 14,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Discount Type",
                    size: 14,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Status",
                    size: 14,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Action",
                    size: 14,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          GetX<MainProvider>(builder: (controller) {
            return !controller.isPromoloading.value
                ? Container(
                    height: 600,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: ListView(
                      children:
                          List.generate(controller.promolist.length, (index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            CustomPromo(
                              color: Colors.white,
                              first:
                                  '${controller.promolist[index].UserNumber}',
                              second: '${controller.promolist[index].Code}',
                              third: Image(
                                image: AssetImage('assets/images/person1.jpg'),
                                width: 300,
                                height: 150,
                              ),
                              fourth: '${controller.promolist[index].Message}',
                              fifth: '${controller.promolist[index].StartDate}',
                              six: '${controller.promolist[index].EndDate}',
                              seven: '${controller.promolist[index].Discount}',
                              eight:
                                  '${controller.promolist[index].DiscountType}',
                              nine: '${controller.promolist[index].Status}',
                              ten: IconButton(
                                icon: Icon(Icons.delete),
                                color: Colors.red,
                                onPressed: () async {
                                  await dm.deletePrmo(
                                    controller.promolist[index].UserNumber!,
                                  );
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

  List<CustomPromo> custom = const [
    CustomPromo(
        color: Colors.white,
        first: '30',
        second: 'ESHOP10',
        third: Image(
          image: AssetImage('assets/images/person1.jpg'),
          width: 300,
          height: 150,
        ),
        fourth:
            'GET 10%\nOFF up to\n1000 or\nambove-\nvalid on\norders\nwith item\nworth\n5000 or\nmore',
        fifth: '01 Dec, 22',
        six: '10 Dec, 22',
        seven: '10',
        eight: 'Percentage',
        nine: 'Active',
        ten: Icon(
          Icons.delete,
          color: Colors.red,
        )),
  ];
}

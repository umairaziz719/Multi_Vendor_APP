import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:multi_vendor_webapp/Controllers/MainController.dart';

import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/customSeller.dart';
import 'package:multi_vendor_webapp/Pages/SliderPage/widgets/customslider.dart';

import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';

import '../../../Controllers/databasemanager.dart';
import '../../AddSliderForm/addslider.dart';

class SliderDetail extends StatelessWidget {
  SliderDetail({Key? key}) : super(key: key);
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
                      text: "Sliders",
                      size: 18,
                      color: Colors.black,
                      weight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(SliderForm());
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
                    text: "Type",
                    size: 14,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Type Id",
                    size: 14,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 200,
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: CustomText(
                      text: "Image",
                      size: 14,
                      color: dark,
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
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
            return !controller.iscatloading.value
                ? Container(
                    height: 600,
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: ListView(
                      children:
                          List.generate(controller.catlist.length, (index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            CustomSlider(
                              color: Colors.white,
                              first: '#102525',
                              se: '${controller.catlist[index].category}',
                              third: "${controller.catlist[index].name}",
                              fourth: Container(
                                width: 600.0,
                                height: 600.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${controller.catlist[index].image}"),
                                        fit: BoxFit.cover)),
                              ),
                              nine: IconButton(
                                icon: Icon(Icons.delete),
                                color: Colors.red,
                                onPressed: () async {
                                  await dm.deleteCat(
                                    controller.catlist[index].name!,
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
                    child: Center(child: CircularProgressIndicator()),
                  );
          }),
        ],
      ),
    );
  }

  // List<CustomSlider> custom = const [
  //   CustomSlider(
  //       color: Colors.white,
  //       first: '#102525',
  //       se: 'categories',
  //       third: "71",
  //       fourth: Image(
  //           image: AssetImage(
  //             'assets/images/person1.jpg',
  //           ),
  //           width: 300,
  //           height: 150,
  //           fit: BoxFit.fill),
  //       nine: Icon(
  //         Icons.delete,
  //         color: Colors.red,
  //       ),
  //       ten: Icon(
  //         Icons.edit,
  //         color: Colors.red,
  //       )),
  // ];
}

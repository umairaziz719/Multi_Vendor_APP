import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:multi_vendor_webapp/Controllers/MainController.dart';

import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/customSeller.dart';
import 'package:multi_vendor_webapp/Pages/SystemPage/widgets/customsystem.dart';

import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';

import '../../../Controllers/databasemanager.dart';
import '../../RegisterForm/registerform.dart';

class SystemDetail extends StatelessWidget {
  SystemDetail({Key? key}) : super(key: key);
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
                      text: "Admin Page",
                      size: 18,
                      color: Colors.black,
                      weight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(RegisterForm());
                    },
                    child: CustomText(
                      text: "Add Admin",
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
                    text: "Serial No",
                    size: 14,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  flex: 1,
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
                  flex: 1,
                  child: CustomText(
                    text: "Admin Name",
                    size: 14,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 7,
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
            return !controller.isadminloading.value
                ? Container(
                    height: 600,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: ListView(
                      children:
                          List.generate(controller.adminlist.length, (index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            CustomSystem(
                              color: Colors.white,
                              first: '#${index + 1}',
                              se: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "${controller.adminlist[index].imgurl}"),
                              ),
                              third: "${controller.adminlist[index].Username}",
                              ten: IconButton(
                                icon: Icon(
                                  Icons.close_rounded,
                                ),
                                iconSize: 35,
                                onPressed: () async {
                                  await dm.deleteAdmins(
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
                    child: Center(child: CircularProgressIndicator()),
                  );
          }),
        ],
      ),
    );
  }

  List<CustomSystem> custom = const [
    CustomSystem(
        color: Colors.white,
        first: '#01',
        se: CircleAvatar(
          backgroundImage: AssetImage('assets/ff7.jpg'),
        ),
        third: "Jenny",
        ten: Icon(
          Icons.delete,
          color: Colors.red,
        )),
  ];
}

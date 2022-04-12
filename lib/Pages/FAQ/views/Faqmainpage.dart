import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_webapp/Pages/FAQ/widgets/faqdetailed.dart';

import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/carview.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/topsellercard.dart';

import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../Controllers/MainController.dart';
import '../../../models/expansionlistModel.dart';
import '../../AddFaq/addfaq.dart';

class FaqMainPage extends StatelessWidget {
  FaqMainPage({Key? key}) : super(key: key);

  // List<ExpansionModel> items = generateItems(19);

  // Widget buildListPanel() {
  //   return ExpansionPanelList(
  //     expansionCallback: (panelIndex, isExpanded) {
  //       items[panelIndex].isexpanded = !isExpanded;
  //     },
  //     children: items.map<ExpansionPanel>((ExpansionModel modelitem) {
  //       return ExpansionPanel(
  //         headerBuilder: (context, isExpanded) {
  //           return ListTile(
  //             title: Text(modelitem.headerValue!),
  //           );
  //         },
  //         body: ListTile(
  //           title: Text(modelitem.expandedValue!),
  //           subtitle: Text("To delete this item tap on trash icon"),
  //           trailing: Icon(Icons.delete),
  //           onTap: () {
  //             items.removeWhere((element) => modelitem == element);
  //           },
  //         ),
  //         isExpanded: modelitem.isexpanded!,
  //       );
  //     }).toList(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Container(
                height: 100,
                // color: Colors.red,
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 0),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomText(
                        text: "FAQ",
                        size: 35,
                        color: dark,
                        weight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(Addfaq());
                      },
                      child: CustomText(
                        text: "Add FAQ",
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
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            GetX<MainProvider>(builder: (controller) {
              return controller.isfaqloading.value == false
                  ? Container(
                      height: 600,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: ListView(
                        children:
                            List.generate(controller.faqlist.length, (index) {
                          return Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 15),
                                child: ExpandablePanel(
                                  header: Text("FAQ"),
                                  collapsed: Text(
                                    "${controller.faqlist[index].Question}",
                                    softWrap: true,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  expanded: Text(
                                    "${controller.faqlist[index].Answer}",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal),
                                    softWrap: true,
                                  ),
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

            // Container(child: buildListPanel()),
            // FaqDetail(),
            const SizedBox(
              width: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Next Page',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02,
                                    fontFamily: 'MontRegular',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 20,
                                )
                              ],
                            ),
                          )),
                      onPressed: () {},
                    ),
                  ),
                ),
                Spacer(),
                CustomText(
                  text: "Page :",
                  size: 20,
                  color: Colors.black,
                  weight: FontWeight.normal,
                ),
                CustomText(
                  text: "1-2 of 14",
                  size: 20,
                  color: Colors.black,
                  weight: FontWeight.normal,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: 100,
                  padding: EdgeInsets.all(10),
                  child: Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height * 0.02)),
                    elevation: 2.0,
                    clipBehavior: Clip.antiAlias,
                    child: MaterialButton(
                      color: dark,
                      splashColor: Colors.white,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: const Center(
                            child: Icon(
                              Icons.keyboard_arrow_left_sharp,
                              color: Colors.white,
                              size: 20,
                            ),
                          )),
                      onPressed: () {},
                    ),
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black87,
                    size: 20,
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black87,
                    size: 20,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: 100,
                  padding: EdgeInsets.all(10),
                  child: Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height * 0.02)),
                    elevation: 2.0,
                    clipBehavior: Clip.antiAlias,
                    child: MaterialButton(
                      color: dark,
                      splashColor: Colors.white,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: const Center(
                            child: Icon(
                              Icons.keyboard_arrow_right_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                          )),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final double x;
  final double y;
}

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:multi_vendor_webapp/Pages/FAQ/widgets/customfaq.dart';

import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/customSeller.dart';
import 'package:multi_vendor_webapp/models/expansionlistModel.dart';

import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';

import '../../AddFaq/addfaq.dart';

List<ExpansionModel> generateItems(int noofitems) {
  return List.generate(noofitems, (index) {
    return ExpansionModel(
      headerValue: "Panel $index",
      expandedValue: "This is the item numner $index",
    );
  });
}

class FaqDetail extends StatelessWidget {
  FaqDetail({Key? key}) : super(key: key);

  // List<ExpansionModel> items = generateItems(19);

  // Widget _buildListPanel() {
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
    var height = MediaQuery.of(context).size.height;

    return Column(
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
        SizedBox(
          height: 50,
        ),
        Container(
          margin: EdgeInsets.only(right: 120, left: 120),
          decoration: BoxDecoration(
            color: Color(0xffF7F8FA),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: ExpandablePanel(
                      header: Text("Panel Discuss"),
                      collapsed: const Text(
                        "Here is First Question",
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      expanded: const Text(
                        "Here is our New Answer................................................",
                        softWrap: true,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
        ),
      ],
    );
  }
}

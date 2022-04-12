import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_vendor_webapp/Controllers/AddDataController.dart';

import '../../../widgets/customText.dart';

Widget selectioncat(String title, AddDataController controller, String cat) {
  return InkWell(
    onTap: () {
      print("Cat  : $title, $cat");
      controller.settingcategory(title, cat);
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(0.5),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 2, right: 10),
              child: CustomText(
                text: "$title",
                color: Colors.black87,
                size: 18,
                weight: FontWeight.normal,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Icon(
              Icons.add,
              color: Colors.black87,
            ),
          ],
        ),
      ),
    ),
  );
}

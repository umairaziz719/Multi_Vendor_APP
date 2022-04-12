import 'package:flutter/material.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/carview.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/topsellercard.dart';
import 'package:multi_vendor_webapp/Pages/SellerPage/widgets/sellerdetailed.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../widget/addSellerDetailPage.dart';

class AddSellerPage extends StatelessWidget {
  const AddSellerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 10,
            ),
            AddSellerDetailPage(),
            SizedBox(
              width: 10,
            ),
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

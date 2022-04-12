import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_webapp/Controllers/MainController.dart';

import 'package:multi_vendor_webapp/helper/responseiveness.dart';
import 'package:multi_vendor_webapp/widgets/sitemap.dart';
import 'package:provider/provider.dart';

import 'dashboard_main.dart';
import 'views/maindashboardMedium.dart';

class DashBoardPage extends StatelessWidget {
  DashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MainProvider()).getorders();
    return Scaffold(
      drawer: SideMenu(),
      body: // mainprovider.getorders();
          // mainprovider.getorderDetails();
          Responsiveness(
        largeScreen: MainDashboardScreen(),
        smallcreen: MainDashboardMediumScreen(),
        mediumScreen: MainDashboardMediumScreen(),
      ),
    );
  }
}

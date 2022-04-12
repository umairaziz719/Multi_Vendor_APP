import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:multi_vendor_webapp/helper/responseiveness.dart';

import 'Dashboard/dashboardScreen.dart';

class SiteLayout extends StatefulWidget {
  @override
  State<SiteLayout> createState() => _SiteLayoutState();
}

class _SiteLayoutState extends State<SiteLayout> {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: topnav(context, scaffoldkey),
        body: Responsiveness(
      largeScreen: DashBoardPage(),
      smallcreen: DashBoardPage(),
      mediumScreen: DashBoardPage(),
    ));
  }
}

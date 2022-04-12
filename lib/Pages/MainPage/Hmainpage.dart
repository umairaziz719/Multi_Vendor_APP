import 'package:flutter/material.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/views/mainpage.dart';
import 'package:multi_vendor_webapp/Controllers/MainController.dart';

import 'package:multi_vendor_webapp/helper/responseiveness.dart';
import 'package:provider/provider.dart';

import 'views/mainmediumpage.dart';

class DashBoardMainPage extends StatelessWidget {
  DashBoardMainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Responsiveness(
      largeScreen: MainPage(),
      smallcreen: MainMediumPage(),
      mediumScreen: MainMediumPage(),
    ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class NavigationController extends GetxController {
  static NavigationController instance = Get.find();
  final GlobalKey<NavigatorState> navigatorkey = GlobalKey();

  Future<dynamic> navigateto(String routeName) {
    return navigatorkey.currentState!.pushNamed(routeName);
  }

  goback() => navigatorkey.currentState!.pop();
}

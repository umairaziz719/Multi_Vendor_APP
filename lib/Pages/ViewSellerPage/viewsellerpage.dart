import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:multi_vendor_webapp/Controllers/AuthController.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/mainpagemiddleview.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/mainpagerightview.dart';
import 'package:multi_vendor_webapp/Pages/OrderPage/Views/orderMainPage.dart';
import 'package:multi_vendor_webapp/constants/controllers.dart';
import 'package:multi_vendor_webapp/models/ordermodel.dart';
import 'package:multi_vendor_webapp/models/sellermodel.dart';
import 'package:multi_vendor_webapp/models/usermodel.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';
import 'package:multi_vendor_webapp/widgets/top_Navbar.dart';

import '../../widgets/sitemap.dart';
import 'View/viewsellerDetailedPage.dart';

class ViewSellerPage extends StatelessWidget {
  List<OrderModel> orderModel;
  SellerModel usermodel;
  ViewSellerPage(this.usermodel, this.orderModel, {Key? key}) : super(key: key);
  final con = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: const Size(1400, 1050),
      context: context,
      minTextAdapt: true,
    );
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
                width: double.infinity,
                height: double.infinity,

                // color: dark,
                child: SideMenu()),
          ),
          Expanded(
            flex: 7,
            child: SingleChildScrollView(
              child: Container(
                color: hoverbackground,
                padding: EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => topnavbarrr(
                        menuController.activeItem.value,
                        con.model.isEmpty ? "" : "${con.model[0].imgurl}",
                        () {},
                        false,
                        "${con.username.value}")),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: ViewSeDetailPage(usermodel, orderModel)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

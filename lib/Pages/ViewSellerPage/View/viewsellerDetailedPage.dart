import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/carview.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/topsellercard.dart';
import 'package:multi_vendor_webapp/Pages/OrderPage/Widgets/orderdetails.dart';
import 'package:multi_vendor_webapp/Pages/SellerPage/widgets/sellerdetailed.dart';
import 'package:multi_vendor_webapp/models/ordermodel.dart';
import 'package:multi_vendor_webapp/models/sellermodel.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../models/usermodel.dart';
import '../../ViewProductDetails/Widget/PreviousOrderDetailWidget.dart';
import '../Widget/previousStoreOrder.dart';
import '../Widget/sellerdetailed.dart';
import '../Widget/sellerfulldetail.dart';

class ViewSeDetailPage extends StatelessWidget {
  List<OrderModel> orderModel;
  SellerModel usermodel;
  ViewSeDetailPage(this.usermodel, this.orderModel, {Key? key})
      : super(key: key);

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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(18.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 10.w,
            ),
            CustomText(
              text: "Seller Details",
              size: 30,
              color: dark,
              weight: FontWeight.bold,
            ),
            SizedBox(
              width: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SellerDetailPage(usermodel),
                Expanded(
                    child:  SellerFullDetailPage(usermodel),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            PreviousStoreOrderDetailWidget(orderModel),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Expanded(
            //       flex: 1,
            //       child: USerDetailWidget(orderModel, sellerModel),
            //     ),
            //     SizedBox(
            //       width: 10.w,
            //     ),
            //     Expanded(
            //       flex: 2,
            //       child: Container(
            //         margin: EdgeInsets.only(top: 10),
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             SizedBox(
            //               height: 10,
            //             ),
            //             Container(
            //               height: 50,
            //               padding: EdgeInsets.all(10),
            //               margin: EdgeInsets.only(left: 10, right: 10),
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(4),
            //                 color: Colors.blue.withOpacity(0.1),
            //               ),
            //               child: Row(
            //                 children: [
            //                   Expanded(
            //                     flex: 2,
            //                     child: CustomText(
            //                       text: "Email",
            //                       size: 20,
            //                       color: dark,
            //                       weight: FontWeight.bold,
            //                     ),
            //                   ),
            //                   Expanded(
            //                     flex: 2,
            //                     child: CustomText(
            //                       text: "Phone Number",
            //                       size: 20,
            //                       color: dark,
            //                       weight: FontWeight.bold,
            //                     ),
            //                   ),
            //                   Expanded(
            //                     flex: 2,
            //                     child: CustomText(
            //                       text: "Store Name",
            //                       size: 20,
            //                       color: dark,
            //                       weight: FontWeight.bold,
            //                     ),
            //                   ),
            //                   Expanded(
            //                     flex: 2,
            //                     child: CustomText(
            //                       text: "Location",
            //                       size: 20,
            //                       color: dark,
            //                       weight: FontWeight.bold,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //             Container(
            //                 height: 100,
            //                 padding: EdgeInsets.all(10),
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(20),
            //                   color: Colors.white,
            //                 ),
            //                 child: ListView(
            //                   children: List.generate(1, ((index) {
            //                     return Column(
            //                       children: [
            //                         SizedBox(
            //                           height: 2,
            //                         ),
            //                         CustomUser(
            //                           color: Colors.white,
            //                           first: orderModel.UserEmail != null
            //                               ? "${orderModel.UserEmail}"
            //                               : "--",
            //                           second: orderModel.UserPhone != null
            //                               ? "${orderModel.UserPhone}"
            //                               : '--',
            //                           third: "${orderModel.StoreName}",
            //                           four: orderModel.UserAddress != null
            //                               ? "${orderModel.UserAddress}"
            //                               : '--',
            //                         ),
            //                         SizedBox(
            //                           height: 2,
            //                         ),
            //                       ],
            //                     );
            //                   })),
            //                 ))
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

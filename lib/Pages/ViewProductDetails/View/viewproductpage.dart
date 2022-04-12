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

import '../../../models/productmodel33.dart';
import '../Widget/PreviousOrderDetailWidget.dart';
import '../Widget/productdetailWidget.dart';
import '../Widget/statusdetail.dart';

class ViewProductDetailview extends StatelessWidget {
  List<OrderModel> orderModel;
  ProductMOdel33 newlist;
  ViewProductDetailview(this.newlist, this. orderModel, {Key? key}) : super(key: key);

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
    return Padding(
      padding: EdgeInsets.all(18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.all(0.5.h),
                  padding: EdgeInsets.all(10.h),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.business_center,
                        color: Colors.black87,
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2.h, right: 10.h),
                        child: CustomText(
                          text: "January 31, 2022 — March 1, 2022",
                          color: Colors.black87,
                          size: 18.sp,
                          weight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black87,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: StatusDetailWidget(newlist.status),
              ),
            ],
          ),
          SizedBox(
            width: 5.w,
          ),
          // ViewOrderDetailedWidget(orderModel),
          SizedBox(
            height: 5,
          ),
          CustomText(
            text: "Product Details",
            size: 30,
            color: dark,
            weight: FontWeight.bold,
          ),
          SizedBox(
            width: 10,
          ),
          ProductWidget(newlist),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Expanded(
          //       flex: 1,
          //       child: SellerDetailWidget(orderModel, sellerModel),
          //     ),
          //     SizedBox(
          //       width: 10.w,
          //     ),
          //     Expanded(
          //         flex: 2,
          //         child: SellerFullOverview(
          //           first: "${sellerModel.email}",
          //           second: "${sellerModel.phone}",
          //           third: "${sellerModel.storeName}",
          //           four: "${sellerModel.location}",
          //           five: "${sellerModel.idCard}",
          //           siz: "${sellerModel.bankAccName}",
          //           sev: "${sellerModel.bankAccNum}",
          //         )),
          //   ],
          // ),

          SizedBox(
            width: 10,
          ),

          PreviousOrderDetailWidget(orderModel,newlist),
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
    );
  }
}

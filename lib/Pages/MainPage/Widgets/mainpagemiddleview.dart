import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/topsellercard.dart';
import 'package:multi_vendor_webapp/Controllers/MainController.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'carview.dart';

class MainPageMiddleView extends StatelessWidget {
  const MainPageMiddleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      context: context,
      minTextAdapt: true,
    );

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(18.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: CustomText(
                text: "Dashboard",
                color: dark,
                size: 25.sp,
                weight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(2.h),
              child: GetX<MainProvider>(builder: (controller) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Cardview(
                      "${controller.ordersCount.value}",
                      "Orders",
                      const Icon(
                        Icons.card_travel,
                        color: Colors.red,
                      ),
                      Colors.red.withOpacity(0.3),
                      23.sp,
                      16.sp,
                      10.h,
                      10.h,
                    ),
                    Cardview(
                      "${controller.newsignupsCount.value}",
                      "New Signups",
                      Icon(
                        Icons.person_add,
                        color: Colors.yellow,
                      ),
                      Colors.yellow.withOpacity(0.3),
                      23.sp,
                      16.sp,
                      10.h,
                      10.h,
                    ),
                    Cardview(
                      "${controller.deliveryboysCount.value}",
                      "Delivery Boys",
                      Icon(
                        Icons.car_rental,
                        color: Colors.purple,
                      ),
                      Colors.purple.withOpacity(0.3),
                      23.sp,
                      16.sp,
                      10.h,
                      10.h,
                    ),
                    Cardview(
                      "${controller.productsCount.value} ",
                      "Products",
                      Icon(
                        Icons.card_travel,
                        color: Colors.green,
                      ),
                      Colors.green.withOpacity(0.3),
                      23.sp,
                      16.sp,
                      10.h,
                      10.h,
                    ),
                  ],
                );
              }),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    // color: Colors.red,
                    height: 120.h,
                    padding:
                        EdgeInsets.only(left: 15.h, right: 5.h, bottom: 0.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Total Orders",
                                size: 24.sp,
                                color: Colors.black,
                                weight: FontWeight.bold,
                              ),
                              GetX<MainProvider>(builder: (contro) {
                                return CustomText(
                                  text: "${contro.weekdays.length}",
                                  size: 20.sp,
                                  color: dark,
                                  weight: FontWeight.bold,
                                );
                              }),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.all(0.5),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.filter_9_plus,
                                  color: Colors.black87,
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 2, right: 10),
                                  child: CustomText(
                                    text: "Filter",
                                    color: Colors.black87,
                                    size: 18.sp,
                                    weight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
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
                          width: 10.h,
                        ),
                      ],
                    ),
                  ),
                  GetX<MainProvider>(
                      // stream: null,
                      builder: (controllr) {
                    return Container(
                      height: 300.h,
                      padding: EdgeInsets.all(10),
                      child: SfCartesianChart(
                        margin: EdgeInsets.zero,
                        primaryXAxis: NumericAxis(
                            minimum: 0,
                            maximum: 6,
                            interval: 1,
                            majorGridLines: const MajorGridLines(width: 0)),
                        primaryYAxis:
                            NumericAxis(minimum: 0, maximum: 100, interval: 10),
                        series: <ChartSeries>[
                          SplineSeries<ChartData, double>(
                            color: dark,
                            dataSource: controllr.weekdays.value.isNotEmpty
                                ? List<ChartData>.generate(6, (int index) {
                                    return index <=
                                            controllr.weekdays.length - 1
                                        ? ChartData(
                                            double.parse(index.toString()),
                                            controllr.weekdays[index])
                                        : ChartData(
                                            double.parse(index.toString()), 0);
                                  })
                                : [
                                    ChartData(0, 13),
                                    ChartData(1, 13),
                                    ChartData(2, 34),
                                    ChartData(3, 27),
                                    ChartData(4, 40),
                                  ],
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                            splineType: SplineType.cardinal,
                            cardinalSplineTension: 0.9,
                          )
                        ],
                      ),
                    );
                  }),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            TopSellerCard()
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

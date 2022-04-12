import 'package:flutter/material.dart';
import 'package:multi_vendor_webapp/Pages/SliderPage/widgets/sliderdetailed.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/carview.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/topsellercard.dart';

import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SliderMainPage extends StatelessWidget {
  const SliderMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 10,
            ),
            SliderDetail(),
            SizedBox(
              width: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height * 0.03)),
                    elevation: 2.0,
                    clipBehavior: Clip.antiAlias,
                    child: MaterialButton(
                      color: dark,
                      splashColor: Colors.white,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Next Page',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02,
                                    fontFamily: 'MontRegular',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 20,
                                )
                              ],
                            ),
                          )),
                      onPressed: () {},
                    ),
                  ),
                ),
                Spacer(),
                CustomText(
                  text: "Page :",
                  size: 20,
                  color: Colors.black,
                  weight: FontWeight.normal,
                ),
                CustomText(
                  text: "1-2 of 14",
                  size: 20,
                  color: Colors.black,
                  weight: FontWeight.normal,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: 100,
                  padding: EdgeInsets.all(10),
                  child: Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height * 0.02)),
                    elevation: 2.0,
                    clipBehavior: Clip.antiAlias,
                    child: MaterialButton(
                      color: dark,
                      splashColor: Colors.white,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: const Center(
                            child: Icon(
                              Icons.keyboard_arrow_left_sharp,
                              color: Colors.white,
                              size: 20,
                            ),
                          )),
                      onPressed: () {},
                    ),
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black87,
                    size: 20,
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black87,
                    size: 20,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: 100,
                  padding: EdgeInsets.all(10),
                  child: Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height * 0.02)),
                    elevation: 2.0,
                    clipBehavior: Clip.antiAlias,
                    child: MaterialButton(
                      color: dark,
                      splashColor: Colors.white,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: const Center(
                            child: Icon(
                              Icons.keyboard_arrow_right_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                          )),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            )
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

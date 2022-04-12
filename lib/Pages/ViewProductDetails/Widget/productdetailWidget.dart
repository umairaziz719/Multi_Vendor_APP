import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_vendor_webapp/models/sellermodel.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';

import '../../../models/productmodel33.dart';
import '../../../utils/styles.dart';
import 'listwidget.dart';

class ProductWidget extends StatelessWidget {
  ProductMOdel33 newlist;
  ProductWidget(this.newlist, {Key? key}) : super(key: key);
  final CarouselController _controller = CarouselController();

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
    return Container(
      height: 500,
      margin: EdgeInsets.only(top: 10.h, right: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(20.h),
            child: Stack(
              children: [
                Container(
                  width: 400.w,
                  height: 400.w,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CarouselSlider(
                    items: listofimages(newlist),
                    options:
                        CarouselOptions(enlargeCenterPage: true, height: 300.w),
                    carouselController: _controller,
                  ),
                ),
                Center(
                  child: Container(
                    width: 400.w,
                    height: 300.w,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            width: 40,
                            child: Material(
                              shape: RoundedRectangleBorder(),
                              elevation: 2.0,
                              clipBehavior: Clip.antiAlias,
                              child: MaterialButton(
                                color: dark,
                                splashColor: Colors.white,
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: const Center(
                                      child: Icon(
                                        Icons.keyboard_arrow_left_outlined,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    )),
                                onPressed: () {
                                  _controller.previousPage();
                                },
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 40,
                            child: Material(
                              shape: RoundedRectangleBorder(),
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
                                onPressed: () {
                                  _controller.nextPage();
                                },
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: 20.h, bottom: 20.h, left: 40.h, right: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                CustomText(
                  text: "${newlist.title}",
                  size: 24,
                  color: Colors.black,
                  weight: FontWeight.bold,
                ),
                SizedBox(
                  height: 5,
                ),
                CustomText(
                  text: "${newlist.description}",
                  size: 18,
                  color: Colors.black,
                  weight: FontWeight.normal,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 1,
                  width: 100,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "SKU",
                          size: 25,
                          color: Colors.black,
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 1, bottom: 1),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: CustomText(
                            text: "${newlist.sku}",
                            size: 18,
                            color: Colors.black,
                            weight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: "Price",
                          size: 25,
                          color: Colors.black,
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 1, bottom: 1),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: CustomText(
                            text: "${newlist.price}",
                            size: 18,
                            color: Colors.black,
                            weight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: "Sell Price",
                          size: 25,
                          color: Colors.black,
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 1, bottom: 1),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: CustomText(
                            text: newlist.sellPrice != null ||
                                    newlist.sellPrice != ""
                                ? "${newlist.sellPrice}"
                                : newlist.price != null || newlist.price != ""
                                    ? "${newlist.price}"
                                    : "--",
                            size: 18,
                            color: Colors.black,
                            weight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: "Sizes",
                          size: 25,
                          color: Colors.black,
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 1, bottom: 1),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: CustomText(
                            text: "--",
                            size: 18,
                            color: Colors.black,
                            weight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: "Colors",
                          size: 25,
                          color: Colors.black,
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Container(
                      height: 200,
                      width: 1,
                      color: Colors.grey.shade300,
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Dimension",
                          size: 25,
                          color: Colors.black,
                          weight: FontWeight.bold,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  left: 5, right: 5, top: 1, bottom: 1),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: CustomText(
                                text: newlist.width != null
                                    ? "W ${newlist.width}"
                                    : "--",
                                size: 18,
                                color: Colors.black,
                                weight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 5, right: 5, top: 1, bottom: 1),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: CustomText(
                                text: newlist.height != null
                                    ? "H ${newlist.height}"
                                    : "--",
                                size: 18,
                                color: Colors.black,
                                weight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 5, right: 5, top: 1, bottom: 1),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: CustomText(
                                text: newlist.length != null
                                    ? "L ${newlist.length}"
                                    : "--",
                                size: 18,
                                color: Colors.black,
                                weight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: "Warranty",
                          size: 25,
                          color: Colors.black,
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 1, bottom: 1),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: CustomText(
                            text: newlist.warranty != null
                                ? "${newlist.warranty}"
                                : "",
                            size: 18,
                            color: Colors.black,
                            weight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: "Stock Availablity",
                          size: 25,
                          color: Colors.black,
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 1, bottom: 1),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: CustomText(
                            text: "${newlist.stock}",
                            size: 18,
                            color: Colors.black,
                            weight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: "Product Tag",
                          size: 25,
                          color: Colors.black,
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 1, bottom: 1),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: CustomText(
                            text: "${newlist.productTag}",
                            size: 18,
                            color: Colors.black,
                            weight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: "Dangeorus",
                          size: 25,
                          color: Colors.black,
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 1, bottom: 1),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: CustomText(
                            text: newlist.dangerous != null
                                ? "${newlist.dangerous}"
                                : "--",
                            size: 18,
                            color: Colors.black,
                            weight: FontWeight.normal,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

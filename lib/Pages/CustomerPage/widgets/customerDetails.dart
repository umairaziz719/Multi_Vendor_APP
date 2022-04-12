import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:multi_vendor_webapp/Pages/MainPage/Widgets/customSeller.dart';
import 'package:multi_vendor_webapp/Pages/ProductPage/widgets/customProducts.dart';
import 'package:multi_vendor_webapp/Pages/SellerPage/widgets/customSeller.dart';
import 'package:multi_vendor_webapp/Controllers/MainController.dart';
import 'package:multi_vendor_webapp/utils/styles.dart';
import 'package:multi_vendor_webapp/widgets/customText.dart';

import '../../ViewCustomer/viewcustomer.dart';
import '../../ViewCustomerDetail/viewcustomerdetail.dart';
import 'customCUstomers.dart';

class CustomerDetails extends StatelessWidget {
  CustomerDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 100,
              // color: Colors.red,
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 0),
              child: Row(
                children: [
                  Expanded(
                    child: CustomText(
                      text: "Customer Details",
                      size: 24,
                      color: Colors.black,
                      weight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 70,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0.1),
              color: Colors.blue.withOpacity(0.1),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "ID",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: CustomText(
                      text: "Image",
                      size: 20,
                      color: dark,
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomText(
                    text: "Customer Name",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomText(
                    text: "Email",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomText(
                    text: "Phone Number",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomText(
                    text: "Date",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Action",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "",
                    size: 20,
                    color: dark,
                    weight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          GetX<MainProvider>(builder: (controller) {
            return controller.isUserloading.value == false
                ? Container(
                    height: 600,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: ListView(
                      children:
                          List.generate(controller.userslist.length, (index) {
                        return Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            CustomCustomer(
                                color: Colors.white,
                                first: "#${controller.userslist[index].userId}",
                                second:
                                    "${controller.userslist[index].Photourl}",
                                third: "${controller.userslist[index].Name} ",
                                four: "${controller.userslist[index].Email}",
                                five: "${controller.userslist[index].PhoneNo}",
                                six: "01 Dec, 2022",
                                ei: IconButton(
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                  ),
                                  iconSize: 35,
                                  onPressed: () async {
                                    Get.to(ViewCUstomerDetailPage(
                                        controller.userslist[index],
                                        controller.gettingOrderdetailsforUser(
                                            controller
                                                .userslist[index].userId!)));
                                  },
                                  color: Colors.blue,
                                ),
                                nig: Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 35,
                                ),
                                ten: Icon(
                                  Icons.close_rounded,
                                  color: Colors.red,
                                  size: 35,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              height: 1,
                              color: Colors.black.withOpacity(.2),
                            ),
                          ],
                        );
                      }),
                    ))
                : Container(
                    height: 600,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
          }),
        ],
      ),
    );
  }

  List<CustomCustomer> custom = const [
    CustomCustomer(
        color: Colors.white,
        first: "#12345",
        second: "assets/images/person2.jpg",
        third: "Jacobn ",
        four: "jacon213@gmadi.com",
        five: "(123) 1234-1323",
        six: "01 Dec, 2022",
        ei: Icon(
          Icons.remove_red_eye,
          size: 35,
          color: Colors.blue,
        ),
        nig: Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 35,
        ),
        ten: Icon(
          Icons.close_rounded,
          color: Colors.red,
          size: 35,
        )),
    CustomCustomer(
        color: Colors.white,
        first: "#20034",
        second: "assets/images/person3.jpg",
        third: "Okkas ",
        four: "okkewe333@gmadi.com",
        five: "(435) 1234-1323",
        six: "01 Dec, 2022",
        ei: Icon(
          Icons.remove_red_eye,
          color: Colors.blue,
          size: 35,
        ),
        nig: Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 35,
        ),
        ten: Icon(
          Icons.close_rounded,
          color: Colors.red,
          size: 35,
        )),
    CustomCustomer(
        color: Colors.white,
        first: "#8999",
        second: "assets/images/person3.jpg",
        third: "iasd ",
        four: "ewrwen213@gmadi.com",
        five: "(656) 1234-1323",
        six: "20 Aug, 2022",
        ei: Icon(
          Icons.remove_red_eye,
          color: Colors.blue,
          size: 35,
        ),
        nig: Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 35,
        ),
        ten: Icon(
          Icons.close_rounded,
          color: Colors.red,
          size: 35,
        )),
    CustomCustomer(
        color: Colors.white,
        first: "#3290",
        second: "assets/images/person3.jpg",
        third: "eroit ",
        four: "retern213@gmadi.com",
        five: "(6767) 1234-1323",
        six: "20 Jan, 2022",
        ei: Icon(
          Icons.remove_red_eye,
          size: 35,
          color: Colors.blue,
        ),
        nig: Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 35,
        ),
        ten: Icon(
          Icons.close_rounded,
          color: Colors.red,
          size: 35,
        )),
    CustomCustomer(
        color: Colors.white,
        first: "#2212",
        second: "assets/images/person3.jpg",
        third: "wepor ",
        four: "weir213@gmadi.com",
        five: "(455) 1234-1323",
        six: "01 Aug, 2022",
        ei: Icon(
          Icons.remove_red_eye,
          color: Colors.blue,
          size: 35,
        ),
        nig: Icon(
          Icons.check_circle,
          size: 35,
          color: Colors.green,
        ),
        ten: Icon(
          Icons.close_rounded,
          color: Colors.red,
          size: 35,
        )),
    CustomCustomer(
        color: Colors.white,
        first: "#300",
        second: "assets/images/person4.jpg",
        third: "Usamn ",
        four: "sdf213@gmadi.com",
        five: "(657) 1234-1323",
        six: "22 Jan, 2022",
        ei: Icon(
          Icons.remove_red_eye,
          color: Colors.blue,
          size: 35,
        ),
        nig: Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 35,
        ),
        ten: Icon(
          Icons.close_rounded,
          size: 35,
          color: Colors.red,
        )),
    CustomCustomer(
        color: Colors.white,
        first: "#9000",
        second: "assets/images/person1.jpg",
        third: "poasd ",
        four: "pasd213@gmadi.com",
        five: "(897) 1234-1323",
        six: "20 Jan, 2022",
        ei: Icon(
          Icons.remove_red_eye,
          color: Colors.blue,
          size: 35,
        ),
        nig: Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 35,
        ),
        ten: Icon(
          Icons.close_rounded,
          color: Colors.red,
          size: 35,
        )),
    CustomCustomer(
        color: Colors.white,
        first: "#7o00",
        second: "assets/images/person1.jpg",
        third: "dosif ",
        four: "546dgf213@gmadi.com",
        five: "(565) 1234-1323",
        six: "10 Dec, 2022",
        ei: Icon(
          Icons.remove_red_eye,
          color: Colors.blue,
          size: 35,
        ),
        nig: Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 35,
        ),
        ten: Icon(
          Icons.close_rounded,
          color: Colors.red,
          size: 35,
        )),
    CustomCustomer(
        color: Colors.white,
        first: "#9000",
        second: "assets/images/person2.jpg",
        third: "pasd ",
        four: "fdgfdg413@gmadi.com",
        five: "(788) 1234-1323",
        six: "17 Feb, 2022",
        ei: Icon(
          Icons.remove_red_eye,
          color: Colors.blue,
          size: 35,
        ),
        nig: Icon(
          Icons.check_circle,
          size: 35,
          color: Colors.green,
        ),
        ten: Icon(
          Icons.close_rounded,
          color: Colors.red,
          size: 35,
        )),
  ];
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:multi_vendor_webapp/helper/local_navigator.dart';
import 'package:multi_vendor_webapp/widgets/sitemap.dart';

import '../../Controllers/MainController.dart';

class MainDashboardScreen extends StatelessWidget {
  MainDashboardScreen({Key? key}) : super(key: key);
  var height = Get.height;
  var width = Get.width;
  @override
  Widget build(BuildContext context) {
    Get.put(MainProvider());
    return
        // Stack(
        //   alignment: Alignment.topLeft,
        //   children: [
        //     ClipRRect(
        //       // borderRadius: BorderRadius.only(
        //       //     bottomLeft: Radius.circular(30),
        //       //     bottomRight: Radius.circular(30)),
        //       child: Container(
        //         height: MediaQuery.of(context).size.height,
        //         width: MediaQuery.of(context).size.width * .22,
        //         decoration: const BoxDecoration(
        //             color: Colors.amber,
        //             image: DecorationImage(
        //                 image: AssetImage("assets/images/back22.png"),
        //                 fit: BoxFit.cover)),
        //         // image: AssetImage('assets/images/back22.png'),
        //         // fit: BoxFit.cover,
        //         child: Column(
        //           children: [
        //             SizedBox(
        //               height: 20,
        //             ),
        //             Container(
        //               width: 60,
        //               child: Image.asset(
        //                 "assets/icons/logo2.png",
        //                 fit: BoxFit.fitWidth,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //     Container(
        //       margin: EdgeInsets.only(left: 300),
        //       width: MediaQuery.of(context).size.width,
        //       decoration: BoxDecoration(
        //         color: lightGrey,
        //         borderRadius: BorderRadius.only(
        //             topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
        //       ),
        //       child: Column(
        //         children: [
        //           const SizedBox(
        //             height: 20,
        //           ),
        //           Image.asset(
        //             "assets/icons/logo.png",
        //             width: 150,
        //           ),
        //           const SizedBox(
        //             height: 10,
        //           ),
        //           CustomText(
        //             text: "Welcome Back",
        //             size: 26,
        //             weight: FontWeight.bold,
        //           ),
        //           const SizedBox(
        //             height: 10,
        //           ),
        //           CustomText(
        //             text: "Login to your account",
        //             size: 22,
        //             color: blackColor.withOpacity(0.4),
        //             weight: FontWeight.normal,
        //           ),
        //           const SizedBox(
        //             height: 20,
        //           ),
        //           const InputTextField(
        //             topLabel: "Email Address",
        //             size: 16,
        //             weight: FontWeight.normal,
        //             color: lightGreys,
        //             label: "Please Enter Email",
        //             obs: false,
        //           ),
        //           const SizedBox(
        //             height: 3,
        //           ),
        //           InputTextField(
        //             topLabel: "Password",
        //             size: 16,
        //             weight: FontWeight.normal,
        //             color: blackColor.withOpacity(0.9),
        //             obs: true,
        //             label: "Please Enter Password",
        //           ),
        //           const SizedBox(
        //             height: 8,
        //           ),
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.end,
        //             children: [
        //               CustomText(
        //                 text: "Forgot Password",
        //                 size: 15,
        //                 color: dark,
        //                 weight: FontWeight.normal,
        //               ),
        //             ],
        //           ),
        //           const SizedBox(
        //             height: 18,
        //           ),
        //           InkWell(
        //             onTap: () {
        //               print("Login");
        //               // Get.to(() => const DashBoardPage());
        //             },
        //             child: Container(
        //               height: height * 0.06,
        //               width: width * 0.2,
        //               margin: const EdgeInsets.only(
        //                   top: 0, left: 0, right: 20, bottom: 10),
        //               decoration: const BoxDecoration(
        //                 color: dark,
        //                 borderRadius: BorderRadius.all(Radius.circular(10)),
        //               ),
        //               child: const Center(
        //                 child: Text(
        //                   'Login',
        //                   style: TextStyle(
        //                     color: light,
        //                     letterSpacing: 1,
        //                     fontWeight: FontWeight.bold,
        //                     fontSize: 20,
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     // Positioned(
        //     //   left: 0,
        //     //   child: Container(
        //     //     width: width * .25,
        //     //     height: double.infinity,
        //     //     decoration: const BoxDecoration(
        //     //         color: Colors.amber,
        //     //         image: DecorationImage(
        //     //             image: AssetImage("assets/images/back22.png"),
        //     //             fit: BoxFit.cover)),
        //     //     // color: dark,
        //     //     child: Column(
        //     //       children: [
        //     //         SizedBox(
        //     //           height: 20,
        //     //         ),
        //     //         Container(
        //     //           width: 60,
        //     //           child: Image.asset(
        //     //             "assets/icons/logo2.png",
        //     //             fit: BoxFit.fitWidth,
        //     //           ),
        //     //         ),
        //     //       ],
        //     //     ),
        //     //   ),
        //     // ),

        //     // Positioned(
        //     //   left: 25,
        //     //   child: Container(
        //     //     decoration: BoxDecoration(
        //     //       border: Border.all(
        //     //         width: 8.0,
        //     //         color: Colors.black,
        //     //       ),
        //     //       color: Colors.green,
        //     //       borderRadius: BorderRadius.only(
        //     //           topLeft: Radius.circular(20),
        //     //           bottomLeft: Radius.circular(20)),
        //     //     ),
        //     //     padding: EdgeInsets.all(20),
        //     //     child: Column(
        //     //       children: [
        //     //         const SizedBox(
        //     //           height: 20,
        //     //         ),
        //     //         Image.asset(
        //     //           "assets/icons/logo.png",
        //     //           width: 150,
        //     //         ),
        //     //         const SizedBox(
        //     //           height: 10,
        //     //         ),
        //     //         CustomText(
        //     //           text: "Welcome Back",
        //     //           size: 26,
        //     //           weight: FontWeight.bold,
        //     //         ),
        //     //         const SizedBox(
        //     //           height: 10,
        //     //         ),
        //     //         CustomText(
        //     //           text: "Login to your account",
        //     //           size: 22,
        //     //           color: blackColor.withOpacity(0.4),
        //     //           weight: FontWeight.normal,
        //     //         ),
        //     //         const SizedBox(
        //     //           height: 20,
        //     //         ),
        //     //         const InputTextField(
        //     //           topLabel: "Email Address",
        //     //           size: 16,
        //     //           weight: FontWeight.normal,
        //     //           color: lightGreys,
        //     //           label: "Please Enter Email",
        //     //           obs: false,
        //     //         ),
        //     //         const SizedBox(
        //     //           height: 3,
        //     //         ),
        //     //         InputTextField(
        //     //           topLabel: "Password",
        //     //           size: 16,
        //     //           weight: FontWeight.normal,
        //     //           color: blackColor.withOpacity(0.9),
        //     //           obs: true,
        //     //           label: "Please Enter Password",
        //     //         ),
        //     //         const SizedBox(
        //     //           height: 8,
        //     //         ),
        //     //         Row(
        //     //           mainAxisAlignment: MainAxisAlignment.end,
        //     //           children: [
        //     //             CustomText(
        //     //               text: "Forgot Password",
        //     //               size: 15,
        //     //               color: dark,
        //     //               weight: FontWeight.normal,
        //     //             ),
        //     //           ],
        //     //         ),
        //     //         const SizedBox(
        //     //           height: 18,
        //     //         ),
        //     //         InkWell(
        //     //           onTap: () {
        //     //             print("Login");
        //     //             // Get.to(() => const DashBoardPage());
        //     //           },
        //     //           child: Container(
        //     //             height: height * 0.06,
        //     //             width: width * 0.2,
        //     //             margin: const EdgeInsets.only(
        //     //                 top: 0, left: 0, right: 20, bottom: 10),
        //     //             decoration: const BoxDecoration(
        //     //               color: dark,
        //     //               borderRadius: BorderRadius.all(Radius.circular(10)),
        //     //             ),
        //     //             child: const Center(
        //     //               child: Text(
        //     //                 'Login',
        //     //                 style: TextStyle(
        //     //                   color: light,
        //     //                   letterSpacing: 1,
        //     //                   fontWeight: FontWeight.bold,
        //     //                   fontSize: 20,
        //     //                 ),
        //     //               ),
        //     //             ),
        //     //           ),
        //     //         ),
        //     //       ],
        //     //     ),
        //     //   ),
        //     // ),
        //   ],
        // );

        Row(
      children: [
        Expanded(
          child: Container(
              width: double.infinity,
              height: double.infinity,

              // color: dark,
              child: SideMenu()),
        ),
        Expanded(flex: 7, child: localNavigator()

            // Container(
            //   decoration: BoxDecoration(),
            //   padding: EdgeInsets.all(20),
            //   child: Column(
            //     children: [
            //       const SizedBox(
            //         height: 20,
            //       ),
            //       Image.asset(
            //         "assets/icons/logo.png",
            //         width: 150,
            //       ),
            //       const SizedBox(
            //         height: 10,
            //       ),
            //       CustomText(
            //         text: "Welcome Back",
            //         size: 26,
            //         weight: FontWeight.bold,
            //       ),
            //       const SizedBox(
            //         height: 10,
            //       ),
            //       CustomText(
            //         text: "Login to your account",
            //         size: 22,
            //         color: blackColor.withOpacity(0.4),
            //         weight: FontWeight.normal,
            //       ),
            //       const SizedBox(
            //         height: 20,
            //       ),
            //       const InputTextField(
            //         topLabel: "Email Address",
            //         size: 16,
            //         weight: FontWeight.normal,
            //         color: lightGreys,
            //         label: "Please Enter Email",
            //         obs: false,
            //       ),
            //       const SizedBox(
            //         height: 3,
            //       ),
            //       InputTextField(
            //         topLabel: "Password",
            //         size: 16,
            //         weight: FontWeight.normal,
            //         color: blackColor.withOpacity(0.9),
            //         obs: true,
            //         label: "Please Enter Password",
            //       ),
            //       const SizedBox(
            //         height: 8,
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children: [
            //           CustomText(
            //             text: "Forgot Password",
            //             size: 15,
            //             color: dark,
            //             weight: FontWeight.normal,
            //           ),
            //         ],
            //       ),
            //       const SizedBox(
            //         height: 18,
            //       ),
            //       InkWell(
            //         onTap: () {
            //           print("Login");
            //           // Get.to(() => const DashBoardPage());
            //         },
            //         child: Container(
            //           height: height * 0.06,
            //           width: width * 0.2,
            //           margin: const EdgeInsets.only(
            //               top: 0, left: 0, right: 20, bottom: 10),
            //           decoration: const BoxDecoration(
            //             color: dark,
            //             borderRadius: BorderRadius.all(Radius.circular(10)),
            //           ),
            //           child: const Center(
            //             child: Text(
            //               'Login',
            //               style: TextStyle(
            //                 color: light,
            //                 letterSpacing: 1,
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 20,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ))
            ),
      ],
    );
  }
}

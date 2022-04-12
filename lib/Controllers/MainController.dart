import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:multi_vendor_webapp/models/adminmode.dart';
import 'package:multi_vendor_webapp/models/categorymode.dart';
import 'package:multi_vendor_webapp/models/faqmodel.dart';
import 'package:multi_vendor_webapp/models/productModel22.dart';
import 'package:multi_vendor_webapp/models/productmodel.dart';
import 'package:multi_vendor_webapp/models/productmodel33.dart';
import 'package:multi_vendor_webapp/models/promoCodemode.dart';
import 'package:multi_vendor_webapp/models/riderModel.dart';
import 'package:multi_vendor_webapp/models/sellermodel.dart';
import 'package:multi_vendor_webapp/models/usermodel.dart';

import '../constants/controllers.dart';
import '../models/customdropdownmodel.dart';
import '../models/ordermodel.dart';

class MainProvider extends GetxController {
  var ordersCount = 0.obs;
  var newsignupsCount = 0.obs;
  var deliveryboysCount = 0.obs;
  var productsCount = 0.obs;
  List<OrderModel> orderslist = [];
  List<ProductModel> productlist = [];
  List<ProductModel22> productlist22 = [];

  var combinedList3;

  var updatedproductlist = [].obs;
  var updatedsellerlist = [].obs;
  var updatedorderlist = [].obs;

  List<RiderModel> riderList = [];
  List<CategoryModel> catlist = [];
  var storelist = [].obs;

  List<UserModel> userslist = [];
  List<PromoCode> promolist = [];
  List<AdminsModel> adminlist = [];
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection("Admins");

  var isorderloading = true.obs;
  var isadminloading = true.obs;

  var isUserloading = true.obs;
  var isPromoloading = true.obs;

  var isriderloading = true.obs;
  var iscatloading = true.obs;
  var issellerloading = true.obs;
  var isfaqloading = true.obs;

  var isproductsloading = true.obs;
  String time = "";

  String selectedproductcat = '';
  String selectedsellercat = '';
  String selectedordercat = '';

  @override
  void onInit() {
    // TODO: implement onInit
    Timer mytimer = Timer.periodic(Duration(minutes: 3, seconds: 5), (timer) {
      DateTime timenow = DateTime.now(); //get current date and time
      time = timenow.hour.toString() +
          ":" +
          timenow.minute.toString() +
          ":" +
          timenow.second.toString();
      print(time);
      getorders();
      //mytimer.cancel() //to terminate this timer
    });
    super.onInit();
  }

  var isfiltered = false.obs;

  List<CustomDropDownItem> catlistitems = [];
  var selectedItem = Constants.customDropDownItems[3].obs;
  setDropDownValue(CustomDropDownItem customDropDownItem) {
    selectedItem.value = customDropDownItem;
    isfiltered.value = false;

    print(selectedItem.value.name);
    updatedproductlist.value = [];
    if (selectedItem.value.name! == "No Selected") {
      selectedproductcat = "";
      updatedproductlist.value = [];
      isfiltered.value = false;

      // print("kuch print kar");
    } else {
      // print("kuch print kar else ");
      for (int i = 0; i < newlist.length; i++) {
        if (newlist[i].status == selectedItem.value.name!) {
          print(selectedItem.value.name);
          updatedproductlist.add(newlist[i]);
        }
      }
      if (selectedItem.value.name == "Rejected" ||
          selectedItem.value.name == "Pending" &&
              updatedproductlist.length == 0) {
        isfiltered.value = true;
        print("nothing");
      }

      selectedproductcat = selectedItem.value.name!;
      print(updatedproductlist);
    }

    try {} catch (e) {}
    update();
  }

  var isfiltered2222 = false.obs;
  var selectedItem22 = Constants.customDropDownItems22[3].obs;
  setDropDownValue22(CustomDropDownItem customDropDownItem) {
    selectedItem22.value = customDropDownItem;
    print(selectedItem22.value.name);
    updatedsellerlist.value = [];
    isfiltered2222.value = false;

    if (selectedItem22.value.name! == "No Selected") {
      selectedsellercat = "";
      updatedsellerlist.value = [];
      isfiltered2222.value = false;
      // print("kuch print kar");
    } else {
      // print("kuch print kar else ");
      for (int i = 0; i < storelist.length; i++) {
        if (storelist[i].status == selectedItem22.value.name!) {
          updatedsellerlist.add(storelist[i]);
        }
      }
      if (selectedItem22.value.name == "Rejected" ||
          selectedItem22.value.name == "Pending" && updatedsellerlist.isEmpty) {
        isfiltered2222.value = true;
        print("nothing");
      }
      selectedsellercat = selectedItem22.value.name!;
      print(updatedsellerlist);
    }

    try {} catch (e) {}
  }

  var isfilltered444 = false.obs;

  var selectedItem33 = Constants.customDropDownItems33[8].obs;
  setDropDownValue33(CustomDropDownItem customDropDownItem) {
    selectedItem33.value = customDropDownItem;
    print(selectedItem33.value.name);
    updatedorderlist.value = [];
    isfilltered444.value = false;

    if (selectedItem33.value.name! == "No Selected") {
      selectedordercat = "";
      updatedorderlist.value = [];
      isfilltered444.value = false;
      // print("kuch print kar");
    } else {
      // print("kuch print kar else ");
      for (int i = 0; i < orderslist.length; i++) {
        if (orderslist[i].status == selectedItem33.value.name!) {
          updatedorderlist.add(orderslist[i]);
        }
      }
      if (selectedItem33.value.name == "Accepted" ||
          selectedItem33.value.name == "Returned" ||
          selectedItem33.value.name == "Failed Delivery" ||
          selectedItem33.value.name == "Shipped" ||
          selectedItem33.value.name == "Pending" && updatedorderlist.isEmpty) {
        isfilltered444.value = true;
        print("nothing");
      }

      selectedordercat = selectedItem33.value.name!;
      print(updatedorderlist);
    }

    try {} catch (e) {}
  }

  var selectedItem44 = Constants.customDropDownItems00[0].obs;
  setDropDownValue44(CustomDropDownItem customDropDownItem) {
    selectedItem44.value = customDropDownItem;
    print(selectedItem44.value.name);
    updatedorderlist.value = [];

    if (selectedItem44.value.name! == "No Selected") {
      selectedordercat = "";
      updatedorderlist.value = [];
      // print("kuch print kar");
    } else {
      // print("kuch print kar else ");

      selectedordercat = selectedItem44.value.name!;
      print(updatedorderlist);
    }

    try {} catch (e) {}
  }

  var selectedcatItem;
  String? name;
  getselecteditem() {
    selectedcatItem = catlistitems[3].obs;
  }

  setDropDownselectedValue(CustomDropDownItem customDropDownItem) {
    selectedcatItem.value = customDropDownItem;
    name = customDropDownItem.name;
  }

  List<SellerModel> sellermodel = [];

  gettingsellerdetails(String storename) {
    SellerModel? res;
    storelist.value.forEach((element) {
      if (element.storeName == storename) {
        res = SellerModel(
          storeName: element.storeName,
          ownerName: element.ownerName,
          image: element.image,
          email: element.email,
          location: element.location,
          phone: element.phone,
          idCard: element.idCard,
          idCardFront: element.idCardFront,
          idCardBack: element.idCardBack,
          bankAccNum: element.bankAccNum,
          bankAccName: element.bankAccName,
          logo: element.logo,
        );
      }
    });
    print(res);

    return res;
  }

  List<OrderModel> ordernewlist = [];
  gettingOrderdetailsForSingleProduct(String productname) {
    ordernewlist = [];
    orderslist.forEach((element22) {
      element22.cartlist!.forEach((element) {
        if (element.name == productname) {
          ordernewlist.add(element22);
        }
      });
    });
    print("New orders");

    print(ordernewlist);
    print(ordernewlist.length);

    return ordernewlist;
  }

  var uspending = 0.obs;
  var usdelivery = 0.obs;
  var uscancel = 0.obs;
  List<OrderModel> userorder = [];
  gettingOrderdetailsforUser(String userid) {
    userorder = [];
    uspending.value = 0;
    usdelivery.value = 0;
    uscancel.value = 0;

    orderslist.forEach((element22) {
      if (element22.Useruid == userid) {
        userorder.add(element22);
        if (element22.status == "Pending") {
          uspending.value++;
        } else if (element22.status == "Delivered") {
          usdelivery.value++;
        } else if (element22.status == "Cancelled") {
          uscancel.value++;
        }
      }
    });
    print("New orders");

    print(userorder);
    print(userorder.length);

    return userorder;
  }

  var sepen = 0.obs;
  var seawait = 0.obs;
  var sede = 0.obs;
  var serejected = 0.obs;

  List<OrderModel> sellerorder = [];
  gettingSellerdetailsforUser(String storeid) {
    sellerorder = [];
    uspending.value = 0;
    usdelivery.value = 0;
    uscancel.value = 0;

    orderslist.forEach((element22) {
      if (element22.StoreUid == storeid) {
        sellerorder.add(element22);
        if (element22.status == "Pending") {
          sepen.value++;
        } else if (element22.status == "Awaiting") {
          seawait.value++;
        } else if (element22.status == "Delivered") {
          sede.value++;
        } else if (element22.status == "Rejected") {
          serejected.value++;
        }
      }
    });
    print("New orders");

    print(sellerorder);
    print(sellerorder.length);

    return sellerorder;
  }

  var pending = 0.obs;
  var awaiting = 0.obs;
  var delivery = 0.obs;
  var rejected = 0.obs;

  List<OrderModel> custom = [];
  gettingOrderdetails(String storeId) async {
    custom = [];
    pending.value = 0;
    awaiting.value = 0;
    delivery.value = 0;
    rejected.value = 0;
    try {
      await FirebaseFirestore.instance
          .collection('Order')
          .where("StoreUid", isEqualTo: storeId)
          .get()
          .then((QuerySnapshot querySnapshot) async {
        // List<QueryDocumentSnapshot> Orders = querySnapshot.docs;
        custom = querySnapshot.docs
            .map((e) => OrderModel.fromMap(e.data() as Map<String, dynamic>))
            .toList();

        custom.forEach((element) {
          if (element.status == "Pending") {
            pending.value++;
          } else if (element.status == "Awaiting") {
            awaiting.value++;
          } else if (element.status == "Delivered") {
            delivery.value++;
          } else if (element.status == "Rejected") {
            rejected.value++;
          }
        });
        print(pending.value);
        print(awaiting.value);

        // print("nwew");
        // await getweeks();
      });
    } catch (e) {}
  }

  var pendingus = 0.obs;
  var deliverus = 0.obs;
  var cancelus = 0.obs;
  var proc = 0.obs;
  var prod = 0.obs;
  gettingUserdetails(String phone) async {
    custom = [];
    pendingus.value = 0;
    deliverus.value = 0;
    cancelus.value = 0;
    try {
      await FirebaseFirestore.instance
          .collection('Order')
          .where("UserPhone", isEqualTo: phone)
          .get()
          .then((QuerySnapshot querySnapshot) async {
        // List<QueryDocumentSnapshot> Orders = querySnapshot.docs;
        custom = querySnapshot.docs
            .map((e) => OrderModel.fromMap(e.data() as Map<String, dynamic>))
            .toList();

        custom.forEach((element) {
          if (element.status == "Pending") {
            pendingus.value++;
            print("${pendingus.value}");
          } else if (element.status == "Delivered") {
            deliverus.value++;
          } else if (element.status == "Cancelled") {
            cancelus.value++;
          }
        });
        print(pending.value);
        print(awaiting.value);

        // print("nwew");
        // await getweeks();
      });
    } catch (e) {}
  }

  var newlist = [].obs;

  List<FAQModel> faqlist = [];
  getorders() async {
    ordersCount.value = 0;
    newsignupsCount.value = 0;
    deliveryboysCount.value = 0;
    productsCount.value = 0;
    try {
      FirebaseFirestore.instance
          .collection('Order')
          .get()
          .then((QuerySnapshot querySnapshot) async {
        // List<QueryDocumentSnapshot> Orders = querySnapshot.docs;
        orderslist = querySnapshot.docs
            .map((e) => OrderModel.fromMap(e.data() as Map<String, dynamic>))
            .toList();
        isorderloading.value = false;

        orderslist.forEach((element) {
          ordersCount.value++;
          print(element.DateTime!.toDate().toString());
        });
        getorderDetails();
        getweeks();

        isorderloading.value = false;
        // print("nwew");
        // await getweeks();
      });

      // ----------------------------------------------------------------------
      print("UK22");

      productlist = [];
      Stream<QuerySnapshot<Map<String, dynamic>>> stream = FirebaseFirestore
          .instance
          .collection("Products")
          // .where("driverId",
          //     isEqualTo:
          //         Get.find<HomeDashboardController>().driiverItem.value.id!)
          .snapshots();

      stream.listen((QuerySnapshot query) {
        if (query.docChanges.isNotEmpty) {
          productlist.clear();
        }
      });

      stream.map((snapshot) {
        snapshot.docs.forEach((prductdata) {
          ProductModel model = ProductModel.fromMap(prductdata.data());

          // model. = messageData.id;
          // model.getVheicale();
          productlist.add(model);
        });
        //print('Total message fetched: ${messages.length}');
        productlist.toList();
      });
      productlist.forEach((element) {
        productsCount.value++;
        print("UK");
        print(element.dangerous);
      });
// ------------------------------------------------------------------------
//
//
//
      productlist22 = [];
      productlist = [];
      newlist.value = [];
      FirebaseFirestore.instance
          .collection('Products')
          .get()
          .then((QuerySnapshot querySnapshot) {
        // List<QueryDocumentSnapshot> Orders = querySnapshot.docs;
        List<Map<String, dynamic>> promap = querySnapshot.docs
            .map((e) => e.data() as Map<String, dynamic>)
            .toList();

        promap.forEach((element) {
          productsCount.value++;

          if (element['food'] == true) {
            productlist22.add(ProductModel22.fromMap(element));
            prod.value++;

            print(
                "------------------------------Hurra.................................");
          } else {
            productlist.add(ProductModel.fromMap(element));
            proc.value++;
          }
        });
        isproductsloading.value = false;
        print("Count ${productsCount.value}");
        productlist.forEach((element) {
          print(element.images);
          print("Count D1");
        });

        productlist22.forEach((element) {
          print(element.images);
          print("Count V1");
        });

        productlist.forEach((element) {
          newlist.add(ProductMOdel33(
            colors: element.colors,
            dangerous: element.dangerous,
            description: element.description,
            height: element.height,
            images: element.images,
            largePrice: element.largePrice,
            length: element.length,
            mediumPrice: element.mediumPrice,
            price: element.price,
            productTag: element.productTag,
            sellPrice: element.sellPrice != null ? element.sellPrice : '',
            sellPriceDuration: element.sellPriceDuration != null
                ? element.sellPriceDuration
                : Timestamp.now(),
            sku: element.sku,
            smallPrice: element.smallPrice,
            status: element.status,
            stock: element.stock,
            storeId: element.storeId,
            title: element.title,
            warranty: element.warranty,
            weight: element.weight,
            width: element.width,
          ));
        });
        productlist22.forEach((element) {
          newlist.add(ProductMOdel33(
            description: element.description,
            images: element.images,
            largePrice: element.largePrice,
            length: element.length,
            mediumPrice: element.mediumPrice,
            price: element.price,
            productTag: element.productTag,
            sku: element.sku,
            sellPrice: '',
            sellPriceDuration: Timestamp.now(),
            smallPrice: element.smallPrice,
            status: element.status,
            stock: element.stock,
            storeId: element.storeId,
            title: element.title,
            menu: element.menu,
          ));
        });
        print("Newlist");

        newlist.forEach((element) {
          print(element);
        });
        // combinedList3 = productlist + productlist22;

        // querySnapshot.docs.forEach((doc) {
        //   OrderModel orderModel =
        //       OrderModel.fromFirestore(doc.data() as Map<String, dynamic>);

        //   print(orderModel.cartlist);
        //   print(doc["MainCategory"]);
        // });
      });
    } catch (u) {}
    try {
      FirebaseFirestore.instance
          .collection('DeliveryBoys')
          .get()
          .then((QuerySnapshot querySnapshot) {
        // List<QueryDocumentSnapshot> Orders = querySnapshot.docs;
        riderList = querySnapshot.docs
            .map((e) => RiderModel.fromMap(e.data() as Map<String, dynamic>))
            .toList();
        isriderloading.value = false;
        riderList.forEach((element) {
          deliveryboysCount = deliveryboysCount + 1;
          print(element.Imgurl);
        });
      });
    } catch (e) {
      print(e);
    }
    catlist = [];
    try {
      FirebaseFirestore.instance
          .collection('Category')
          .get()
          .then((QuerySnapshot querySnapshot) {
        // List<QueryDocumentSnapshot> Orders = querySnapshot.docs;
        catlist = querySnapshot.docs
            .map((e) => CategoryModel.fromMap(e.data() as Map<String, dynamic>))
            .toList();
        iscatloading.value = false;
        catlist.forEach((element) {
          print(element.name);
        });
        catlistitems = catlist
            .map((e) => CustomDropDownItem(name: e.name, icon: Icon(Icons.abc)))
            .toList();

        catlistitems.forEach(
          (element) => print("Category.....    list...........${element.name}"),
        );
        getselecteditem();
      });
    } catch (e) {}
    storelist.value = [];
    try {
      FirebaseFirestore.instance
          .collection('Store')
          .get()
          .then((QuerySnapshot querySnapshot) {
        // List<QueryDocumentSnapshot> Orders = querySnapshot.docs;
        storelist.value = querySnapshot.docs
            .map((e) => SellerModel.fromMap(e.data() as Map<String, dynamic>))
            .toList();
        issellerloading.value = false;
        storelist.value.forEach((element) {
          print(element.address);
        });
      });
    } catch (e) {}

    faqlist = [];
    try {
      FirebaseFirestore.instance
          .collection('FAQ')
          .get()
          .then((QuerySnapshot querySnapshot) {
        // List<QueryDocumentSnapshot> Orders = querySnapshot.docs;
        faqlist = querySnapshot.docs
            .map((e) => FAQModel.fromMap(e.data() as Map<String, dynamic>))
            .toList();
        isfaqloading.value = false;
        faqlist.forEach((element) {
          print(element.Question);
        });
      });
    } catch (e) {}

    // DateTime now = new DateTime.now();
    // DateTime lastDayOfMonth = new DateTime(now.year, now.month + 1, 0);
    // double kkk = lastDayOfMonth.month / lastDayOfMonth.day;
    // print("${lastDayOfMonth.month}/${lastDayOfMonth.day} $kkk");

    // // Current date and time of system
    // String date = DateTime.now().toString();
    // print(date);
    try {
      FirebaseFirestore.instance
          .collection('Users')
          .get()
          .then((QuerySnapshot querySnapshot) {
        userslist = querySnapshot.docs
            .map((e) => UserModel.fromMap(e.data() as Map<String, dynamic>))
            .toList();
        isUserloading.value = false;
        userslist.forEach((element) {
          newsignupsCount.value++;
          print(element.Email);
        });
        print(
            "${newsignupsCount.value}  ${ordersCount.value}  ${productsCount.value}");
      });
    } catch (e) {}

    try {
      FirebaseFirestore.instance
          .collection('promoCode')
          .get()
          .then((QuerySnapshot querySnapshot) {
        promolist = querySnapshot.docs
            .map((e) => PromoCode.fromMap(e.data() as Map<String, dynamic>))
            .toList();
        isPromoloading.value = false;
        promolist.forEach((element) {
          print(element.Discount);
        });
      });
    } catch (e) {}

    try {
      FirebaseFirestore.instance
          .collection('Admins')
          .get()
          .then((QuerySnapshot querySnapshot) {
        adminlist = querySnapshot.docs
            .map((e) => AdminsModel.fromMap(e.data() as Map<String, dynamic>))
            .toList();
        isadminloading.value = false;
        adminlist.forEach((element) {
          print(element.Username);
        });
      });
    } catch (e) {}
    // notifyListeners();
    update();
  }

//
//
//
//
// ........$........ Deleting Data .... List...............$...........
//
//
//
//
  removeproduct(String sku) {
    newlist.removeWhere((element) => element.sku == sku);
  }

  removestore(String uid) {
    storelist.value.removeWhere((element) => element.uid == uid);
  }

  removecustomer(String email) {
    userslist.removeWhere((element) => element.Email == email);
    update();
  }

  removerider(String email) {
    riderList.removeWhere((element) => element.Email == email);
    update();
  }

  removesystemUser(String email) {
    adminlist.removeWhere((element) => element.email == email);
    update();
  }

  removecategory(String name) {
    catlist.removeWhere((element) => element.name == name);
    update();
  }

  removepro(String usnumber) {
    promolist.removeWhere((element) => element.UserNumber == usnumber);
    update();
  }

  removeques(String ques) {
    faqlist.removeWhere((element) => element.Question == ques);
    update();
  }

  int index = 0;
  updatestatus(String sky) {
    int i = 0;
    newlist.forEach((element) {
      if (element.sku == sky) {
        element.status = 'Live';
        index = i;
        print(index);
      }
      i++;
    });
    newlist[index].status = "Live";
  }

//
//
//
//
// ................ ..........................
//
//
//
//
  var awaitingcount = 0.obs;
  var acceptedcount = 0.obs;
  var readytoshipcount = 0.obs;
  var cancelledCount = 0.obs;
  var failedCount = 0.obs;
  var returnedCount = 0.obs;
  var shippedCount = 0.obs;
  var deliveredcount = 0.obs;

  getorderDetails() {
    awaitingcount.value = 0;
    acceptedcount.value = 0;
    readytoshipcount.value = 0;
    cancelledCount.value = 0;
    failedCount.value = 0;
    returnedCount.value = 0;
    shippedCount.value = 0;
    deliveredcount.value = 0;
    orderslist.forEach((element) {
      print(element);
      if (element.status == "Pending") {
        awaitingcount.value++;
      } else if (element.status == "Cancelled") {
        cancelledCount.value++;
      } else if (element.status == "Ready to Ship") {
        readytoshipcount.value++;
      } else if (element.status == "Returned") {
        returnedCount.value++;
      } else if (element.status == "Acccepted") {
        acceptedcount.value++;
      } else if (element.status == "Delivered") {
        deliveredcount.value++;
      }
    });
    print(
        "${awaitingcount.value}   ${cancelledCount.value}  ${acceptedcount.value}");
  }

  var weekdays = [].obs;
  getweeks() async {
    weekdays.clear();
    print(
        'running.......................................................................');

    orderslist.forEach((element) {
      print('datatatatat');

//       int date = element.OrderTime!.toDate().weekday;
//       // This will generate the time and date for first day of month
// //       String firstDay = date.substring(0, 8) + '01' + date.substring(10);

// // // week day for the first day of the month
// //       int weekDay = DateTime.parse(firstDay).weekday;

//       print(date);
      String date = DateTime(2017, 1, 12).toString();

// This will generate the time and date for first day of month
      String firstDay = date.substring(0, 8) + '01' + date.substring(10);

// week day for the first day of the month
      int weekDay = DateTime.parse(firstDay).weekday;

      DateTime testDate = element.DateTime!.toDate(); // DateTime(2017, 1, 29);
      print(testDate);
      int weekOfMonth;

//  If your calender starts from Monday
      weekDay--;
      weekOfMonth = ((testDate.day + weekDay) / 7).ceil();
      print('Week of the month: $weekOfMonth');
      weekDay++;

// If your calender starts from sunday
      if (weekDay == 7) {
        weekDay = 0;
      }
      weekOfMonth = ((testDate.day + weekDay) / 7).ceil();
      print('Week of the month: $weekOfMonth');
      weekdays.value.add(weekOfMonth);

      // print(date.weekday);
//       // This will generate the time and date for first day of month
//       String firstDay = date.substring(0, 8) + '01' + date.substring(10);

// // week day for the first day of the month
//       int weekDay = DateTime.parse(firstDay).weekday;
//       print(weekDay);
//       DateTime testDate = DateTime.now();

//       int weekOfMonth;

// //  If your calender starts from Monday
//       weekDay--;
//       weekOfMonth = ((testDate.day + weekDay) / 7).ceil();
//       print('Week of the month: $weekOfMonth');
    });

    print("Week days ${weekdays} + ${weekdays.length}");
  }
}

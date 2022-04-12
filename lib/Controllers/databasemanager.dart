import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_webapp/Controllers/MainController.dart';
import 'package:multi_vendor_webapp/models/adminmode.dart';
import 'package:multi_vendor_webapp/models/faqmodel.dart';
import 'package:multi_vendor_webapp/models/productmodel.dart';
import 'package:multi_vendor_webapp/models/productmodel33.dart';
import 'package:multi_vendor_webapp/models/promoCodemode.dart';
import 'package:multi_vendor_webapp/models/sellermodel.dart';
import 'package:multi_vendor_webapp/models/usermodel.dart';
import 'package:multi_vendor_webapp/utils/databasemanager.dart';

import '../models/categorymode.dart';
import '../models/productModel22.dart';
import '../models/riderModel.dart';

class DatabaseManager {
  List<SellerModel> storelist = [];
  List<ProductModel> prodList = [];
  List<ProductModel22> prodList22 = [];

//
//
//
//
// ................ Deleting Data .... List..........................
//
//
//
//
  deleteStoreDatabyID(String uid) async {
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection("Store");

    try {
      collectionRef.doc(uid).delete().then((_) {
        print("success deleted!");
        Get.snackbar("Data Deleted", "success deleted!");
      });
      controller.removestore(uid);
    } catch (e) {}
  }

  final controller = Get.find<MainProvider>();
  List<String> proIDs = [];
  deleteProductByID(String sku) async {
    print("product");
    prodList = [];
    prodList22 = [];
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection("Products");
    int i = 0;
    try {
      await FirebaseFirestore.instance
          .collection('Products')
          .get()
          .then((QuerySnapshot querySnapshot) {
        // List<QueryDocumentSnapshot> Orders = querySnapshot.docs;
        proIDs = querySnapshot.docs.map((e) => e.id).toList();
        print(proIDs);
        final firestoreInstance = FirebaseFirestore.instance;

        List<Map<String, dynamic>> promap = querySnapshot.docs
            .map((e) => e.data() as Map<String, dynamic>)
            .toList();

        promap.forEach((element) {
          if (element['food'] == true) {
            prodList22.add(ProductModel22.fromMap(element));
            print(
                "------------------------------Hurra.................................");
          } else {
            prodList.add(ProductModel.fromMap(element));
          }
        });

        prodList.forEach((element) {
          i++;

          print(element);
          print(element.images);
          print("${element.sku}  ${sku}");
          if (element.sku == sku) {
            print(element.sku);
            collectionRef.doc(proIDs[i]).delete().then((_) {
              print("success deleted!");
              Get.snackbar("Data Deleted", "success deleted!");
            });
          }
        });

        i = 0;
        prodList22.forEach((element) {
          i++;

          print(element);
          print(element.images);
          print("${element.sku}  ${sku}");
          if (element.sku == sku) {
            print(element.sku);
            collectionRef.doc(proIDs[i]).delete().then((_) {
              print("success deleted!");
              Get.snackbar("Data Deleted", "success deleted!");
            });
          }
        });

        controller.removeproduct(sku);
      });
    } catch (e) {}
  }

  List<UserModel> userlist = [];
  deleteCustomer(String email) async {
    userlist.clear();
    proIDs.clear();
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection("Users");
    int i = 0;
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .get()
          .then((QuerySnapshot querySnapshot) {
        // List<QueryDocumentSnapshot> Orders = querySnapshot.docs;
        querySnapshot.docs.map((e) async {});
        proIDs = querySnapshot.docs.map((e) => e.id).toList();

        userlist = querySnapshot.docs
            .map((e) => UserModel.fromMap(e.data() as Map<String, dynamic>))
            .toList();

        userlist.forEach((element) {
          if (element.Email == email) {
            collectionRef.doc(proIDs[i]).delete().then((_) {
              print("success deleted!");
              Get.snackbar("Data Deleted", "success deleted!");
            });
          }
          i++;
        });

        controller.removecustomer(email);
      });
    } catch (e) {}
  }

  List<RiderModel> rilist = [];
  deleterider(String email) async {
    rilist.clear();
    proIDs.clear();
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection("DeliveryBoys");
    int i = 0;
    try {
      await FirebaseFirestore.instance
          .collection('DeliveryBoys')
          .get()
          .then((QuerySnapshot querySnapshot) {
        // List<QueryDocumentSnapshot> Orders = querySnapshot.docs;
        querySnapshot.docs.map((e) async {});
        proIDs = querySnapshot.docs.map((e) => e.id).toList();

        rilist = querySnapshot.docs
            .map((e) => RiderModel.fromMap(e.data() as Map<String, dynamic>))
            .toList();

        rilist.forEach((element) {
          if (element.Email == email) {
            collectionRef.doc(proIDs[i]).delete().then((_) {
              print("success deleted!");
              Get.snackbar("Data Deleted", "success deleted!");
            });
          }
          i++;
        });

        controller.removerider(email);
      });
    } catch (e) {}
  }

  List<AdminsModel> adlist = [];
  deleteAdmins(String email) async {
    adlist.clear();
    proIDs.clear();
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection("Admins");
    int i = 0;
    try {
      await FirebaseFirestore.instance
          .collection('Admins')
          .get()
          .then((QuerySnapshot querySnapshot) {
        // List<QueryDocumentSnapshot> Orders = querySnapshot.docs;
        querySnapshot.docs.map((e) async {});
        proIDs = querySnapshot.docs.map((e) => e.id).toList();

        adlist = querySnapshot.docs
            .map((e) => AdminsModel.fromMap(e.data() as Map<String, dynamic>))
            .toList();

        adlist.forEach((element) {
          if (element.email == email) {
            collectionRef.doc(proIDs[i]).delete().then((_) {
              print("success deleted!");
              Get.snackbar("Data Deleted", "success deleted!");
            });
          }
          i++;
        });

        controller.removesystemUser(email);
      });
    } catch (e) {}
  }

  List<CategoryModel> catlist = [];
  deleteCat(String name) async {
    catlist.clear();
    proIDs.clear();
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection("Category");
    int i = 0;
    try {
      await FirebaseFirestore.instance
          .collection('Category')
          .get()
          .then((QuerySnapshot querySnapshot) {
        // List<QueryDocumentSnapshot> Orders = querySnapshot.docs;
        querySnapshot.docs.map((e) async {});
        proIDs = querySnapshot.docs.map((e) => e.id).toList();

        catlist = querySnapshot.docs
            .map((e) => CategoryModel.fromMap(e.data() as Map<String, dynamic>))
            .toList();

        catlist.forEach((element) {
          if (element.name == name) {
            collectionRef.doc(proIDs[i]).delete().then((_) {
              print("success deleted!");
              Get.snackbar("Data Deleted", "success deleted!");
            });
          }
          i++;
        });

        controller.removecategory(name);
      });
    } catch (e) {}
  }

  List<PromoCode> promolist = [];
  deletePrmo(String usnumber) async {
    promolist.clear();
    proIDs.clear();
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection("promoCode");
    int i = 0;
    try {
      await FirebaseFirestore.instance
          .collection('promoCode')
          .get()
          .then((QuerySnapshot querySnapshot) {
        // List<QueryDocumentSnapshot> Orders = querySnapshot.docs;
        querySnapshot.docs.map((e) async {});
        proIDs = querySnapshot.docs.map((e) => e.id).toList();

        promolist = querySnapshot.docs
            .map((e) => PromoCode.fromMap(e.data() as Map<String, dynamic>))
            .toList();

        promolist.forEach((element) {
          if (element.UserNumber == usnumber) {
            collectionRef.doc(proIDs[i]).delete().then((_) {
              print("success deleted!");
              Get.snackbar("Data Deleted", "success deleted!");
            });
          }
          i++;
        });

        controller.removepro(usnumber);
      });
    } catch (e) {}
  }

  List<FAQModel> faqlist = [];
  deleteFAQ(String ques) async {
    faqlist.clear();
    proIDs.clear();
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection("FAQ");
    int i = 0;
    try {
      await FirebaseFirestore.instance
          .collection('FAQ')
          .get()
          .then((QuerySnapshot querySnapshot) {
        // List<QueryDocumentSnapshot> Orders = querySnapshot.docs;
        querySnapshot.docs.map((e) async {});
        proIDs = querySnapshot.docs.map((e) => e.id).toList();

        faqlist = querySnapshot.docs
            .map((e) => FAQModel.fromMap(e.data() as Map<String, dynamic>))
            .toList();

        faqlist.forEach((element) {
          if (element.Question == ques) {
            collectionRef.doc(proIDs[i]).delete().then((_) {
              print("success deleted!");
              Get.snackbar("Data Deleted", "success deleted!");
            });
          }
          i++;
        });

        controller.removeques(ques);
      });
    } catch (e) {}
  }

  statusStoreDatabyID(String uid, String status) async {
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection("Store");
    final firestoreInstance = FirebaseFirestore.instance;

    try {
      firestoreInstance
          .collection("Store")
          .doc(uid)
          .update({"status": status}).then((_) {
        Get.snackbar("Data Changed", "Status Changed!");
      });
      // controller.removestore(uid);
    } catch (e) {}
  }

  statusProductDatabyID(String sku, String status) async {
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection("Products");
    final firestoreInstance = FirebaseFirestore.instance;
    int i = 0;
    proIDs.clear();
    prodList.clear();
    String uid = '';
    try {
      await FirebaseFirestore.instance
          .collection('Products')
          .get()
          .then((QuerySnapshot querySnapshot) {
        // List<QueryDocumentSnapshot> Orders = querySnapshot.docs;
        proIDs = querySnapshot.docs.map((e) => e.id).toList();
        print(proIDs);
        print(sku + status);

        List<Map<String, dynamic>> promap = querySnapshot.docs
            .map((e) => e.data() as Map<String, dynamic>)
            .toList();

        promap.forEach((element) {
          if (element['food'] == true) {
            prodList22.add(ProductModel22.fromMap(element));
            print(element);

            print(
                "------------------------------Hurra.................................");
          } else {
            prodList.add(ProductModel.fromMap(element));
            print(element);
          }
        });

        prodList.forEach((element) {
          i++;
          if (element.sku == sku) {
            print(" Found   ${element.sku}  ${sku}");
            uid = proIDs[i];
            firestoreInstance
                .collection("Products")
                .doc(proIDs[i])
                .update({"status": status}).then((_) {
              Get.snackbar("Data Changed", "Status Changed!");
            });
          }
        });

        i = 0;
        prodList22.forEach((element) {
          i++;
          if (element.sku == sku) {
            print(" Found 3  ${element.sku}  ${sku}  ${proIDs[i]}");
            uid = proIDs[i];

            print(element.sku);
            firestoreInstance
                .collection("Products")
                .doc(proIDs[i])
                .update({"status": status}).then((_) {
              Get.snackbar("Data Changed", "Status Changed!");
            });
          }
        });
      });

      controller.updatestatus(sku);
    } catch (e) {}
  }
}

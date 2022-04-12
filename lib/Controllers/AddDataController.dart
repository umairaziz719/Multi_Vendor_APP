import 'dart:collection';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_geo_hash/geohash.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlng/latlng.dart';

import '../models/sellermodel.dart';

class AddDataController extends GetxController {
  final userno = TextEditingController();
  final code = TextEditingController();
  final msg = TextEditingController();
  final orderamount = TextEditingController();
  final distype = TextEditingController();
  final dis = TextEditingController();

  final disamount = TextEditingController();
  final repeat = TextEditingController();
  final stDate = TextEditingController();
  final enDate = TextEditingController();
  final status = TextEditingController();

  // Delivery Boy details:

  final username = TextEditingController();
  final password = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();

//   FAQ

  final ques = TextEditingController();
  final ans = TextEditingController();

  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection("promoCode");
  final CollectionReference collectionRef2 =
      FirebaseFirestore.instance.collection("DeliveryBoys");
  final CollectionReference collectionRef222 =
      FirebaseFirestore.instance.collection("Category");
  final CollectionReference collectionRef3 =
      FirebaseFirestore.instance.collection("Store");
  final CollectionReference collectionReffaq =
      FirebaseFirestore.instance.collection("FAQ");

// Compute the GeoHash for a lat/lng point
// Init firestore and geoFlutterFire
  final geo = Geoflutterfire();
  final _firestore = FirebaseFirestore.instance;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  final formKey = GlobalKey<FormFieldState>();

  promosettingupdata() async {
    await addStudents();
  }

  faqsettingupdata() async {
    await addFAQ();
    ques.clear();
    ans.clear();
  }

  Future<void> addFAQ() async {
    //creates a new doc with unique doc ID
    return collectionReffaq.add({
      'Question': ques.text,
      'Answer': ans.text,
    }).then((value) {
      debugPrint("FAQ Added");
      questionloading.value = false;
      Get.snackbar("Added", "FAQ Added Successfully");
    }).catchError((error) {
      debugPrint("Failed to add FAQ: $error");
      questionloading.value = false;
      Get.snackbar("Failed", "Failed to add FAQ $error");
    });
  }

  var questionloading = false.obs;
  var ispromoloading = false.obs;
  Future<void> addStudents() async {
    //creates a new doc with unique doc ID
    return collectionRef.add({
      'UserNumber': userno.text,
      'Code': code.text,
      'Message': msg.text,
      'OrderAmount': orderamount.text,
      'DiscountType': distype.text,
      'Discount': dis.text,
      'DiscountAmount': disamount.text,
      'Repeat': repeat.text,
      'StartDate': stDate.text,
      'EndDate': enDate.text,
      'Status': status.text,
    }).then((value) {
      debugPrint("PromoCode Added");
      ispromoloading.value = false;
      Get.snackbar("Added", "Promo Code Added Successfully");
    }).catchError((error) {
      debugPrint("Failed to add PromoCode: $error");
      ispromoloading.value = false;
      Get.snackbar("Failed", "Failed to add PromoCode $error");
    });
  }

  // Delivery Boy Submitt Details.....
  var isdeloading = false.obs;
  deliverysettingupdata() async {
    // await setLocation();
    await adddelivery();
  }

  Future<void> adddelivery() async {
    User? user =
        await registerWithEmailPassword(email.text, password.text, "delivery");
    //creates a new doc with unique doc ID

    return collectionRef2.doc(deliveryuid).set({
      'UserName': username.text,
      'Password': password.text,
      'Phone': phone.text,
      'Email': email.text,
      'Address': address.text,
      'date': FieldValue.serverTimestamp(),
      'imgurl': fakemap['delivery']
    }).then((value) {
      debugPrint("Delivery Boy Added");
      isdeloading.value = false;
      Get.snackbar("Added", "Delivery Boy Added Successfully");
    }).catchError((error) {
      debugPrint("Failed to add DeliveryBoy: $error");
      isdeloading.value = false;
      Get.snackbar("Failed", "Failed to add DeliveryBoy: $error");
    });
  }

  var issliderloading = false.obs;
  slidersettingupdata(String img) async {
    // await setLocation();
    await addsliderdata(img);
  }

  final sliname = TextEditingController();

  Future<void> addsliderdata(String category)  {
    //creates a new doc with unique doc ID
    return collectionRef222.add({
      'name': sliname.text,
      'image': sliderimg.value,
      'category': category,
    }).then((value) {
      debugPrint("Slider Added");
      issliderloading.value = false;
      Get.snackbar("Added", "Slider Added Successfully");
    }).catchError((error) {
      debugPrint("Failed to add Slider: $error");
      issliderloading.value = false;
      Get.snackbar("Failed", "Failed to add Slider: $error");
    });
  }

  Future<void> setLocation() async {
    GeoFirePoint myLocation =
        geo.point(latitude: 12.960632, longitude: 77.641603);
    return collectionRef3
        .add({'name': 'random name', 'position': myLocation.data})
        .then((value) => debugPrint(" Added"))
        .catchError((error) => debugPrint("Failed to add : $error"));
  }

  final imagePicker = ImagePicker();
  String? logoImagePath = '';
  Uint8List? imagevalue;
  PickedFile? pickedFile;
  List<Uint8List?>? multipleimages;
  getLogoImage(String dataName) async {
    pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      logoImagePath = pickedFile!.path;
      imagevalue = await pickedFile!.readAsBytes();
      await saveimage(dataName);
    }
  }

  var sliderimg = ''.obs;
  var _image;
  Future getImage(String dataName) async {
    final _picker = ImagePicker();
    var image = await _picker.pickImage(source: ImageSource.gallery);

    _image = File(image!.path);
    saveimage(dataName);
  }

  int i = 0;
  Map<String, dynamic> fakemap = {};
  var deliveryprofile = ''.obs;
  var fakemap22 = {}.obs;

  Future<void> saveimage(String dataName) async {
    i++;
    Get.snackbar("Saving...", "Please Wait while Data Save");

    if (pickedFile != null) {
      final UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          // .child("CompaniesLogos/${FirebaseAuth.instance.currentUser!.uid}")
          .child("SellersData/images/$i")
          .putData(await pickedFile!.readAsBytes(),
              SettableMetadata(contentType: 'image/jpeg'));
      TaskSnapshot taskSnapshot = await uploadTask;

      taskSnapshot.ref.getDownloadURL().then((value) {
        print("Value: $value");
        Get.snackbar("Image Saved", "Image Saved Successfully");

        fakemap.putIfAbsent(dataName, () => value);
        fakemap22.putIfAbsent(dataName, () => value);

        if (dataName == "delivery") {
          deliveryprofile.value = value;
        }
        if (dataName == "slider_img") {
          sliderimg.value = value;
        }
      }).catchError((error) {
        Get.snackbar("Image Not Saved", "Image Not saved $error");
      });
      // print("Logo Url :$downloadUrl");
    } else {
      print('No image selected.');
      Get.snackbar("Image", "No Image Selected!");
    }
    update();

    // Reference ref = FirebaseStorage.instance.ref();
    // TaskSnapshot addImg =
    //     await ref.child("SellersData/imagag$i").putFile(_image!);
    // if (addImg.state == TaskState.success) {
    //   print("added to Firebase Storage");
    //   final String downloadUrl = await addImg.ref.getDownloadURL();
    //   fakemap.putIfAbsent(dataName, () => downloadUrl);
    //   // await FirebaseFirestore.instance
    //   //     .collection("images")
    //   //     .add({"$dataName": downloadUrl});
    // }
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  static LatLng currentPosition = LatLng(0.014866, 0.523872);

  Future<void> myLocation(bool animateCamera) async {
    var position = await GeolocatorPlatform.instance.getCurrentPosition();
    print(position);
    currentPosition = LatLng(position.latitude, position.longitude);
  }

  final ownerName = TextEditingController();
  final stemail = TextEditingController();
  final stphone = TextEditingController();
  final stlocatio = TextEditingController();
  final storename = TextEditingController();
  final storetag = TextEditingController();
  final stpassword = TextEditingController();
  final staddress = TextEditingController();
  final staccNumber = TextEditingController();
  final stdes = TextEditingController();

  final stholdername = TextEditingController();
  final Bankname = TextEditingController();
  final Accounttype = TextEditingController();
  final accountstatus = TextEditingController();
  final mainCategory = TextEditingController();

  sellersetup() async {
    await addSeller();
  }

  var maincat = ''.obs;
  var subcat = [].obs;
  var list = 0;
  settingcategory(String title, String cat) {
    if (cat == "main") {
      maincat.value = title;
    } else {
      subcat.value.add(title);
    }

    print(maincat);
    print(subcat.value);
    update();
  }

  var issellerloading = false.obs;

  Future<void> addSeller() async {
    User? user = await registerWithEmailPassword(
        stemail.text, stpassword.text, "seller");
    GeoFirePoint myLocation =
        geo.point(latitude: 12.960632, longitude: 77.641603);
    //creates a new doc with unique doc ID
    SellerModel newseller = SellerModel(
      address: staddress.text,
      bank: false,
      bankAccName: stholdername.text,
      bankAccNum: staccNumber.text,
      bankName: Bankname.text,
      cheque: "",
      cover: fakemap["cover"],
      email: stemail.text,
      geoLocation: StoresssLatlngmap(
          geohash: myLocation.hash, geopoint: myLocation.geoPoint),
      idCard: "234234234",
      idCardBack: fakemap["idback"],
      idCardFront: fakemap["idfront"],
      identification: false,
      image: "",
      location: true,
      logo: fakemap["logo"],
      mainCategory: maincat.value,
      ownerName: ownerName.text,
      phone: stphone.text,
      status: accountstatus.text,
      storeDetails: true,
      storeName: storename.text,
      storeTag: storetag.text,
      tags: ["Popular"],
      uid: "ERYFHGF67GHJGYJGHJGHJG",
    );
    return collectionRef3.doc(seuid).set(newseller.toMap()).then((value) {
      collectionRef3.doc(seuid).update({
        "uid": seuid,
        'date': FieldValue.serverTimestamp(),
        "description": stdes.text,
      }).then((_) {
        print("successfully ID added");
      });
      debugPrint("Seller Added");
      issellerloading.value = false;
      Get.snackbar("Added", "Seller Added Successfully");
    }).catchError((error) {
      debugPrint("Failed to add Seller: $error");
      issellerloading.value = false;
      Get.snackbar("Failed", "Failed to add Seller: $error");
    });
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? deliveryuid;
  String? deliveryuserEmail;
  String? seuid;
  String? seuserEmail;
  Future<User?> registerWithEmailPassword(
      String email, String password, String title) async {
    // Initialize Firebase
    await Firebase.initializeApp();
    User? user;

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;

      if (user != null) {
        if (title == "delivery") {
          deliveryuid = user.uid;
          deliveryuserEmail = user.email;
        } else {
          seuid = user.uid;
          seuserEmail = user.email;
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.snackbar("Weak password", 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('An account already exists for that email.');
        Get.snackbar("email-already-in-use",
            'An account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    return user;
  }
}

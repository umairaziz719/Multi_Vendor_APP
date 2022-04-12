import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_vendor_webapp/models/registrationmodel.dart';
import 'package:multi_vendor_webapp/utils/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final loginEmail = TextEditingController();
  final loginpassword = TextEditingController();
  final registerEmail = TextEditingController();
  final registerpassword = TextEditingController();
  final registerusername = TextEditingController();
  var popupMenuItemIndex = 0.obs;

  var isdeloading = false.obs;
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection("Admins");
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  checkemail() async {
    SharedPreferences prefs = await _prefs;
    if (prefs.containsKey('email') && prefs.containsKey("pass")) {
      await isUserExist(prefs.getString("email").toString(),
          prefs.getString("pass").toString(), isloggedIn);
    }
  }

  bool? isloggedIn = true;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkemail();
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

  int i = 0;
  Map<String, dynamic> fakemap = {};
  var profile = ''.obs;
  var sliderimg = ''.obs;

  Future<void> saveimage(String dataName) async {
    i++;
    Get.snackbar("Saving...", "Please Wait while Data Save");

    if (pickedFile != null) {
      final UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          // .child("CompaniesLogos/${FirebaseAuth.instance.currentUser!.uid}")
          .child("AdminData/images/01")
          .putData(await pickedFile!.readAsBytes(),
              SettableMetadata(contentType: 'image/jpeg'));
      TaskSnapshot taskSnapshot = await uploadTask;

      taskSnapshot.ref.getDownloadURL().then((value) {
        print("Value: $value");
        Get.snackbar("Image Saved", "Image Saved Successfully");

        fakemap.putIfAbsent(dataName, () => value);
        profile.value = value;
        sliderimg.value = value;
      }).catchError((error) {
        Get.snackbar("Image Not Saved", "Image Not saved $error");
      });
      // print("Logo Url :$downloadUrl");
    } else {
      print('No image selected.');
      Get.snackbar("Image", "No Image Selected!");
    }
    update();
  }

  var isloginloading = false.obs;
  authenticatingLoginForm() async {
    await isUserExist(loginEmail.text, loginpassword.text, isloggedIn);

    if (isexist == true) {
      loginEmail.clear();
      loginpassword.clear();
      isloginloading.value = false;
      Get.snackbar("Login Successfully", "Admin Logged In !");
      Get.toNamed(Routes.sitelayout);
    } else {
      loginEmail.clear();
      loginpassword.clear();
      isloginloading.value = false;
      Get.snackbar("Login Failed", "Admin Doesnot Exist !");
    }
  }

  authenticateRegister() async {
    await isUserExist(registerEmail.text, registerpassword.text, false);
    if (isexist == true) {
      registerEmail.clear();
      registerpassword.clear();
      registerusername.clear();
      isregisterloading.value = false;
      Get.snackbar("Not Valid", "Admin Already Exist");
    } else {
      await addAdmin();
    }
  }

  var isregisterloading = false.obs;
  Future<void> addAdmin() async {
    //creates a new doc with unique doc ID
    return collectionRef.add({
      'Username': registerusername.text,
      'email': registerEmail.text,
      'password': registerpassword.text,
      'imgurl': fakemap['admin_img'],
    }).then((value) {
      debugPrint("Admin Added");
      isregisterloading.value = false;
      Get.snackbar("Added", "Admin Added Successfully");
      registerEmail.clear();
      registerpassword.clear();
      registerusername.clear();
    }).catchError((error) {
      debugPrint("Failed to add Admin: $error");
      isregisterloading.value = false;
      Get.snackbar("Failed", "Failed to add Admin $error");
      registerEmail.clear();
      registerpassword.clear();
      registerusername.clear();
    });
  }

  List<RegistrationModel> model = [];
  bool isexist = false;
  var username = ''.obs;
  List<RegistrationModel> registrationmodel = [];
  Future<void> isUserExist(
      String emailaddress, String pass, bool? isloggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("$emailaddress     $pass");
    print("kalsd");
    model.clear();

    User? user = await signInWithEmailPassword(emailaddress, pass);

    username.value = user!.email.toString().split("@")[0];
    final snapshot =
        await FirebaseFirestore.instance.collection('Admins').get();

    if (user != null) {
      isexist = true;
    } else {
      isexist = false;
    }

    // if (snapshot.size == 0) {
    //   print('it does not exist');
    //   isexist = false;
    // } else {
    //   try {
    //     isexist = false;

    //     await FirebaseFirestore.instance
    //         .collection('Admins')
    //         .get()
    //         .then((QuerySnapshot querySnapshot) async {
    //       // List<QueryDocumentSnapshot> Orders = querySnapshot.docs;
    //       registrationmodel = querySnapshot.docs
    //           .map((e) =>
    //               RegistrationModel.fromMap(e.data() as Map<String, dynamic>))
    //           .toList();

    //       registrationmodel.forEach((element) {
    //         print(element.email.toString());
    //       });
    //       // print("nwew");
    //       // await getweeks();
    //       registrationmodel.forEach((element) async {
    //         if (element.email == emailaddress && element.password == pass) {
    //           print(element.password.toString());

    //           prefs.setString('email', emailaddress);
    //           prefs.setString("pass", element.password!);
    //           model.add(element);
    //           isexist = true;
    //         }
    //       });
    //     });

    //     // ignore: empty_catches
    //   } catch (u) {}
    // }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? uid;
  String? userEmail;

  Future<User?> signInWithEmailPassword(String email, String password) async {
    await Firebase.initializeApp();
    User? user;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;

      if (user != null) {
        uid = user.uid;
        userEmail = user.email;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('auth', true);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        isloginloading.value = false;
        print('No user found for that email.');
        Get.snackbar('Login Failed !', "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        isloginloading.value = false;
        print('Wrong password provided.');
        Get.snackbar('Login Failed !', "Wrong password provided.");
      }
    }

    return user;
  }
}

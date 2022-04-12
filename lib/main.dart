import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_webapp/Controllers/AddDataController.dart';
import 'package:multi_vendor_webapp/Controllers/AuthController.dart';
import 'package:multi_vendor_webapp/Controllers/menucontroller.dart';
import 'package:provider/provider.dart';

import 'Controllers/navigationcontroller.dart';
import 'Controllers/MainController.dart';
import 'helper/app_binding.dart';
import 'utils/routes.dart';
import 'utils/styles.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
        // apiKey: "AIzaSyCehUMD_ONrUyvPQJMTkOGZFez9VBWakCg",
        // appId: "1:961133402036:web:18ab0e2fc69413407184e1",
        // messagingSenderId: "961133402036",
        // projectId: "multi-vendor-app-f052c",

        apiKey: "AIzaSyB4aA4dKC4SiyZn_IXLQh_kyvJu8ZwUmvI",
        authDomain: "smana-6af7b.firebaseapp.com",
        databaseURL: "https://smana-6af7b-default-rtdb.firebaseio.com",
        projectId: "smana-6af7b",
        storageBucket: "smana-6af7b.appspot.com",
        messagingSenderId: "535897876419",
        appId: "1:535897876419:web:e7e94e796322d405393f76"),
  );
  Get.put(NavigationController());
  Get.put(MenuController());
  Get.put(MainProvider());
  Get.put(AddDataController());
  Get.put(AuthController());

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Multi-Vendor App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scrollbarTheme: ScrollbarThemeData(
            isAlwaysShown: true,
            thickness: MaterialStateProperty.all(10),
            thumbColor: MaterialStateProperty.all(dark),
            radius: Radius.circular(10),
            minThumbLength: 100),
        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context)
            .textTheme
            .copyWith(bodyText1: TextStyle(color: Colors.black)),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: dark,
      ),
      initialRoute: Routes.login,
      getPages: Routes.routes,
      initialBinding: AppBinding(),
    );
  }
}

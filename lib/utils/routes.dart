import 'package:get/get.dart';
import 'package:multi_vendor_webapp/Pages/layout.dart';

import '../Pages/LoginForm/login.dart';
import '../Pages/RegisterForm/registerform.dart';

class Routes {
  // All Screens Constants
  static const String splash = '/splash';
  static const String main = '/main';
  static const String sitelayout = '/siteLayout';
  static const String login = '/login';
  static const String register = '/register';
  static const String webdashboard = '/webDashboard';
  static const String surveylist = '/surveylist';
  static const String rootscreen = '/rootscreen';
  static const String exportscreen = '/exportscreen';

  static List<GetPage>? routes = <GetPage>[
    // GetPage(
    //   name: splash,
    //   page: () => SplashScreen(),
    // ),
    GetPage(
      name: sitelayout,
      page: () => SiteLayout(),
    ),
    GetPage(
      name: login,
      page: () => LoginForm(),
    ),
    GetPage(
      name: register,
      page: () => RegisterForm(),
    ),
    // GetPage(
    //   name: main,
    //   page: () => Root(),
    // ),
    // GetPage(
    //   name: managerdashboard,
    //   page: () => const RootScreen(),
    // ),
    // GetPage(
    //   name: pollsterdashboard,
    //   page: () => const RootScreen(
    //     isAdmin: true,
    //   ),
    // ),
    // GetPage(
    //   name: webdashboard,
    //   page: () => DashBoardPage(),
    // ),
    // GetPage(
    //   name: surveylist,
    //   page: () => SurveyList(),
    // ),
    // GetPage(
    //   name: rootscreen,
    //   page: () => RootScreen(),
    // ),
    // GetPage(
    //   name: rootscreen,
    //   page: () => SurveyExport(),
    // ),
  ];
}

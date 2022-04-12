import 'package:flutter/cupertino.dart';

import 'package:multi_vendor_webapp/constants/controllers.dart';
import 'package:multi_vendor_webapp/routing/router.dart';
import 'package:multi_vendor_webapp/routing/routes.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigatorkey,
      initialRoute: MainDashboard,
      onGenerateRoute: generateRoute,
    );

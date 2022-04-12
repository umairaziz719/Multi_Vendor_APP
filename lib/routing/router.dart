import 'package:flutter/material.dart';
import 'package:multi_vendor_webapp/Pages/DeliveryPage/deliveryScreen.dart';
import 'package:multi_vendor_webapp/Pages/FAQ/faqScreen.dart';
import 'package:multi_vendor_webapp/Pages/OrderPage/orderPage.dart';
import 'package:multi_vendor_webapp/Pages/PaymentPage/PaymentScreen.dart';
import 'package:multi_vendor_webapp/Pages/ProductPage/productScreen.dart';
import 'package:multi_vendor_webapp/Pages/Promocode/PromoScreen.dart';
import 'package:multi_vendor_webapp/Pages/SellerPage/sellerScreen.dart';
import 'package:multi_vendor_webapp/Pages/SellerPage/views/Sellermainpage.dart';

import 'package:multi_vendor_webapp/Pages/ProductPage/views/Productmainpage.dart';
import 'package:multi_vendor_webapp/Pages/SliderPage/SliderScreen.dart';
import 'package:multi_vendor_webapp/Pages/SystemPage/SystemScreen.dart';

import '../Pages/CustomerPage/customerPage.dart';
import '../Pages/MainPage/Hmainpage.dart';
import 'routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MainDashboard:
      return _getpageRoute(DashBoardMainPage());
    case Seller:
      return _getpageRoute(SellerPage());
    case Orders:
      return _getpageRoute(OrderPage());
    case Products:
      return _getpageRoute(ProductPage());
    case Customers:
      return _getpageRoute(CustomerPage());
    case DeliveryBoys:
      return _getpageRoute(DeliveryPage());
    case FAQs:
      return _getpageRoute(FaqPage());
    case SystemUSers:
      return _getpageRoute(SystemPage());
    case Sliders:
      return _getpageRoute(SliderPage());
    case PromorCodes:
      return _getpageRoute(PromoPage());
    case PaymentRequest:
      return _getpageRoute(PaymentPage());
    default:
      return _getpageRoute(DashBoardMainPage());
  }
}

PageRoute _getpageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

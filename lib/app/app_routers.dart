import 'package:datn_trung/screens/home/charge_screen.dart';
import 'package:datn_trung/screens/home/home_screen.dart';
import 'package:datn_trung/screens/home/payment_screen.dart';
import 'package:datn_trung/screens/home/profile_screen.dart';
import 'package:datn_trung/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

class AppRouters {
  static const String splashScreen = '/splash';
  static const String loginScreen = '/loginScreen';
  static const String homeScreen = '/homeScreen';
  static const String chargeScreen = '/chargeScreen';
  static const String paymentScreen = '/paymentScreen';
  static const String profileScreen = '/profileScreen';

  static final routes = <String, WidgetBuilder>{
    loginScreen: (BuildContext context) => const LoginPage(),
    homeScreen: (BuildContext context) => const HomeScreen(),
    chargeScreen: (BuildContext context) => const ChargingScreen(),
    paymentScreen: (BuildContext context) => const PaymentScreen(),
    profileScreen: (BuildContext context) => const ProfileScreen(),
  };
}

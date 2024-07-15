import 'package:datn_trung/screens/home/home_screen.dart';
import 'package:datn_trung/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

class AppRouters {
  static const String splashScreen = '/splash';
  static const String loginScreen = '/loginScreen';
  static const String homeScreen = '/homeScreen';
  static final routes = <String, WidgetBuilder>{
    loginScreen: (BuildContext context) => const LoginPage(),
    homeScreen: (BuildContext context) => const HomeScreen(),
  };
}

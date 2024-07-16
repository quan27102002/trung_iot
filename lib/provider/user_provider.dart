import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _emailUser = "";
  String get emailUser => _emailUser;
  void saveEmailUser(String value) {
    _emailUser = value;
    notifyListeners();
  }
}

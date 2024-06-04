import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  bool showError = false;

  void changeError(bool showHide) {
    showError = showHide;
    notifyListeners();
  }
}

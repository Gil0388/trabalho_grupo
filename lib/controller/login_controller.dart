import 'package:flutter/material.dart';
import 'package:trabalho_grupo/data/local/session_datasource.dart';
import 'package:trabalho_grupo/data/user_repository.dart';

class LoginController extends ChangeNotifier {
  LoginController(
      {required this.userRepository, required this.sessionDatasource});

// USER REPOSITORY FUNCTIONS
  final UserRepository userRepository;
  final SessionDatasource sessionDatasource;

  void doSignIn(
      {required String email,
      required String password,
      required Function() onSuccess,
      required Function() onError}) {
    userRepository.doSignIn(email: email, password: password).then((session) {
      // sessionDatasource.saveSession(session);
      return onSuccess();
    }).catchError((e) => onError());
  }

  bool showError = false;

  void changeError(bool showHide) {
    showError = showHide;
    notifyListeners();
  }
}

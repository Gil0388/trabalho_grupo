import 'package:shared_preferences/shared_preferences.dart';

import '../model/sign_in_response.dart';

class SessionDatasource {
 late SharedPreferences sessionDatasource;

  SessionDatasource();

  Future<void> init() async {
    sessionDatasource = await SharedPreferences.getInstance();
  }

  Future<void> saveSession(SignInResponse response) {
    return sessionDatasource.setString('session', response.toJson());
  }

  SignInResponse? getSession() {
    final json = sessionDatasource.getString('session');
    if (json != null) {
      return SignInResponse.fromJson(json);
    }
    return null;
  }

  Future deleteSession() {
    return sessionDatasource.remove('session');
  }
}

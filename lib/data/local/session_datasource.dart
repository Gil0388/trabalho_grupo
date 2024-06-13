import 'package:shared_preferences/shared_preferences.dart';

import '../model/sign_in_response.dart';

class SessionDatasource {
  late SharedPreferences sharedPreferences;

  SessionDatasource();

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveSession(SignInResponse response) {
    return sharedPreferences.setString('session', response.toJson());
  }

  SignInResponse? getSession() {
    final json = sharedPreferences.getString('session');
    if (json != null) {
      return SignInResponse.fromJson(json);
    }
    return null;
  }

  Future deleteSession() {
    return sharedPreferences.remove('session');
  }
}

import 'package:dio/dio.dart';

import 'package:trabalho_grupo/data/model/sign_in_response.dart';

class UserRepository {
  static const signPath = 'auth/local';
  static const cadastroPath = 'auth/local/register';
  late Dio dio;

  UserRepository(this.dio);

  Future<SignInResponse> doSignIn({
    required String email,
    required String password,
  }) async {
    final response = await dio.post(
      signPath,
      data: {
        'identifier': email,
        'password': password,
      },
    );

    try {
      return SignInResponse.fromMap(response.data);
    } catch (e) {
      return throw Exception(e);
    }
  }

  Future<SignInResponse> doSignUp(
      {required String username,
      required String email,
      required String password}) async {
    final response = await dio.post(cadastroPath,
        data: {'username': username, 'email': email, 'password': password});

    try {
      return SignInResponse.fromMap(response.data);
    } catch (e) {
      return throw Exception(e);
    }
  }
}

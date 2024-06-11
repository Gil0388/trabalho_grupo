import 'package:dio/dio.dart';
import 'package:trabalho_grupo/data/model/sign_in_response.dart';

class UserRepository {
  static const signPath = 'auth/local';
  late Dio dio;

  UserRepository(this.dio);

  Future<SignInResponse> doSignIn({
    required String email,
    required String password,
  }) async {
    return dio.post(
      signPath,
      data: {
        'identifier': email,
        'password': password,
      },
    ).then((value) {
      return SignInResponse.fromMap(value.data);
    });
  }
}

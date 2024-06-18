import 'sign_in_response.dart';

class SignUpResponse {
  final String jwt;
  final User user;

  SignUpResponse({required this.jwt, required this.user});

  factory SignUpResponse.fromMap(Map<String, dynamic> map) {
    return SignUpResponse(
        jwt: map['jwt'] as String,
        user: User.fromMap(map['user'] as Map<String, dynamic>));
  }
}

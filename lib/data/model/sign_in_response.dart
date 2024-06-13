import 'dart:convert';

class SignInResponse {
  final String jwt;
  final User user;
  SignInResponse({
    required this.jwt,
    required this.user,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jwt': jwt,
      'user': user.toMap(),
    };
  }

  factory SignInResponse.fromMap(Map<String, dynamic> map) {
    return SignInResponse(
      jwt: map['jwt'] as String,
      user: User.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory SignInResponse.fromJson(String source) =>
      SignInResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}

class User {
  final int id;
  final String username;
  final String email;
  User({
    required this.id,
    required this.username,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      username: map['username'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());
}

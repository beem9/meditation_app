// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';

class User {
  final String username;
  final String password;
  final FormData? picture;

  User({
    required this.username,
    required this.password,
    required this.picture,
  });

  User copyWith({
    String? username,
    String? password,
    FormData? picture,
  }) {
    return User(
      username: username ?? this.username,
      password: password ?? this.password,
      picture: picture ?? this.picture,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'picture': picture,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] as String,
      password: map['password'] as String,
      picture: FormData.fromMap(map['picture'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'User(username: $username, password: $password, picture: $picture)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.password == password &&
        other.picture == picture;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode ^ picture.hashCode;
}

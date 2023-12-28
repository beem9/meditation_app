import 'dart:convert';
import 'dart:io';

class User {
  final String username;
  final String password;
  final File? picture;

  User({
    required this.username,
    required this.password,
    this.picture,
  });

  User copyWith({
    String? username,
    String? password,
    File? picture,
  }) {
    return User(
      username: username ?? this.username,
      password: password ?? this.password,
      picture: picture ?? this.picture,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "username": "$username",
      "password": "$password",
      // Handle picture here, convert File to something usable
      "picture": picture != null ? picture!.path : null,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] as String,
      password: map['password'] as String,
      // Handle picture here, convert it back to a File
      picture: map['picture'] != null ? File(map['picture'] as String) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'User(username: $username, password: $password, picture: $picture)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.username == username &&
        other.password == password &&
        other.picture == picture;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode ^ picture.hashCode;
}

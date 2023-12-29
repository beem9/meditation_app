// class User {
//   final String username;
//   final String password;
//   final FormData? picture;

//   User({
//     required this.username,
//     required this.password,
//     this.picture,
//   });

//   User copyWith({
//     String? username,
//     String? password,
//     File? picture,
//   }) {
//     return User(
//       username: username ?? this.username,
//       password: password ?? this.password,
//       picture: picture ?? this.picture,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       "username": "$username",
//       "password": "$password",
//       // Handle picture here, convert File to something usable
//       "picture": picture != null ? picture!.path : null,
//     };
//   }

//   factory User.fromMap(Map<String, dynamic> map) {
//     return User(
//       username: map['username'] as String,
//       password: map['password'] as String,
//       // Handle picture here, convert it back to a File
//       picture: map['picture'] != null ? File(map['picture'] as String) : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory User.fromJson(String source) =>
//       User.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() =>
//       'User(username: $username, password: $password, picture: $picture)';

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is User &&
//         other.username == username &&
//         other.password == password &&
//         other.picture == picture;
//   }

//   @override
//   int get hashCode => username.hashCode ^ password.hashCode ^ picture.hashCode;
// }
class User {
  User({
    this.id,
    required this.username,
    this.password,
    this.imagePath, // Change from FormData to String for file path or URL
    this.exp,
    this.finishedExercises,
    this.iat,
  });

  late final int? id;
  late final String username;
  late final String? password;
  late final String? imagePath; // Change type to String for file path or URL
  late final int? exp;
  late final int? finishedExercises;
  late final int? iat;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    imagePath = json['image']; // Change to imagePath
    exp = json['exp'];
    finishedExercises = json['finishedExercises'];
    iat = json['iat'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['username'] = username;
    _data['password'] = password;
    _data['image'] = imagePath; // Change to imagePath
    _data['exp'] = exp;
    _data['finishedExercises'] = finishedExercises;
    _data['iat'] = iat;
    return _data;
  }
}

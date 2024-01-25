import 'package:flutter_firebase_auth_template/features/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {required super.uid,
      required super.name,
      required super.email,
      required super.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      avatar: json['avatar'],
    );
  }
  factory UserModel.fromUser(User user) {
    return UserModel(
      uid: user.uid,
      name: user.name,
      email: user.email,
      avatar: user.avatar,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "avatar": avatar,
    };
  }

  UserModel copyWith(
      {String? uid, String? name, String? email, String? avatar}) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
    );
  }
}

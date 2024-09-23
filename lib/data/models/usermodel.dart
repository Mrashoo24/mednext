import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? userId;
  String? fullName;
  String? email;
  String? password;

  UserModel({this.userId, this.fullName, this.email, this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["userId"],
        fullName: json["fullName"],
        password: json["password"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "fullName": fullName,
        "password": password,
        "email": email,
      };
}

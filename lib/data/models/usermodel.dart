import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? userId;
  String? fullName;
  String? email;
  String? password;
  String? state;
  String? photoUrl;
  String? city;

  UserModel({this.userId, this.fullName, this.email, this.password,this.state,this.photoUrl,this.city});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["userId"],
        fullName: json["fullName"],
        password: json["password"],
        email: json["email"],
    state: json["state"],
    photoUrl: json["photoUrl"],
    city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "fullName": fullName,
        "password": password,
        "email": email,
    "state": state,
    "photoUrl": photoUrl,
    "city": city,
      };
}

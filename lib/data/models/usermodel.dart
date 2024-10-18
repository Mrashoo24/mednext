import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? userId;
  String? fullName;
  String? email;
  String? password;
  String? state;
  String? photoUrl;
  String? city;
  List<Map<String,dynamic>>? registeredCourses;

  UserModel({this.userId, this.fullName, this.email, this.password,this.state,this.photoUrl,this.city,this.registeredCourses});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["userId"],
        fullName: json["fullName"],
        password: json["password"],
        email: json["email"],
    state: json["state"],
    photoUrl: json["photoUrl"],
    city: json["city"],
      registeredCourses:List<Map<String,dynamic>>.from(json["registeredCourses"].map((e) => e).toList()) ?? []
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "fullName": fullName,
        "password": password,
        "email": email,
    "state": state,
    "photoUrl": photoUrl,
    "city": city,
    "registeredCourses" : registeredCourses ?? []
      };

  // CopyWith method
  UserModel copyWith({
    String? userId,
    String? fullName,
    String? email,
    String? password,
    String? state,
    String? photoUrl,
    String? city,
    List<Map<String,dynamic>>? registeredCourses,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      state: state ?? this.state,
      photoUrl: photoUrl ?? this.photoUrl,
      city: city ?? this.city,
      registeredCourses: registeredCourses ?? this.registeredCourses,
    );
  }
}

// To parse this JSON data, do
//
//     final loginBody = loginBodyFromJson(jsonString);

import 'dart:convert';

LoginBody loginBodyFromJson(String str) => LoginBody.fromJson(json.decode(str));

String loginBodyToJson(LoginBody data) => json.encode(data.toJson());

class LoginBody {
  String? mobileNumber;
  String? password;

  LoginBody({
    this.mobileNumber,
    this.password,
  });

  factory LoginBody.fromJson(Map<String, dynamic> json) => LoginBody(
        mobileNumber: json["mobile_number"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "mobile_number": mobileNumber,
        "password": password,
      };
}

// To parse this JSON data, do
//
//     final registerBody = registerBodyFromJson(jsonString);

import 'dart:convert';

RegisterBody registerBodyFromJson(String str) =>
    RegisterBody.fromJson(json.decode(str));

String registerBodyToJson(RegisterBody data) => json.encode(data.toJson());

class RegisterBody {
  String? name;
  String? mobileNumber;
  String? email;
  String? password;

  RegisterBody({
    this.name,
    this.mobileNumber,
    this.email,
    this.password,
  });

  factory RegisterBody.fromJson(Map<String, dynamic> json) => RegisterBody(
        name: json["name"],
        mobileNumber: json["mobile_number"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "mobile_number": mobileNumber,
        "email": email,
        "password": password,
      };
}

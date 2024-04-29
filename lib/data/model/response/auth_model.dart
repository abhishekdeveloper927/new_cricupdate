// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  String? status;
  Data? response;
  String? apiVersion;

  AuthModel({
    this.status,
    this.response,
    this.apiVersion,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      AuthModel(
        status: json["status"],
        response: json["response"] == null ? null : Data.fromJson(
            json["response"]),
        apiVersion: json["api_version"],
      );

  Map<String, dynamic> toJson() =>
      {
        "status": status,
        "response": response?.toJson(),
        "api_version": apiVersion,
      };
}

class Data {
  String? token;
  int? expires;

  Data({
    this.token,
    this.expires,
  });

  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(
        token: json["token"],
        expires: json["expires"],
      );

  Map<String, dynamic> toJson() =>
      {
        "token": token,
        "expires": expires,
      };
}

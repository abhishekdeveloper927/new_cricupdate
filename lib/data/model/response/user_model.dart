// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  dynamic fcmToken;
  String? roleId;
  String? mobileNumber;
  dynamic gender;
  String? address;
  dynamic authToken;
  dynamic verificationCode;
  dynamic image;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic interest;
  String? cmFirebaseToken;
  int? status;
  int? orderCount;
  dynamic loginMedium;
  dynamic socialId;
  dynamic deletedAt;
  String? latitude;
  String? longitude;
  dynamic passwordResetOtp;
  dynamic passwordResetOtpExpiry;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.fcmToken,
    this.roleId,
    this.mobileNumber,
    this.gender,
    this.address,
    this.authToken,
    this.verificationCode,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.interest,
    this.cmFirebaseToken,
    this.status,
    this.orderCount,
    this.loginMedium,
    this.socialId,
    this.deletedAt,
    this.latitude,
    this.longitude,
    this.passwordResetOtp,
    this.passwordResetOtpExpiry,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        fcmToken: json["fcm_token"],
        roleId: json["role_id"],
        mobileNumber: json["mobile_number"],
        gender: json["gender"],
        address: json["address"],
        authToken: json["auth_token"],
        verificationCode: json["verification_code"],
        image: json["image"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        interest: json["interest"],
        cmFirebaseToken: json["cm_firebase_token"],
        status: json["status"],
        orderCount: json["order_count"],
        loginMedium: json["login_medium"],
        socialId: json["social_id"],
        deletedAt: json["deleted_at"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        passwordResetOtp: json["password_reset_otp"],
        passwordResetOtpExpiry: json["password_reset_otp_expiry"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "fcm_token": fcmToken,
        "role_id": roleId,
        "mobile_number": mobileNumber,
        "gender": gender,
        "address": address,
        "auth_token": authToken,
        "verification_code": verificationCode,
        "image": image,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "interest": interest,
        "cm_firebase_token": cmFirebaseToken,
        "status": status,
        "order_count": orderCount,
        "login_medium": loginMedium,
        "social_id": socialId,
        "deleted_at": deletedAt,
        "latitude": latitude,
        "longitude": longitude,
        "password_reset_otp": passwordResetOtp,
        "password_reset_otp_expiry": passwordResetOtpExpiry,
      };
}

// To parse this JSON data, do
//
//     final activeSubscriptionModel = activeSubscriptionModelFromJson(jsonString);

import 'dart:convert';

import 'package:cricupdate/data/model/response/subscription_model.dart';

ActiveSubscriptionModel activeSubscriptionModelFromJson(String str) =>
    ActiveSubscriptionModel.fromJson(json.decode(str));

String activeSubscriptionModelToJson(ActiveSubscriptionModel data) =>
    json.encode(data.toJson());

class ActiveSubscriptionModel {
  Subscription? subscription;
  User? user;
  SubscriptionModel? subscriptionPlan;

  ActiveSubscriptionModel({
    this.subscription,
    this.user,
    this.subscriptionPlan,
  });

  factory ActiveSubscriptionModel.fromJson(Map<String, dynamic> json) =>
      ActiveSubscriptionModel(
        subscription: json["subscription"] == null
            ? null
            : Subscription.fromJson(json["subscription"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        subscriptionPlan: json["subscription_plan"] == null
            ? null
            : SubscriptionModel.fromJson(json["subscription_plan"]),
      );

  Map<String, dynamic> toJson() => {
        "subscription": subscription?.toJson(),
        "user": user?.toJson(),
        "subscription_plan": subscriptionPlan?.toJson(),
      };
}

class Subscription {
  int? id;
  int? userId;
  int? subscriptionPlanId;
  DateTime? startDate;
  DateTime? expiryDate;
  DateTime? createdAt;
  DateTime? updatedAt;

  Subscription({
    this.id,
    this.userId,
    this.subscriptionPlanId,
    this.startDate,
    this.expiryDate,
    this.createdAt,
    this.updatedAt,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json["id"],
        userId: json["user_id"],
        subscriptionPlanId: json["subscription_plan_id"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        expiryDate: json["expiry_date"] == null
            ? null
            : DateTime.parse(json["expiry_date"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "subscription_plan_id": subscriptionPlanId,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "expiry_date":
            "${expiryDate!.year.toString().padLeft(4, '0')}-${expiryDate!.month.toString().padLeft(2, '0')}-${expiryDate!.day.toString().padLeft(2, '0')}",
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class User {
  int? id;
  String? name;
  String? email;

  User({
    this.id,
    this.name,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
      };
}

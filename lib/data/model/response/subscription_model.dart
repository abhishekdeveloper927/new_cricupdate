// To parse this JSON data, do
//
//     final subscriptionModel = subscriptionModelFromJson(jsonString);

import 'dart:convert';

List<SubscriptionModel> subscriptionModelFromJson(String str) =>
    List<SubscriptionModel>.from(
        json.decode(str).map((x) => SubscriptionModel.fromJson(x)));

String subscriptionModelToJson(List<SubscriptionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubscriptionModel {
  int? id;
  String? name;
  String? description;
  String? price;
  int? duration;
  DateTime? createdAt;
  DateTime? updatedAt;

  SubscriptionModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.duration,
    this.createdAt,
    this.updatedAt,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      SubscriptionModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        duration: json["duration"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "duration": duration,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

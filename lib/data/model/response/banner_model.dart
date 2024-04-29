// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

List<BannerModel> bannerModelFromJson(String str) => List<BannerModel>.from(
    json.decode(str).map((x) => BannerModel.fromJson(x)));

String bannerModelToJson(List<BannerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BannerModel {
  int? id;
  String? image;
  String? link;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  BannerModel({
    this.id,
    this.image,
    this.link,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json["id"],
        image: json["image"],
        link: json["link"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "link": link,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

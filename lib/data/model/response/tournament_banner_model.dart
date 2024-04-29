// To parse this JSON data, do
//
//     final tournamentBannerModel = tournamentBannerModelFromJson(jsonString);

import 'dart:convert';

List<TournamentBannerModel> tournamentBannerModelFromJson(String str) =>
    List<TournamentBannerModel>.from(
        json.decode(str).map((x) => TournamentBannerModel.fromJson(x)));

String tournamentBannerModelToJson(List<TournamentBannerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TournamentBannerModel {
  int? id;
  String? image;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  TournamentBannerModel({
    this.id,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory TournamentBannerModel.fromJson(Map<String, dynamic> json) =>
      TournamentBannerModel(
        id: json["id"],
        image: json["image"],
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
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

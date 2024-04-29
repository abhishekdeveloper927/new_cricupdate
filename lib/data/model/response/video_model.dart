// To parse this JSON data, do
//
//     final videoModel = videoModelFromJson(jsonString);

import 'dart:convert';

List<VideoModel> videoModelFromJson(String str) =>
    List<VideoModel>.from(json.decode(str).map((x) => VideoModel.fromJson(x)));

String videoModelToJson(List<VideoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VideoModel {
  int? id;
  String? url;
  String? title;
  String? description;
  String? horizontalPoster;
  dynamic field1;
  dynamic field2;
  dynamic field3;
  DateTime? createdAt;
  DateTime? updatedAt;

  VideoModel({
    this.id,
    this.url,
    this.title,
    this.description,
    this.horizontalPoster,
    this.field1,
    this.field2,
    this.field3,
    this.createdAt,
    this.updatedAt,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        id: json["id"],
        url: json["url"],
        title: json["title"],
        description: json["description"],
        horizontalPoster: json["horizontal_poster"],
        field1: json["field1"],
        field2: json["field2"],
        field3: json["field3"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "title": title,
        "description": description,
        "horizontal_poster": horizontalPoster,
        "field1": field1,
        "field2": field2,
        "field3": field3,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

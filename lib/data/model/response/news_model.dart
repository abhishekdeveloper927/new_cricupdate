// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

List<NewsModel> newsModelFromJson(String str) =>
    List<NewsModel>.from(json.decode(str).map((x) => NewsModel.fromJson(x)));

String newsModelToJson(List<NewsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsModel {
  int? id;
  String? title;
  String? description;
  dynamic field;
  int? mainCategoryId;
  List<String>? images;
  DateTime? createdAt;
  DateTime? updatedAt;

  NewsModel({
    this.id,
    this.title,
    this.description,
    this.field,
    this.mainCategoryId,
    this.images,
    this.createdAt,
    this.updatedAt,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        field: json["field"],
        mainCategoryId: json["main_category_id"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "field": field,
        "main_category_id": mainCategoryId,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

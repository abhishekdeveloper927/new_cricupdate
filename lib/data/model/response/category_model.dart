// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) =>
    List<CategoryModel>.from(
        json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  int? id;
  String? name;
  String? image;
  int? parentId;
  dynamic position;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? priority;

  CategoryModel({
    this.id,
    this.name,
    this.image,
    this.parentId,
    this.position,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.priority,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        parentId: json["parent_id"],
        position: json["position"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        priority: json["priority"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "parent_id": parentId,
        "position": position,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "priority": priority,
      };
}

// To parse this JSON data, do
//
//     final photosModel = photosModelFromJson(jsonString);

import 'dart:convert';

List<PhotosModel> photosModelFromJson(String str) => List<PhotosModel>.from(
    json.decode(str).map((x) => PhotosModel.fromJson(x)));

String photosModelToJson(List<PhotosModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotosModel {
  int? id;
  String? image;
  int? parentId;
  DateTime? createdAt;
  DateTime? updatedAt;

  PhotosModel({
    this.id,
    this.image,
    this.parentId,
    this.createdAt,
    this.updatedAt,
  });

  factory PhotosModel.fromJson(Map<String, dynamic> json) => PhotosModel(
        id: json["id"],
        image: json["image"],
        parentId: json["parent_id"],
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
        "parent_id": parentId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

// To parse this JSON data, do
//
//     final venuePage = venuePageFromJson(jsonString);

import 'dart:convert';

VenuePage venuePageFromJson(String str) => VenuePage.fromJson(json.decode(str));

String venuePageToJson(VenuePage data) => json.encode(data.toJson());

class VenuePage {
  VenueModel? data;

  VenuePage({
    this.data,
  });

  factory VenuePage.fromJson(Map<String, dynamic> json) => VenuePage(
        data: json["data"] == null ? null : VenueModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class VenueModel {
  String? resource;
  int? id;
  int? countryId;
  String? name;
  String? city;
  String? imagePath;
  int? capacity;
  bool? floodlight;
  DateTime? updatedAt;

  VenueModel({
    this.resource,
    this.id,
    this.countryId,
    this.name,
    this.city,
    this.imagePath,
    this.capacity,
    this.floodlight,
    this.updatedAt,
  });

  factory VenueModel.fromJson(Map<String, dynamic> json) => VenueModel(
        resource: json["resource"],
        id: json["id"],
        countryId: json["country_id"],
        name: json["name"],
        city: json["city"],
        imagePath: json["image_path"],
        capacity: json["capacity"],
        floodlight: json["floodlight"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "resource": resource,
        "id": id,
        "country_id": countryId,
        "name": name,
        "city": city,
        "image_path": imagePath,
        "capacity": capacity,
        "floodlight": floodlight,
        "updated_at": updatedAt?.toIso8601String(),
  };
}

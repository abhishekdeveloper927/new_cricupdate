// To parse this JSON data, do
//
//     final teamPage = teamPageFromJson(jsonString);

import 'dart:convert';

TeamPage teamPageFromJson(String str) => TeamPage.fromJson(json.decode(str));

String teamPageToJson(TeamPage data) => json.encode(data.toJson());

class TeamPage {
  String? status;
  Data? response;
  String? etag;
  DateTime? modified;
  DateTime? datetime;
  String? apiVersion;

  TeamPage({
    this.status,
    this.response,
    this.etag,
    this.modified,
    this.datetime,
    this.apiVersion,
  });

  factory TeamPage.fromJson(Map<String, dynamic> json) => TeamPage(
        status: json["status"],
        response:
            json["response"] == null ? null : Data.fromJson(json["response"]),
        etag: json["etag"],
        modified:
            json["modified"] == null ? null : DateTime.parse(json["modified"]),
        datetime:
            json["datetime"] == null ? null : DateTime.parse(json["datetime"]),
        apiVersion: json["api_version"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response": response?.toJson(),
        "etag": etag,
        "modified": modified?.toIso8601String(),
        "datetime": datetime?.toIso8601String(),
        "api_version": apiVersion,
      };
}

class Data {
  List<TeamModel>? items;
  String? totalItems;
  int? totalPages;

  Data({
    this.items,
    this.totalItems,
    this.totalPages,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        items: json["items"] == null
            ? []
            : List<TeamModel>.from(
                json["items"]!.map((x) => TeamModel.fromJson(x))),
        totalItems: json["total_items"],
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "total_items": totalItems,
        "total_pages": totalPages,
      };
}

class TeamModel {
  int? tid;
  String? title;
  String? abbr;
  String? altName;
  String? type;
  String? thumbUrl;
  String? logoUrl;
  String? country;
  String? sex;
  String? matchesUrl;

  TeamModel({
    this.tid,
    this.title,
    this.abbr,
    this.altName,
    this.type,
    this.thumbUrl,
    this.logoUrl,
    this.country,
    this.sex,
    this.matchesUrl,
  });

  factory TeamModel.fromJson(Map<String, dynamic> json) => TeamModel(
        tid: json["tid"],
        title: json["title"],
        abbr: json["abbr"],
        altName: json["alt_name"],
        type: json["type"],
        thumbUrl: json["thumb_url"],
        logoUrl: json["logo_url"],
        country: json["country"],
        sex: json["sex"],
        matchesUrl: json["matches_url"],
      );

  Map<String, dynamic> toJson() => {
        "tid": tid,
        "title": title,
        "abbr": abbr,
        "alt_name": altName,
        "type": type,
        "thumb_url": thumbUrl,
        "logo_url": logoUrl,
        "country": country,
        "sex": sex,
        "matches_url": matchesUrl,
      };
}

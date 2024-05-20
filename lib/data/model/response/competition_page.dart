// To parse this JSON data, do
//
//     final competitionPage = competitionPageFromJson(jsonString);

import 'dart:convert';

CompetitionPage competitionPageFromJson(String str) =>
    CompetitionPage.fromJson(json.decode(str));

String competitionPageToJson(CompetitionPage data) =>
    json.encode(data.toJson());

class CompetitionPage {
  String? status;
  Data? response;
  String? etag;
  DateTime? modified;
  DateTime? datetime;
  String? apiVersion;

  CompetitionPage({
    this.status,
    this.response,
    this.etag,
    this.modified,
    this.datetime,
    this.apiVersion,
  });

  factory CompetitionPage.fromJson(Map<String, dynamic> json) =>
      CompetitionPage(
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
  List<CompetitionModel>? items;
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
            : List<CompetitionModel>.from(
                json["items"]!.map((x) => CompetitionModel.fromJson(x))),
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

class CompetitionModel {
  int? cid;
  String? title;
  String? abbr;
  String? category;
  String? status;
  String? gameFormat;
  String? matchFormat;
  String? season;
  DateTime? datestart;
  DateTime? dateend;
  String? country;
  String? totalMatches;
  String? totalRounds;
  String? totalTeams;

  CompetitionModel({
    this.cid,
    this.title,
    this.abbr,
    this.category,
    this.status,
    this.gameFormat,
    this.matchFormat,
    this.season,
    this.datestart,
    this.dateend,
    this.country,
    this.totalMatches,
    this.totalRounds,
    this.totalTeams,
  });

  factory CompetitionModel.fromJson(Map<String, dynamic> json) =>
      CompetitionModel(
        cid: json["cid"],
        title: json["title"],
        abbr: json["abbr"],
        category: json["category"],
        status: json["status"],
        gameFormat: json["match_format"],
        season: json["season"],
        datestart: json["datestart"] == null
            ? null
            : DateTime.parse(json["datestart"]),
        dateend:
            json["dateend"] == null ? null : DateTime.parse(json["dateend"]),
        country: json["country"],
        totalMatches: json["total_matches"],
        totalRounds: json["total_rounds"],
        totalTeams: json["total_teams"],
      );

  Map<String, dynamic> toJson() => {
        "cid": cid,
        "title": title,
        "abbr": abbr,
        "category": category,
        "status": status,
        "match_format": gameFormat,
        "season": season,
        "datestart":
            "${datestart!.year.toString().padLeft(4, '0')}-${datestart!.month.toString().padLeft(2, '0')}-${datestart!.day.toString().padLeft(2, '0')}",
        "dateend":
            "${dateend!.year.toString().padLeft(4, '0')}-${dateend!.month.toString().padLeft(2, '0')}-${dateend!.day.toString().padLeft(2, '0')}",
        "country": country,
        "total_matches": totalMatches,
        "total_rounds": totalRounds,
        "total_teams": totalTeams,
      };
}

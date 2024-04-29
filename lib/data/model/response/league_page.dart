// To parse this JSON data, do
//
//     final leaguePage = leaguePageFromJson(jsonString);

import 'dart:convert';

LeaguePage leaguePageFromJson(String str) =>
    LeaguePage.fromJson(json.decode(str));

String leaguePageToJson(LeaguePage data) => json.encode(data.toJson());

class LeaguePage {
  List<LeagueModel> data = [];

  LeaguePage({
    required this.data,
  });

  factory LeaguePage.fromJson(Map<String, dynamic> json) => LeaguePage(
        data: json["data"] == null
            ? []
            : List<LeagueModel>.from(
                json["data"]!.map((x) => LeagueModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data":
            data.isEmpty ? [] : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class LeagueModel {
  Resource? resource;
  int? id;
  int? seasonId;
  int? countryId;
  String? name;
  String? code;
  String? imagePath;
  Type? type;
  DateTime? updatedAt;

  LeagueModel({
    this.resource,
    this.id,
    this.seasonId,
    this.countryId,
    this.name,
    this.code,
    this.imagePath,
    this.type,
    this.updatedAt,
  });

  factory LeagueModel.fromJson(Map<String, dynamic> json) => LeagueModel(
        resource: resourceValues.map[json["resource"]]!,
        id: json["id"],
        seasonId: json["season_id"],
        countryId: json["country_id"],
        name: json["name"],
        code: json["code"],
        imagePath: json["image_path"],
        type: typeValues.map[json["type"]]!,
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "resource": resourceValues.reverse[resource],
        "id": id,
        "season_id": seasonId,
        "country_id": countryId,
        "name": name,
        "code": code,
        "image_path": imagePath,
        "type": typeValues.reverse[type],
        "updated_at": updatedAt?.toIso8601String(),
      };
}

enum Resource { LEAGUES }

final resourceValues = EnumValues({"leagues": Resource.LEAGUES});

enum Type { LEAGUE, PHASE }

final typeValues = EnumValues({"league": Type.LEAGUE, "phase": Type.PHASE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

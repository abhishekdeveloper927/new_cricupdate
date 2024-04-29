// To parse this JSON data, do
//
//     final teamSquadPage = teamSquadPageFromJson(jsonString);

import 'dart:convert';

import 'match_details_page.dart';

TeamSquadPage teamSquadPageFromJson(String str) =>
    TeamSquadPage.fromJson(json.decode(str));

String teamSquadPageToJson(TeamSquadPage data) => json.encode(data.toJson());

class TeamSquadPage {
  String? status;
  TeamSquadModel? response;
  String? etag;
  DateTime? modified;
  DateTime? datetime;
  String? apiVersion;

  TeamSquadPage({
    this.status,
    this.response,
    this.etag,
    this.modified,
    this.datetime,
    this.apiVersion,
  });

  factory TeamSquadPage.fromJson(Map<String, dynamic> json) => TeamSquadPage(
        status: json["status"],
        response: json["response"] == null
            ? null
            : TeamSquadModel.fromJson(json["response"]),
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

class TeamSquadModel {
  TeamaClass? teama;
  TeamaClass? teamb;
  List<TeamElement>? teams;
  List<Player>? players;

  TeamSquadModel({
    this.teama,
    this.teamb,
    this.teams,
    this.players,
  });

  factory TeamSquadModel.fromJson(Map<String, dynamic> json) => TeamSquadModel(
        teama:
            json["teama"] == null ? null : TeamaClass.fromJson(json["teama"]),
        teamb:
            json["teamb"] == null ? null : TeamaClass.fromJson(json["teamb"]),
        teams: json["teams"] == null
            ? []
            : List<TeamElement>.from(
                json["teams"]!.map((x) => TeamElement.fromJson(x))),
        players: json["players"] == null
            ? []
            : List<Player>.from(
                json["players"]!.map((x) => Player.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "teama": teama?.toJson(),
        "teamb": teamb?.toJson(),
        "teams": teams == null
            ? []
            : List<dynamic>.from(teams!.map((x) => x.toJson())),
        "players": players == null
            ? []
            : List<dynamic>.from(players!.map((x) => x.toJson())),
      };
}

enum BattingStyle { EMPTY, LEFT_HAND_BAT, RIGHT_HAND_BAT }

final battingStyleValues = EnumValues({
  "": BattingStyle.EMPTY,
  "Left hand Bat": BattingStyle.LEFT_HAND_BAT,
  "Right Hand Bat": BattingStyle.RIGHT_HAND_BAT
});

enum Birthplace { BHEEMDATT_KANCHANPUR, EMPTY }

final birthplaceValues = EnumValues({
  "Bheemdatt, Kanchanpur": Birthplace.BHEEMDATT_KANCHANPUR,
  "": Birthplace.EMPTY
});

enum Country { INT, MY, NP }

final countryValues =
    EnumValues({"int": Country.INT, "my": Country.MY, "np": Country.NP});

enum Nationality { INTERNATIONAL, MALAYSIA, NEPAL }

final nationalityValues = EnumValues({
  "International": Nationality.INTERNATIONAL,
  "Malaysia": Nationality.MALAYSIA,
  "Nepal": Nationality.NEPAL
});

enum Role { ALL, BAT, BOWL, WK }

final roleValues = EnumValues(
    {"all": Role.ALL, "bat": Role.BAT, "bowl": Role.BOWL, "wk": Role.WK});

class TeamaClass {
  int? teamId;
  List<Squad>? squads;

  TeamaClass({
    this.teamId,
    this.squads,
  });

  factory TeamaClass.fromJson(Map<String, dynamic> json) => TeamaClass(
        teamId: json["team_id"],
        squads: json["squads"] == null
            ? []
            : List<Squad>.from(json["squads"]!.map((x) => Squad.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "team_id": teamId,
        "squads": squads == null
            ? []
            : List<dynamic>.from(squads!.map((x) => x.toJson())),
      };
}

class Squad {
  String? playerId;
  String? substitute;
  String? out;
  String? squadIn;
  String? roleStr;
  String? role;
  String? playing11;
  String? name;

  Squad({
    this.playerId,
    this.substitute,
    this.out,
    this.squadIn,
    this.roleStr,
    this.role,
    this.playing11,
    this.name,
  });

  factory Squad.fromJson(Map<String, dynamic> json) => Squad(
        playerId: json["player_id"],
        substitute: json["substitute"],
        out: json["out"],
        squadIn: json["in"],
        roleStr: json["role_str"],
        role: json["role"],
        playing11: json["playing11"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "player_id": playerId,
        "substitute": substitute,
        "out": out,
        "in": squadIn,
        "role_str": roleStr,
        "role": role,
        "playing11": playing11,
        "name": name,
      };
}

enum RoleStr { C, EMPTY, WK }

final roleStrValues =
    EnumValues({"(C)": RoleStr.C, "": RoleStr.EMPTY, "(WK)": RoleStr.WK});

class TeamElement {
  int? tid;
  String? title;
  String? abbr;
  String? altName;
  String? type;
  String? thumbUrl;
  String? logoUrl;
  String? country;
  String? sex;

  TeamElement({
    this.tid,
    this.title,
    this.abbr,
    this.altName,
    this.type,
    this.thumbUrl,
    this.logoUrl,
    this.country,
    this.sex,
  });

  factory TeamElement.fromJson(Map<String, dynamic> json) => TeamElement(
        tid: json["tid"],
        title: json["title"],
        abbr: json["abbr"],
        altName: json["alt_name"],
        type: json["type"],
        thumbUrl: json["thumb_url"],
        logoUrl: json["logo_url"],
        country: json["country"],
        sex: json["sex"],
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
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

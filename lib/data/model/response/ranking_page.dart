// To parse this JSON data, do
//
//     final rankingPage = rankingPageFromJson(jsonString);

import 'dart:convert';

RankingPage rankingPageFromJson(String str) =>
    RankingPage.fromJson(json.decode(str));

String rankingPageToJson(RankingPage data) => json.encode(data.toJson());

class RankingPage {
  String? status;
  RankingModel? response;
  String? etag;
  DateTime? modified;
  DateTime? datetime;
  String? apiVersion;

  RankingPage({
    this.status,
    this.response,
    this.etag,
    this.modified,
    this.datetime,
    this.apiVersion,
  });

  factory RankingPage.fromJson(Map<String, dynamic> json) =>
      RankingPage(
        status: json["status"],
        response: json["response"] == null
            ? null
            : RankingModel.fromJson(json["response"]),
        etag: json["etag"],
        modified:
        json["modified"] == null ? null : DateTime.parse(json["modified"]),
        datetime:
        json["datetime"] == null ? null : DateTime.parse(json["datetime"]),
        apiVersion: json["api_version"],
      );

  Map<String, dynamic> toJson() =>
      {
        "status": status,
        "response": response?.toJson(),
        "etag": etag,
        "modified": modified?.toIso8601String(),
        "datetime": datetime?.toIso8601String(),
        "api_version": apiVersion,
      };
}

class RankingModel {
  Ranks? ranks;
  WomenRanks? womenRanks;
  Groups? groups;
  Formats? formats;

  RankingModel({
    this.ranks,
    this.womenRanks,
    this.groups,
    this.formats,
  });

  factory RankingModel.fromJson(Map<String, dynamic> json) =>
      RankingModel(
        ranks: json["ranks"] == null ? null : Ranks.fromJson(json["ranks"]),
        womenRanks: json["women_ranks"] == null
            ? null
            : WomenRanks.fromJson(json["women_ranks"]),
        groups: json["groups"] == null ? null : Groups.fromJson(json["groups"]),
        formats:
        json["formats"] == null ? null : Formats.fromJson(json["formats"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "ranks": ranks?.toJson(),
        "women_ranks": womenRanks?.toJson(),
        "groups": groups?.toJson(),
        "formats": formats?.toJson(),
      };
}

class Formats {
  String? tests;
  String? odis;
  String? t20S;

  Formats({
    this.tests,
    this.odis,
    this.t20S,
  });

  factory Formats.fromJson(Map<String, dynamic> json) =>
      Formats(
        tests: json["tests"],
        odis: json["odis"],
        t20S: json["t20s"],
      );

  Map<String, dynamic> toJson() =>
      {
        "tests": tests,
        "odis": odis,
        "t20s": t20S,
      };
}

class Groups {
  String? teams;
  String? batsmen;
  String? bowlers;
  String? allRounders;

  Groups({
    this.teams,
    this.batsmen,
    this.bowlers,
    this.allRounders,
  });

  factory Groups.fromJson(Map<String, dynamic> json) =>
      Groups(
        teams: json["teams"],
        batsmen: json["batsmen"],
        bowlers: json["bowlers"],
        allRounders: json["all-rounders"],
      );

  Map<String, dynamic> toJson() =>
      {
        "teams": teams,
        "batsmen": batsmen,
        "bowlers": bowlers,
        "all-rounders": allRounders,
      };
}

class Ranks {
  RanksAllRounders? batsmen;
  RanksAllRounders? bowlers;
  RanksAllRounders? allRounders;
  RanksTeams? teams;

  Ranks({
    this.batsmen,
    this.bowlers,
    this.allRounders,
    this.teams,
  });

  factory Ranks.fromJson(Map<String, dynamic> json) =>
      Ranks(
        batsmen: json["batsmen"] == null
            ? null
            : RanksAllRounders.fromJson(json["batsmen"]),
        bowlers: json["bowlers"] == null
            ? null
            : RanksAllRounders.fromJson(json["bowlers"]),
        allRounders: json["all-rounders"] == null
            ? null
            : RanksAllRounders.fromJson(json["all-rounders"]),
        teams:
        json["teams"] == null ? null : RanksTeams.fromJson(json["teams"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "batsmen": batsmen?.toJson(),
        "bowlers": bowlers?.toJson(),
        "all-rounders": allRounders?.toJson(),
        "teams": teams?.toJson(),
      };
}

class RanksAllRounders {
  List<AllRoundersOdi>? odis;
  List<AllRoundersOdi>? tests;
  List<AllRoundersOdi>? t20S;

  RanksAllRounders({
    this.odis,
    this.tests,
    this.t20S,
  });

  factory RanksAllRounders.fromJson(Map<String, dynamic> json) =>
      RanksAllRounders(
        odis: json["odis"] == null
            ? []
            : List<AllRoundersOdi>.from(
            json["odis"]!.map((x) => AllRoundersOdi.fromJson(x))),
        tests: json["tests"] == null
            ? []
            : List<AllRoundersOdi>.from(
            json["tests"]!.map((x) => AllRoundersOdi.fromJson(x))),
        t20S: json["t20s"] == null
            ? []
            : List<AllRoundersOdi>.from(
            json["t20s"]!.map((x) => AllRoundersOdi.fromJson(x))),
      );

  Map<String, dynamic> toJson() =>
      {
        "odis": odis == null
            ? []
            : List<dynamic>.from(odis!.map((x) => x.toJson())),
        "tests": tests == null
            ? []
            : List<dynamic>.from(tests!.map((x) => x.toJson())),
        "t20s": t20S == null
            ? []
            : List<dynamic>.from(t20S!.map((x) => x.toJson())),
      };
}

class AllRoundersOdi {
  String? rank;
  String? pid;
  String? player;
  String? team;
  String? rating;
  String? careerbestrating;

  AllRoundersOdi({
    this.rank,
    this.pid,
    this.player,
    this.team,
    this.rating,
    this.careerbestrating,
  });

  factory AllRoundersOdi.fromJson(Map<String, dynamic> json) =>
      AllRoundersOdi(
        rank: json["rank"],
        pid: json["pid"],
        player: json["player"],
        team: json["team"],
        rating: json["rating"],
        careerbestrating: json["careerbestrating"],
      );

  Map<String, dynamic> toJson() =>
      {
        "rank": rank,
        "pid": pid,
        "player": player,
        "team": team,
        "rating": rating,
        "careerbestrating": careerbestrating,
      };
}

enum Team {
  AFG,
  AUS,
  BAN,
  ENG,
  GUY,
  IND,
  IRE,
  NAM,
  NED,
  NEP,
  NZ,
  OMN,
  PAK,
  PNG,
  ROM,
  SA,
  SCO,
  SL,
  THA,
  UAE,
  USA,
  WI,
  ZIM
}

final teamValues = EnumValues({
  "AFG": Team.AFG,
  "AUS": Team.AUS,
  "BAN": Team.BAN,
  "ENG": Team.ENG,
  "GUY": Team.GUY,
  "IND": Team.IND,
  "IRE": Team.IRE,
  "NAM": Team.NAM,
  "NED": Team.NED,
  "NEP": Team.NEP,
  "NZ": Team.NZ,
  "OMN": Team.OMN,
  "PAK": Team.PAK,
  "PNG": Team.PNG,
  "ROM": Team.ROM,
  "SA": Team.SA,
  "SCO": Team.SCO,
  "SL": Team.SL,
  "THA": Team.THA,
  "UAE": Team.UAE,
  "USA": Team.USA,
  "WI": Team.WI,
  "ZIM": Team.ZIM
});

class RanksTeams {
  List<TeamsOdi>? odis;
  List<TeamsOdi>? tests;
  List<TeamsOdi>? t20S;

  RanksTeams({
    this.odis,
    this.tests,
    this.t20S,
  });

  factory RanksTeams.fromJson(Map<String, dynamic> json) =>
      RanksTeams(
        odis: json["odis"] == null
            ? []
            : List<TeamsOdi>.from(
            json["odis"]!.map((x) => TeamsOdi.fromJson(x))),
        tests: json["tests"] == null
            ? []
            : List<TeamsOdi>.from(
            json["tests"]!.map((x) => TeamsOdi.fromJson(x))),
        t20S: json["t20s"] == null
            ? []
            : List<TeamsOdi>.from(
            json["t20s"]!.map((x) => TeamsOdi.fromJson(x))),
      );

  Map<String, dynamic> toJson() =>
      {
        "odis": odis == null
            ? []
            : List<dynamic>.from(odis!.map((x) => x.toJson())),
        "tests": tests == null
            ? []
            : List<dynamic>.from(tests!.map((x) => x.toJson())),
        "t20s": t20S == null
            ? []
            : List<dynamic>.from(t20S!.map((x) => x.toJson())),
      };
}

class TeamsOdi {
  String? rank;
  String? tid;
  String? team;
  String? points;
  String? rating;
  String? logoUrl;
  String? matches;

  TeamsOdi({
    this.rank,
    this.tid,
    this.team,
    this.points,
    this.rating,
    this.logoUrl,
    this.matches,
  });

  factory TeamsOdi.fromJson(Map<String, dynamic> json) =>
      TeamsOdi(
        rank: json["rank"],
        tid: json["tid"],
        team: json["team"],
        points: json["points"],
        rating: json["rating"],
        logoUrl: json["logo_url"],
        matches: json["matches"],
      );

  Map<String, dynamic> toJson() =>
      {
        "rank": rank,
        "tid": tid,
        "team": team,
        "points": points,
        "rating": rating,
        "logo_url": logoUrl,
        "matches": matches,
      };
}

class WomenRanks {
  WomenRanksAllRounders? batsmen;
  WomenRanksAllRounders? bowlers;
  WomenRanksAllRounders? allRounders;
  WomenRanksTeams? teams;

  WomenRanks({
    this.batsmen,
    this.bowlers,
    this.allRounders,
    this.teams,
  });

  factory WomenRanks.fromJson(Map<String, dynamic> json) =>
      WomenRanks(
        batsmen: json["batsmen"] == null
            ? null
            : WomenRanksAllRounders.fromJson(json["batsmen"]),
        bowlers: json["bowlers"] == null
            ? null
            : WomenRanksAllRounders.fromJson(json["bowlers"]),
        allRounders: json["all-rounders"] == null
            ? null
            : WomenRanksAllRounders.fromJson(json["all-rounders"]),
        teams: json["teams"] == null
            ? null
            : WomenRanksTeams.fromJson(json["teams"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "batsmen": batsmen?.toJson(),
        "bowlers": bowlers?.toJson(),
        "all-rounders": allRounders?.toJson(),
        "teams": teams?.toJson(),
      };
}

class WomenRanksAllRounders {
  List<AllRoundersOdi>? odis;
  List<AllRoundersOdi>? t20S;

  WomenRanksAllRounders({
    this.odis,
    this.t20S,
  });

  factory WomenRanksAllRounders.fromJson(Map<String, dynamic> json) =>
      WomenRanksAllRounders(
        odis: json["odis"] == null
            ? []
            : List<AllRoundersOdi>.from(
            json["odis"]!.map((x) => AllRoundersOdi.fromJson(x))),
        t20S: json["t20s"] == null
            ? []
            : List<AllRoundersOdi>.from(
            json["t20s"]!.map((x) => AllRoundersOdi.fromJson(x))),
      );

  Map<String, dynamic> toJson() =>
      {
        "odis": odis == null
            ? []
            : List<dynamic>.from(odis!.map((x) => x.toJson())),
        "t20s": t20S == null
            ? []
            : List<dynamic>.from(t20S!.map((x) => x.toJson())),
      };
}

class WomenRanksTeams {
  List<TeamsOdi>? odis;
  List<TeamsOdi>? t20S;

  WomenRanksTeams({
    this.odis,
    this.t20S,
  });

  factory WomenRanksTeams.fromJson(Map<String, dynamic> json) =>
      WomenRanksTeams(
        odis: json["odis"] == null
            ? []
            : List<TeamsOdi>.from(
            json["odis"]!.map((x) => TeamsOdi.fromJson(x))),
        t20S: json["t20s"] == null
            ? []
            : List<TeamsOdi>.from(
            json["t20s"]!.map((x) => TeamsOdi.fromJson(x))),
      );

  Map<String, dynamic> toJson() =>
      {
        "odis": odis == null
            ? []
            : List<dynamic>.from(odis!.map((x) => x.toJson())),
        "t20s": t20S == null
            ? []
            : List<dynamic>.from(t20S!.map((x) => x.toJson())),
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

// To parse this JSON data, do
//
//     final competitionInfoPage = competitionInfoPageFromJson(jsonString);

import 'dart:convert';

import 'package:cricupdate/data/model/response/team_page.dart';

CompetitionInfoPage competitionInfoPageFromJson(String str) =>
    CompetitionInfoPage.fromJson(json.decode(str));

String competitionInfoPageToJson(CompetitionInfoPage data) =>
    json.encode(data.toJson());

class CompetitionInfoPage {
  String? status;
  CompetitionInfoModel? response;
  String? etag;
  DateTime? modified;
  DateTime? datetime;
  String? apiVersion;

  CompetitionInfoPage({
    this.status,
    this.response,
    this.etag,
    this.modified,
    this.datetime,
    this.apiVersion,
  });

  factory CompetitionInfoPage.fromJson(Map<String, dynamic> json) =>
      CompetitionInfoPage(
        status: json["status"],
        response: json["response"] == null
            ? null
            : CompetitionInfoModel.fromJson(json["response"]),
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

class CompetitionInfoModel {
  int? cid;
  String? title;
  String? abbr;
  String? type;
  String? category;
  String? gameFormat;
  String? status;
  String? season;
  DateTime? datestart;
  DateTime? dateend;
  String? country;
  String? totalMatches;
  String? totalRounds;
  String? totalTeams;
  String? table;
  List<dynamic>? manOfTheSeries;
  List<RoundElement>? rounds;
  List<VenueList>? venueList;
  List<TeamModel>? teams;
  ResponseStanding? standing;

  CompetitionInfoModel({
    this.cid,
    this.title,
    this.abbr,
    this.type,
    this.category,
    this.gameFormat,
    this.status,
    this.season,
    this.datestart,
    this.dateend,
    this.country,
    this.totalMatches,
    this.totalRounds,
    this.totalTeams,
    this.table,
    this.manOfTheSeries,
    this.rounds,
    this.venueList,
    this.teams,
    this.standing,
  });

  factory CompetitionInfoModel.fromJson(Map<String, dynamic> json) =>
      CompetitionInfoModel(
        cid: json["cid"],
        title: json["title"],
        abbr: json["abbr"],
        type: json["type"],
        category: json["category"],
        gameFormat: json["game_format"],
        status: json["status"],
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
        table: json["table"],
        manOfTheSeries: json["man_of_the_series"] == null
            ? []
            : List<dynamic>.from(json["man_of_the_series"]!.map((x) => x)),
        rounds: json["rounds"] == null
            ? []
            : List<RoundElement>.from(
                json["rounds"]!.map((x) => RoundElement.fromJson(x))),
        venueList: json["venue_list"] == null
            ? []
            : List<VenueList>.from(
                json["venue_list"]!.map((x) => VenueList.fromJson(x))),
        teams: json["teams"] == null
            ? []
            : List<TeamModel>.from(
                json["teams"]!.map((x) => TeamModel.fromJson(x))),
        standing: json["standing"] == null
            ? null
            : ResponseStanding.fromJson(json["standing"]),
      );

  Map<String, dynamic> toJson() => {
        "cid": cid,
        "title": title,
        "abbr": abbr,
        "type": type,
        "category": category,
        "game_format": gameFormat,
        "status": status,
        "season": season,
        "datestart":
            "${datestart!.year.toString().padLeft(4, '0')}-${datestart!.month.toString().padLeft(2, '0')}-${datestart!.day.toString().padLeft(2, '0')}",
        "dateend":
            "${dateend!.year.toString().padLeft(4, '0')}-${dateend!.month.toString().padLeft(2, '0')}-${dateend!.day.toString().padLeft(2, '0')}",
        "country": country,
        "total_matches": totalMatches,
        "total_rounds": totalRounds,
        "total_teams": totalTeams,
        "table": table,
        "man_of_the_series": manOfTheSeries == null
            ? []
            : List<dynamic>.from(manOfTheSeries!.map((x) => x)),
        "rounds": rounds == null
            ? []
            : List<dynamic>.from(rounds!.map((x) => x.toJson())),
        "venue_list": venueList == null
            ? []
            : List<dynamic>.from(venueList!.map((x) => x.toJson())),
        "teams": teams == null
            ? []
            : List<dynamic>.from(teams!.map((x) => x.toJson())),
        "standing": standing?.toJson(),
      };
}

enum ResponseCountry { IN }

final responseCountryValues = EnumValues({"in": ResponseCountry.IN});

class RoundElement {
  int? rid;
  String? name;
  int? order;
  String? type;
  String? matchFormat;
  DateTime? datestart;
  DateTime? dateend;
  List<dynamic>? manOfTheSeries;
  String? matchesUrl;
  String? teamsUrl;

  RoundElement({
    this.rid,
    this.name,
    this.order,
    this.type,
    this.matchFormat,
    this.datestart,
    this.dateend,
    this.manOfTheSeries,
    this.matchesUrl,
    this.teamsUrl,
  });

  factory RoundElement.fromJson(Map<String, dynamic> json) => RoundElement(
        rid: json["rid"],
        name: json["name"],
        order: json["order"],
        type: json["type"],
        matchFormat: json["match_format"],
        datestart: json["datestart"] == null
            ? null
            : DateTime.parse(json["datestart"]),
        dateend:
            json["dateend"] == null ? null : DateTime.parse(json["dateend"]),
        manOfTheSeries: json["man_of_the_series"] == null
            ? []
            : List<dynamic>.from(json["man_of_the_series"]!.map((x) => x)),
        matchesUrl: json["matches_url"],
        teamsUrl: json["teams_url"],
      );

  Map<String, dynamic> toJson() => {
        "rid": rid,
        "name": name,
        "order": order,
        "type": type,
        "match_format": matchFormat,
        "datestart":
            "${datestart!.year.toString().padLeft(4, '0')}-${datestart!.month.toString().padLeft(2, '0')}-${datestart!.day.toString().padLeft(2, '0')}",
        "dateend":
            "${dateend!.year.toString().padLeft(4, '0')}-${dateend!.month.toString().padLeft(2, '0')}-${dateend!.day.toString().padLeft(2, '0')}",
        "man_of_the_series": manOfTheSeries == null
            ? []
            : List<dynamic>.from(manOfTheSeries!.map((x) => x)),
        "matches_url": matchesUrl,
        "teams_url": teamsUrl,
      };
}

class ResponseStanding {
  String? standingType;
  List<PurpleStanding>? standings;

  ResponseStanding({
    this.standingType,
    this.standings,
  });

  factory ResponseStanding.fromJson(Map<String, dynamic> json) =>
      ResponseStanding(
        standingType: json["standing_type"],
        standings: json["standings"] == null
            ? []
            : List<PurpleStanding>.from(
                json["standings"]!.map((x) => PurpleStanding.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "standing_type": standingType,
        "standings": standings == null
            ? []
            : List<dynamic>.from(standings!.map((x) => x.toJson())),
      };
}

class PurpleStanding {
  StandingRound? round;
  List<FluffyStanding>? standings;

  PurpleStanding({
    this.round,
    this.standings,
  });

  factory PurpleStanding.fromJson(Map<String, dynamic> json) => PurpleStanding(
        round: json["round"] == null
            ? null
            : StandingRound.fromJson(json["round"]),
        standings: json["standings"] == null
            ? []
            : List<FluffyStanding>.from(
                json["standings"]!.map((x) => FluffyStanding.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "round": round?.toJson(),
        "standings": standings == null
            ? []
            : List<dynamic>.from(standings!.map((x) => x.toJson())),
      };
}

class StandingRound {
  int? rid;
  int? order;
  String? name;
  String? type;
  String? matchFormat;
  DateTime? datestart;
  DateTime? dateend;

  StandingRound({
    this.rid,
    this.order,
    this.name,
    this.type,
    this.matchFormat,
    this.datestart,
    this.dateend,
  });

  factory StandingRound.fromJson(Map<String, dynamic> json) => StandingRound(
        rid: json["rid"],
        order: json["order"],
        name: json["name"],
        type: json["type"],
        matchFormat: json["match_format"],
        datestart: json["datestart"] == null
            ? null
            : DateTime.parse(json["datestart"]),
        dateend:
            json["dateend"] == null ? null : DateTime.parse(json["dateend"]),
      );

  Map<String, dynamic> toJson() => {
        "rid": rid,
        "order": order,
        "name": name,
        "type": type,
        "match_format": matchFormat,
        "datestart":
            "${datestart!.year.toString().padLeft(4, '0')}-${datestart!.month.toString().padLeft(2, '0')}-${datestart!.day.toString().padLeft(2, '0')}",
        "dateend":
            "${dateend!.year.toString().padLeft(4, '0')}-${dateend!.month.toString().padLeft(2, '0')}-${dateend!.day.toString().padLeft(2, '0')}",
      };
}

class FluffyStanding {
  String? teamId;
  String? played;
  String? win;
  String? loss;
  String? draw;
  String? nr;
  String? overfor;
  String? runfor;
  String? overagainst;
  String? runagainst;
  String? netrr;
  String? points;
  String? lastfivematch;
  String? lastfivematchresult;
  String? quality;
  TeamModel? team;

  FluffyStanding({
    this.teamId,
    this.played,
    this.win,
    this.loss,
    this.draw,
    this.nr,
    this.overfor,
    this.runfor,
    this.overagainst,
    this.runagainst,
    this.netrr,
    this.points,
    this.lastfivematch,
    this.lastfivematchresult,
    this.quality,
    this.team,
  });

  factory FluffyStanding.fromJson(Map<String, dynamic> json) => FluffyStanding(
        teamId: json["team_id"],
        played: json["played"],
        win: json["win"],
        loss: json["loss"],
        draw: json["draw"],
        nr: json["nr"],
        overfor: json["overfor"],
        runfor: json["runfor"],
        overagainst: json["overagainst"],
        runagainst: json["runagainst"],
        netrr: json["netrr"],
        points: json["points"],
        lastfivematch: json["lastfivematch"],
        lastfivematchresult: json["lastfivematchresult"],
        quality: json["quality"],
        team: json["team"] == null ? null : TeamModel.fromJson(json["team"]),
      );

  Map<String, dynamic> toJson() => {
        "team_id": teamId,
        "played": played,
        "win": win,
        "loss": loss,
        "draw": draw,
        "nr": nr,
        "overfor": overfor,
        "runfor": runfor,
        "overagainst": overagainst,
        "runagainst": runagainst,
        "netrr": netrr,
        "points": points,
        "lastfivematch": lastfivematch,
        "lastfivematchresult": lastfivematchresult,
        "quality": quality,
        "team": team?.toJson(),
      };
}

enum Sex { MALE }

final sexValues = EnumValues({"male": Sex.MALE});

enum Type { CLUB }

final typeValues = EnumValues({"club": Type.CLUB});

class VenueList {
  int? venueId;
  String? name;
  String? city;
  String? country;
  String? capacity;

  VenueList({
    this.venueId,
    this.name,
    this.city,
    this.country,
    this.capacity,
  });

  factory VenueList.fromJson(Map<String, dynamic> json) => VenueList(
        venueId: json["venue_id"],
        name: json["name"],
        city: json["city"],
        country: json["country"],
        capacity: json["capacity"],
      );

  Map<String, dynamic> toJson() => {
        "venue_id": venueId,
        "name": name,
        "city": city,
        "country": country,
        "capacity": capacity,
      };
}

enum VenueListCountry { INDIA }

final venueListCountryValues = EnumValues({"India": VenueListCountry.INDIA});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

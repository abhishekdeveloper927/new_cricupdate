// To parse this JSON data, do
//
//     final matchOddsPage = matchOddsPageFromJson(jsonString);

import 'dart:convert';

import 'package:cricupdate/data/model/response/match_info_page.dart';

MatchOddsPage matchOddsPageFromJson(String str) =>
    MatchOddsPage.fromJson(json.decode(str));

String matchOddsPageToJson(MatchOddsPage data) => json.encode(data.toJson());

class MatchOddsPage {
  String? status;
  MatchOddsModel? response;
  String? etag;
  DateTime? modified;
  DateTime? datetime;
  String? apiVersion;

  MatchOddsPage({
    this.status,
    this.response,
    this.etag,
    this.modified,
    this.datetime,
    this.apiVersion,
  });

  factory MatchOddsPage.fromJson(Map<String, dynamic> json) => MatchOddsPage(
        status: json["status"],
        response: json["response"] == null
            ? null
            : MatchOddsModel.fromJson(json["response"]),
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

class MatchOddsModel {
  MatchInfo? matchInfo;
  LiveOdds? liveOdds;
  List<SessionOdd>? sessionOdds;
  int? totalItems;
  int? totalPages;

  MatchOddsModel({
    this.matchInfo,
    this.liveOdds,
    this.sessionOdds,
    this.totalItems,
    this.totalPages,
  });

  factory MatchOddsModel.fromJson(Map<String, dynamic> json) => MatchOddsModel(
        matchInfo: json["match_info"] == null
            ? null
            : MatchInfo.fromJson(json["match_info"]),
        liveOdds: json["live_odds"] == null
            ? null
            : json["live_odds"] is List
                ? null
                : LiveOdds.fromJson(json["live_odds"]),
        sessionOdds: json["session_odds"] == null
            ? []
            : List<SessionOdd>.from(
                json["session_odds"]!.map((x) => SessionOdd.fromJson(x))),
        totalItems: json["total_items"],
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "match_info": matchInfo?.toJson(),
        "live_odds": liveOdds?.toJson(),
        "session_odds": sessionOdds == null
            ? []
            : List<dynamic>.from(sessionOdds!.map((x) => x.toJson())),
        "total_items": totalItems,
        "total_pages": totalPages,
      };
}

class LiveOdds {
  Bookmaker? matchodds;
  Bookmaker? tiedmatch;
  Bookmaker? bookmaker;

  LiveOdds({
    this.matchodds,
    this.tiedmatch,
    this.bookmaker,
  });

  factory LiveOdds.fromJson(Map<String, dynamic> json) => LiveOdds(
        matchodds: json["matchodds"] == null
            ? null
            : Bookmaker.fromJson(json["matchodds"]),
        tiedmatch: json["tiedmatch"] == null
            ? null
            : Bookmaker.fromJson(json["tiedmatch"]),
        bookmaker: json["bookmaker"] == null
            ? null
            : Bookmaker.fromJson(json["bookmaker"]),
      );

  Map<String, dynamic> toJson() => {
        "matchodds": matchodds?.toJson(),
        "tiedmatch": tiedmatch?.toJson(),
        "bookmaker": bookmaker?.toJson(),
      };
}

class Bookmaker {
  BookmakerTeama? teama;
  BookmakerTeama? teamb;

  Bookmaker({
    this.teama,
    this.teamb,
  });

  factory Bookmaker.fromJson(Map<String, dynamic> json) => Bookmaker(
        teama: json["teama"] == null
            ? null
            : BookmakerTeama.fromJson(json["teama"]),
        teamb: json["teamb"] == null
            ? null
            : BookmakerTeama.fromJson(json["teamb"]),
      );

  Map<String, dynamic> toJson() => {
        "teama": teama?.toJson(),
        "teamb": teamb?.toJson(),
      };
}

class BookmakerTeama {
  String? back;
  String? lay;
  String? backVolume;
  String? layVolume;

  BookmakerTeama({
    this.back,
    this.lay,
    this.backVolume,
    this.layVolume,
  });

  factory BookmakerTeama.fromJson(Map<String, dynamic> json) => BookmakerTeama(
        back: json["back"],
        lay: json["lay"],
        backVolume: json["back_volume"],
        layVolume: json["lay_volume"],
      );

  Map<String, dynamic> toJson() => {
        "back": back,
        "lay": lay,
        "back_volume": backVolume,
        "lay_volume": layVolume,
      };
}

class Competition {
  int? cid;
  String? title;
  String? abbr;
  String? type;
  String? category;
  String? matchFormat;
  String? season;
  String? status;
  DateTime? datestart;
  DateTime? dateend;
  String? country;
  String? totalMatches;
  String? totalRounds;
  String? totalTeams;

  Competition({
    this.cid,
    this.title,
    this.abbr,
    this.type,
    this.category,
    this.matchFormat,
    this.season,
    this.status,
    this.datestart,
    this.dateend,
    this.country,
    this.totalMatches,
    this.totalRounds,
    this.totalTeams,
  });

  factory Competition.fromJson(Map<String, dynamic> json) => Competition(
        cid: json["cid"],
        title: json["title"],
        abbr: json["abbr"],
        type: json["type"],
        category: json["category"],
        matchFormat: json["match_format"],
        season: json["season"],
        status: json["status"],
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
        "type": type,
        "category": category,
        "match_format": matchFormat,
        "season": season,
        "status": status,
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

class MatchInfoTeama {
  int? teamId;
  String? name;
  String? shortName;
  String? logoUrl;
  String? thumbUrl;
  String? scoresFull;
  String? scores;
  String? overs;

  MatchInfoTeama({
    this.teamId,
    this.name,
    this.shortName,
    this.logoUrl,
    this.thumbUrl,
    this.scoresFull,
    this.scores,
    this.overs,
  });

  factory MatchInfoTeama.fromJson(Map<String, dynamic> json) => MatchInfoTeama(
        teamId: json["team_id"],
        name: json["name"],
        shortName: json["short_name"],
        logoUrl: json["logo_url"],
        thumbUrl: json["thumb_url"],
        scoresFull: json["scores_full"],
        scores: json["scores"],
        overs: json["overs"],
      );

  Map<String, dynamic> toJson() => {
        "team_id": teamId,
        "name": name,
        "short_name": shortName,
        "logo_url": logoUrl,
        "thumb_url": thumbUrl,
        "scores_full": scoresFull,
        "scores": scores,
        "overs": overs,
      };
}

class Toss {
  String? text;
  int? winner;
  int? decision;

  Toss({
    this.text,
    this.winner,
    this.decision,
  });

  factory Toss.fromJson(Map<String, dynamic> json) => Toss(
        text: json["text"],
        winner: json["winner"],
        decision: json["decision"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "winner": winner,
        "decision": decision,
      };
}

class Venue {
  String? venueId;
  String? name;
  String? location;
  String? country;
  String? timezone;

  Venue({
    this.venueId,
    this.name,
    this.location,
    this.country,
    this.timezone,
  });

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        venueId: json["venue_id"],
        name: json["name"],
        location: json["location"],
        country: json["country"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "venue_id": venueId,
        "name": name,
        "location": location,
        "country": country,
        "timezone": timezone,
      };
}

class SessionOdd {
  int? questionId;
  String? teamBatting;
  String? title;
  String? backCondition;
  String? back;
  String? layCondition;
  String? lay;
  String? status;

  SessionOdd({
    this.questionId,
    this.teamBatting,
    this.title,
    this.backCondition,
    this.back,
    this.layCondition,
    this.lay,
    this.status,
  });

  factory SessionOdd.fromJson(Map<String, dynamic> json) => SessionOdd(
        questionId: json["question_id"],
        teamBatting: json["team_batting"],
        title: json["title"],
        backCondition: json["back_condition"],
        back: json["back"],
        layCondition: json["lay_condition"],
        lay: json["lay"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "question_id": questionId,
        "team_batting": teamBatting,
        "title": title,
        "back_condition": backCondition,
        "back": back,
        "lay_condition": layCondition,
        "lay": lay,
        "status": status,
      };
}

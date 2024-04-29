// To parse this JSON data, do
//
//     final matchPage = matchPageFromJson(jsonString);

import 'dart:convert';

MatchPage matchPageFromJson(String str) => MatchPage.fromJson(json.decode(str));

String matchPageToJson(MatchPage data) => json.encode(data.toJson());

class MatchPage {
  String? status;
  Data? response;
  String? etag;
  DateTime? modified;
  DateTime? datetime;
  String? apiVersion;

  MatchPage({
    this.status,
    this.response,
    this.etag,
    this.modified,
    this.datetime,
    this.apiVersion,
  });

  factory MatchPage.fromJson(Map<String, dynamic> json) => MatchPage(
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
  List<Match>? items;
  int? totalItems;
  int? totalPages;

  Data({
    this.items,
    this.totalItems,
    this.totalPages,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        items: json["items"] == null
            ? []
            : List<Match>.from(json["items"]!.map((x) => Match.fromJson(x))),
        totalItems: json["total_items"] is String ? null : json["total_items"],
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

class Match {
  int? matchId;
  String? title;
  String? shortTitle;
  String? subtitle;
  String? matchNumber;
  int? format;
  String? formatStr;
  int? status;
  String? statusStr;
  String? statusNote;
  String? verified;
  String? preSquad;
  String? oddsAvailable;
  int? gameState;
  String? gameStateStr;
  String? domestic;
  Competition? competition;
  Team? teama;
  Team? teamb;
  DateTime? dateStart;
  DateTime? dateEnd;
  int? timestampStart;
  int? timestampEnd;
  DateTime? dateStartIst;
  DateTime? dateEndIst;
  Venue? venue;
  String? umpires;
  String? referee;
  String? equation;
  String? live;
  String? result;
  dynamic resultType;
  String? winMargin;
  int? winningTeamId;
  int? commentary;
  int? wagon;
  int? latestInningNumber;
  String? presquadTime;
  String? verifyTime;
  String? matchDlsAffected;
  String? day;
  String? session;
  Toss? toss;

  Match({
    this.matchId,
    this.title,
    this.shortTitle,
    this.subtitle,
    this.matchNumber,
    this.format,
    this.formatStr,
    this.status,
    this.statusStr,
    this.statusNote,
    this.verified,
    this.preSquad,
    this.oddsAvailable,
    this.gameState,
    this.gameStateStr,
    this.domestic,
    this.competition,
    this.teama,
    this.teamb,
    this.dateStart,
    this.dateEnd,
    this.timestampStart,
    this.timestampEnd,
    this.dateStartIst,
    this.dateEndIst,
    this.venue,
    this.umpires,
    this.referee,
    this.equation,
    this.live,
    this.result,
    this.resultType,
    this.winMargin,
    this.winningTeamId,
    this.commentary,
    this.wagon,
    this.latestInningNumber,
    this.presquadTime,
    this.verifyTime,
    this.matchDlsAffected,
    this.day,
    this.session,
    this.toss,
  });

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        matchId: json["match_id"],
        title: json["title"],
        shortTitle: json["short_title"],
        subtitle: json["subtitle"],
        matchNumber: json["match_number"],
        format: json["format"],
        formatStr: json["format_str"],
        status: json["status"],
        statusStr: json["status_str"],
        statusNote: json["status_note"],
        verified: json["verified"],
        preSquad: json["pre_squad"],
        oddsAvailable: json["odds_available"],
        gameState: json["game_state"],
        gameStateStr: json["game_state_str"],
        domestic: json["domestic"],
        competition: json["competition"] == null
            ? null
            : Competition.fromJson(json["competition"]),
        teama: json["teama"] == null ? null : Team.fromJson(json["teama"]),
        teamb: json["teamb"] == null ? null : Team.fromJson(json["teamb"]),
        dateStart: json["date_start"] == null
            ? null
            : DateTime.parse(json["date_start"]),
        dateEnd:
            json["date_end"] == null ? null : DateTime.parse(json["date_end"]),
        timestampStart: json["timestamp_start"],
        timestampEnd: json["timestamp_end"],
        dateStartIst: json["date_start_ist"] == null
            ? null
            : DateTime.parse(json["date_start_ist"]),
        dateEndIst: json["date_end_ist"] == null
            ? null
            : DateTime.parse(json["date_end_ist"]),
        venue: json["venue"] == null ? null : Venue.fromJson(json["venue"]),
        umpires: json["umpires"],
        referee: json["referee"],
        equation: json["equation"],
        live: json["live"],
        result: json["result"],
        resultType: json["result_type"],
        winMargin: json["win_margin"],
        winningTeamId: json["winning_team_id"],
        commentary: json["commentary"],
        wagon: json["wagon"],
        latestInningNumber: json["latest_inning_number"],
        presquadTime: json["presquad_time"],
        verifyTime: json["verify_time"],
        matchDlsAffected: json["match_dls_affected"],
        day: json["day"],
        session: json["session"],
        toss: json["toss"] == null ? null : Toss.fromJson(json["toss"]),
      );

  Map<String, dynamic> toJson() => {
        "match_id": matchId,
        "title": title,
        "short_title": shortTitle,
        "subtitle": subtitle,
        "match_number": matchNumber,
        "format": format,
        "format_str": formatStr,
        "status": status,
        "status_str": statusStr,
        "status_note": statusNote,
        "verified": verified,
        "pre_squad": preSquad,
        "odds_available": oddsAvailable,
        "game_state": gameState,
        "game_state_str": gameStateStr,
        "domestic": domestic,
        "competition": competition?.toJson(),
        "teama": teama?.toJson(),
        "teamb": teamb?.toJson(),
        "date_start": dateStart?.toIso8601String(),
        "date_end": dateEnd?.toIso8601String(),
        "timestamp_start": timestampStart,
        "timestamp_end": timestampEnd,
        "date_start_ist": dateStartIst?.toIso8601String(),
        "date_end_ist": dateEndIst?.toIso8601String(),
        "venue": venue?.toJson(),
        "umpires": umpires,
        "referee": referee,
        "equation": equation,
        "live": live,
        "result": result,
        "result_type": resultType,
        "win_margin": winMargin,
        "winning_team_id": winningTeamId,
        "commentary": commentary,
        "wagon": wagon,
        "latest_inning_number": latestInningNumber,
        "presquad_time": presquadTime,
        "verify_time": verifyTime,
        "match_dls_affected": matchDlsAffected,
        "day": day,
        "session": session,
        "toss": toss?.toJson(),
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

enum Category { INTERNATIONAL, WOMEN }

final categoryValues = EnumValues(
    {"international": Category.INTERNATIONAL, "women": Category.WOMEN});

enum MatchFormat { MIXED, T20_I, WOMENT20 }

final matchFormatValues = EnumValues({
  "mixed": MatchFormat.MIXED,
  "t20i": MatchFormat.T20_I,
  "woment20": MatchFormat.WOMENT20
});

enum Status { LIVE, RESULT }

final statusValues = EnumValues({"live": Status.LIVE, "result": Status.RESULT});

enum Type { SERIES, TOUR }

final typeValues = EnumValues({"series": Type.SERIES, "tour": Type.TOUR});

enum FormatStr { T20_I, WOMEN_ODI, WOMEN_T20 }

final formatStrValues = EnumValues({
  "T20I": FormatStr.T20_I,
  "Women ODI": FormatStr.WOMEN_ODI,
  "Women T20": FormatStr.WOMEN_T20
});

enum GameStateStr { DEFAULT }

final gameStateStrValues = EnumValues({"Default": GameStateStr.DEFAULT});

enum StatusStr { COMPLETED }

final statusStrValues = EnumValues({"Completed": StatusStr.COMPLETED});

class Team {
  int? teamId;
  String? name;
  String? shortName;
  String? logoUrl;
  String? scoresFull;
  String? scores;
  String? overs;

  Team({
    this.teamId,
    this.name,
    this.shortName,
    this.logoUrl,
    this.scoresFull,
    this.scores,
    this.overs,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        teamId: json["team_id"],
        name: json["name"],
        shortName: json["short_name"],
        logoUrl: json["logo_url"],
        scoresFull: json["scores_full"],
        scores: json["scores"],
        overs: json["overs"],
      );

  Map<String, dynamic> toJson() => {
        "team_id": teamId,
        "name": name,
        "short_name": shortName,
        "logo_url": logoUrl,
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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

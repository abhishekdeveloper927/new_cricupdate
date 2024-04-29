// To parse this JSON data, do
//
//     final scoreboardDetailPage = scoreboardDetailPageFromJson(jsonString);

import 'dart:convert';

import 'live_matchh_detail_page.dart';

ScoreboardDetailPage scoreboardDetailPageFromJson(String str) =>
    ScoreboardDetailPage.fromJson(json.decode(str));

String scoreboardDetailPageToJson(ScoreboardDetailPage data) =>
    json.encode(data.toJson());

class ScoreboardDetailPage {
  String? status;
  ScoreboardDetailsModel? response;
  String? etag;
  DateTime? modified;
  DateTime? datetime;
  String? apiVersion;

  ScoreboardDetailPage({
    this.status,
    this.response,
    this.etag,
    this.modified,
    this.datetime,
    this.apiVersion,
  });

  factory ScoreboardDetailPage.fromJson(Map<String, dynamic> json) =>
      ScoreboardDetailPage(
        status: json["status"],
        response: json["response"] == null
            ? null
            : ScoreboardDetailsModel.fromJson(json["response"]),
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

class ScoreboardDetailsModel {
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
  dynamic verifyTime;
  String? matchDlsAffected;
  String? liveInningNumber;
  String? day;
  String? session;
  Toss? toss;
  String? currentOver;
  String? previousOver;
  ManOfTheMatch? manOfTheMatch;
  String? manOfTheSeries;
  int? isFollowon;
  String? teamBattingFirst;
  String? teamBattingSecond;
  String? lastFiveOvers;
  List<Inning>? innings;
  List<Player>? players;
  List<dynamic>? preMatchOdds;
  String? dayRemainingOver;
  List<List<String>>? matchNotes;

  ScoreboardDetailsModel({
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
    this.verifyTime,
    this.matchDlsAffected,
    this.liveInningNumber,
    this.day,
    this.session,
    this.toss,
    this.currentOver,
    this.previousOver,
    this.manOfTheMatch,
    this.manOfTheSeries,
    this.isFollowon,
    this.teamBattingFirst,
    this.teamBattingSecond,
    this.lastFiveOvers,
    this.innings,
    this.players,
    this.preMatchOdds,
    this.dayRemainingOver,
    this.matchNotes,
  });

  factory ScoreboardDetailsModel.fromJson(Map<String, dynamic> json) =>
      ScoreboardDetailsModel(
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
        matchDlsAffected: json["match_dls_affected"],
        liveInningNumber: json["live_inning_number"],
        day: json["day"],
        session: json["session"],
        toss: json["toss"] == null ? null : Toss.fromJson(json["toss"]),
        currentOver: json["current_over"],
        previousOver: json["previous_over"],
        manOfTheMatch: json["man_of_the_match"] == ''
            ? null
            : ManOfTheMatch.fromJson(json["man_of_the_match"]),
        manOfTheSeries: json["man_of_the_series"],
        isFollowon: json["is_followon"],
        teamBattingFirst: json["team_batting_first"],
        teamBattingSecond: json["team_batting_second"],
        lastFiveOvers: json["last_five_overs"],
        innings: json["innings"] == null
            ? []
            : List<Inning>.from(
                json["innings"]!.map((x) => Inning.fromJson(x))),
        players: json["players"] == null
            ? []
            : List<Player>.from(
                json["players"]!.map((x) => Player.fromJson(x))),
        preMatchOdds: json["pre_match_odds"] == null
            ? []
            : List<dynamic>.from(json["pre_match_odds"]!.map((x) => x)),
        dayRemainingOver: json["day_remaining_over"],
        matchNotes: json["match_notes"] == null
            ? []
            : List<List<String>>.from(json["match_notes"]!
                .map((x) => List<String>.from(x.map((x) => x)))),
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
        "verify_time": verifyTime?.toIso8601String(),
        "match_dls_affected": matchDlsAffected,
        "live_inning_number": liveInningNumber,
        "day": day,
        "session": session,
        "toss": toss?.toJson(),
        "current_over": currentOver,
        "previous_over": previousOver,
        "man_of_the_match": manOfTheMatch?.toJson(),
        "man_of_the_series": manOfTheSeries,
        "is_followon": isFollowon,
        "team_batting_first": teamBattingFirst,
        "team_batting_second": teamBattingSecond,
        "last_five_overs": lastFiveOvers,
        "innings": innings == null
            ? []
            : List<dynamic>.from(innings!.map((x) => x.toJson())),
        "players": players == null
            ? []
            : List<dynamic>.from(players!.map((x) => x.toJson())),
        "pre_match_odds": preMatchOdds == null
            ? []
            : List<dynamic>.from(preMatchOdds!.map((x) => x)),
        "day_remaining_over": dayRemainingOver,
        "match_notes": matchNotes == null
            ? []
            : List<dynamic>.from(
                matchNotes!.map((x) => List<dynamic>.from(x.map((x) => x)))),
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

enum Country { INT, MY, NP }

final countryValues =
    EnumValues({"int": Country.INT, "my": Country.MY, "np": Country.NP});

class Inning {
  int? iid;
  int? number;
  String? name;
  String? shortName;
  int? status;
  String? issuperover;
  int? result;
  int? battingTeamId;
  int? fieldingTeamId;
  String? scores;
  String? scoresFull;
  List<InningBatsman>? batsmen;
  List<Bowler>? bowlers;
  List<Fielder>? fielder;

  /* Powerplay? powerplay;*/
  Review? review;
  List<LastWicket>? fows;
  LastWicket? lastWicket;
  ExtraRuns? extraRuns;
  Equations? equations;
  CurrentPartnership? currentPartnership;
  List<DidNotBat>? didNotBat;
  String? maxOver;
  String? target;

  Inning({
    this.iid,
    this.number,
    this.name,
    this.shortName,
    this.status,
    this.issuperover,
    this.result,
    this.battingTeamId,
    this.fieldingTeamId,
    this.scores,
    this.scoresFull,
    this.batsmen,
    this.bowlers,
    this.fielder,
    /* this.powerplay,*/
    this.review,
    this.fows,
    this.lastWicket,
    this.extraRuns,
    this.equations,
    this.currentPartnership,
    this.didNotBat,
    this.maxOver,
    this.target,
  });

  factory Inning.fromJson(Map<String, dynamic> json) => Inning(
        iid: json["iid"],
        number: json["number"],
        name: json["name"],
        shortName: json["short_name"],
        status: json["status"],
        issuperover: json["issuperover"],
        result: json["result"],
        battingTeamId: json["batting_team_id"],
        fieldingTeamId: json["fielding_team_id"],
        scores: json["scores"],
        scoresFull: json["scores_full"],
        batsmen: json["batsmen"] == null
            ? []
            : List<InningBatsman>.from(
                json["batsmen"]!.map((x) => InningBatsman.fromJson(x))),
        bowlers: json["bowlers"] == null
            ? []
            : List<Bowler>.from(
                json["bowlers"]!.map((x) => Bowler.fromJson(x))),
        fielder: json["fielder"] == null
            ? []
            : List<Fielder>.from(
                json["fielder"]!.map((x) => Fielder.fromJson(x))),
/*        powerplay: json["powerplay"] == null
            ? null
            : Powerplay.fromJson(json["powerplay"]),*/
        review: json["review"] == null ? null : Review.fromJson(json["review"]),
        fows: json["fows"] == null
            ? []
            : List<LastWicket>.from(
                json["fows"]!.map((x) => LastWicket.fromJson(x))),
        lastWicket: json["last_wicket"] == null
            ? null
            : json["last_wicket"] is List
                ? null
                : LastWicket.fromJson(json["last_wicket"]),
        extraRuns: json["extra_runs"] == null
            ? null
            : ExtraRuns.fromJson(json["extra_runs"]),
        equations: json["equations"] == null
            ? null
            : Equations.fromJson(json["equations"]),
        currentPartnership: json["current_partnership"] == null
            ? null
            : json["current_partnership"] is List
                ? null
                : CurrentPartnership.fromJson(json["current_partnership"]),
        didNotBat: json["did_not_bat"] == null
            ? []
            : List<DidNotBat>.from(
                json["did_not_bat"]!.map((x) => DidNotBat.fromJson(x))),
        maxOver: json["max_over"],
        target: json["target"],
      );

  Map<String, dynamic> toJson() => {
        "iid": iid,
        "number": number,
        "name": name,
        "short_name": shortName,
        "status": status,
        "issuperover": issuperover,
        "result": result,
        "batting_team_id": battingTeamId,
        "fielding_team_id": fieldingTeamId,
        "scores": scores,
        "scores_full": scoresFull,
        "batsmen": batsmen == null
            ? []
            : List<dynamic>.from(batsmen!.map((x) => x.toJson())),
        "bowlers": bowlers == null
            ? []
            : List<dynamic>.from(bowlers!.map((x) => x.toJson())),
        "fielder": fielder == null
            ? []
            : List<dynamic>.from(fielder!.map((x) => x.toJson())),
        /*   "powerplay": powerplay?.toJson(),*/
        "review": review?.toJson(),
        "fows": fows == null
            ? []
            : List<dynamic>.from(fows!.map((x) => x.toJson())),
        "last_wicket": lastWicket == [] ? [] : lastWicket!.toJson(),
        "extra_runs": extraRuns?.toJson(),
        "equations": equations?.toJson(),
        "current_partnership": currentPartnership?.toJson(),
        "did_not_bat": didNotBat == null
            ? []
            : List<dynamic>.from(didNotBat!.map((x) => x.toJson())),
        "max_over": maxOver,
        "target": target,
      };
}

class InningBatsman {
  String? name;
  String? batsmanId;
  String? batting;
  String? position;
  String? role;
  String? roleStr;
  String? runs;
  String? ballsFaced;
  String? fours;
  String? sixes;
  String? run0;
  String? run1;
  String? run2;
  String? run3;
  String? run5;
  String? howOut;
  String? dismissal;
  String? strikeRate;
  String? bowlerId;
  String? firstFielderId;
  String? secondFielderId;
  String? thirdFielderId;

  InningBatsman({
    this.name,
    this.batsmanId,
    this.batting,
    this.position,
    this.role,
    this.roleStr,
    this.runs,
    this.ballsFaced,
    this.fours,
    this.sixes,
    this.run0,
    this.run1,
    this.run2,
    this.run3,
    this.run5,
    this.howOut,
    this.dismissal,
    this.strikeRate,
    this.bowlerId,
    this.firstFielderId,
    this.secondFielderId,
    this.thirdFielderId,
  });

  factory InningBatsman.fromJson(Map<String, dynamic> json) => InningBatsman(
        name: json["name"],
        batsmanId: json["batsman_id"],
        batting: json["batting"],
        position: json["position"],
        role: json["role"],
        roleStr: json["role_str"],
        runs: json["runs"],
        ballsFaced: json["balls_faced"],
        fours: json["fours"],
        sixes: json["sixes"],
        run0: json["run0"],
        run1: json["run1"],
        run2: json["run2"],
        run3: json["run3"],
        run5: json["run5"],
        howOut: json["how_out"],
        dismissal: json["dismissal"],
        strikeRate: json["strike_rate"],
        bowlerId: json["bowler_id"],
        firstFielderId: json["first_fielder_id"],
        secondFielderId: json["second_fielder_id"],
        thirdFielderId: json["third_fielder_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "batsman_id": batsmanId,
        "batting": batting,
        "position": position,
        "role": role,
        "role_str": roleStr,
        "runs": runs,
        "balls_faced": ballsFaced,
        "fours": fours,
        "sixes": sixes,
        "run0": run0,
        "run1": run1,
        "run2": run2,
        "run3": run3,
        "run5": run5,
        "how_out": howOut,
        "dismissal": dismissal,
        "strike_rate": strikeRate,
        "bowler_id": bowlerId,
        "first_fielder_id": firstFielderId,
        "second_fielder_id": secondFielderId,
        "third_fielder_id": thirdFielderId,
      };
}

enum BatsmanPosition { EMPTY, NON_STRIKER, STRIKER }

final batsmanPositionValues = EnumValues({
  "": BatsmanPosition.EMPTY,
  "non striker": BatsmanPosition.NON_STRIKER,
  "striker": BatsmanPosition.STRIKER
});

enum Role { ALL, BAT, BOWL, SQUAD, WK }

final roleValues = EnumValues({
  "all": Role.ALL,
  "bat": Role.BAT,
  "bowl": Role.BOWL,
  "squad": Role.SQUAD,
  "wk": Role.WK
});

enum RoleStr { C, EMPTY, WK }

final roleStrValues =
    EnumValues({"(C)": RoleStr.C, "": RoleStr.EMPTY, "(WK)": RoleStr.WK});

class Bowler {
  String? name;
  String? bowlerId;
  String? bowling;
  BowlerPosition? position;
  String? overs;
  String? maidens;
  String? runsConceded;
  String? wickets;
  String? noballs;
  String? wides;
  String? econ;
  String? run0;
  String? bowledcount;
  String? lbwcount;

  Bowler({
    this.name,
    this.bowlerId,
    this.bowling,
    this.position,
    this.overs,
    this.maidens,
    this.runsConceded,
    this.wickets,
    this.noballs,
    this.wides,
    this.econ,
    this.run0,
    this.bowledcount,
    this.lbwcount,
  });

  factory Bowler.fromJson(Map<String, dynamic> json) => Bowler(
        name: json["name"],
        bowlerId: json["bowler_id"],
        bowling: json["bowling"],
        position: bowlerPositionValues.map[json["position"]]!,
        overs: json["overs"],
        maidens: json["maidens"],
        runsConceded: json["runs_conceded"],
        wickets: json["wickets"],
        noballs: json["noballs"],
        wides: json["wides"],
        econ: json["econ"],
        run0: json["run0"],
        bowledcount: json["bowledcount"],
        lbwcount: json["lbwcount"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "bowler_id": bowlerId,
        "bowling": bowling,
        "position": bowlerPositionValues.reverse[position],
        "overs": overs,
        "maidens": maidens,
        "runs_conceded": runsConceded,
        "wickets": wickets,
        "noballs": noballs,
        "wides": wides,
        "econ": econ,
        "run0": run0,
        "bowledcount": bowledcount,
        "lbwcount": lbwcount,
      };
}

enum BowlerPosition { ACTIVE_BOWLER, EMPTY, LAST_BOWLER }

final bowlerPositionValues = EnumValues({
  "active bowler": BowlerPosition.ACTIVE_BOWLER,
  "": BowlerPosition.EMPTY,
  "last bowler": BowlerPosition.LAST_BOWLER
});

class CurrentPartnership {
  int? runs;
  int? balls;
  double? overs;
  List<CurrentPartnershipBatsman>? batsmen;

  CurrentPartnership({
    this.runs,
    this.balls,
    this.overs,
    this.batsmen,
  });

  factory CurrentPartnership.fromJson(Map<String, dynamic> json) =>
      CurrentPartnership(
        runs: json["runs"],
        balls: json["balls"],
        overs: json["overs"]?.toDouble(),
        batsmen: json["batsmen"] == null
            ? []
            : List<CurrentPartnershipBatsman>.from(json["batsmen"]!
                .map((x) => CurrentPartnershipBatsman.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "runs": runs,
        "balls": balls,
        "overs": overs,
        "batsmen": batsmen == null
            ? []
            : List<dynamic>.from(batsmen!.map((x) => x.toJson())),
      };
}

class CurrentPartnershipBatsman {
  String? name;
  int? batsmanId;
  int? runs;
  int? balls;

  CurrentPartnershipBatsman({
    this.name,
    this.batsmanId,
    this.runs,
    this.balls,
  });

  factory CurrentPartnershipBatsman.fromJson(Map<String, dynamic> json) =>
      CurrentPartnershipBatsman(
        name: json["name"],
        batsmanId: json["batsman_id"],
        runs: json["runs"],
        balls: json["balls"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "batsman_id": batsmanId,
        "runs": runs,
        "balls": balls,
      };
}

class DidNotBat {
  String? playerId;
  String? name;

  DidNotBat({
    this.playerId,
    this.name,
  });

  factory DidNotBat.fromJson(Map<String, dynamic> json) => DidNotBat(
        playerId: json["player_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "player_id": playerId,
        "name": name,
      };
}

class Equations {
  int? runs;
  int? wickets;
  String? overs;
  int? bowlersUsed;
  String? runrate;

  Equations({
    this.runs,
    this.wickets,
    this.overs,
    this.bowlersUsed,
    this.runrate,
  });

  factory Equations.fromJson(Map<String, dynamic> json) => Equations(
        runs: json["runs"],
        wickets: json["wickets"],
        overs: json["overs"],
        bowlersUsed: json["bowlers_used"],
        runrate: json["runrate"],
      );

  Map<String, dynamic> toJson() => {
        "runs": runs,
        "wickets": wickets,
        "overs": overs,
        "bowlers_used": bowlersUsed,
        "runrate": runrate,
      };
}

class ExtraRuns {
  int? byes;
  int? legbyes;
  int? wides;
  int? noballs;
  String? penalty;
  int? total;

  ExtraRuns({
    this.byes,
    this.legbyes,
    this.wides,
    this.noballs,
    this.penalty,
    this.total,
  });

  factory ExtraRuns.fromJson(Map<String, dynamic> json) => ExtraRuns(
        byes: json["byes"],
        legbyes: json["legbyes"],
        wides: json["wides"],
        noballs: json["noballs"],
        penalty: json["penalty"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "byes": byes,
        "legbyes": legbyes,
        "wides": wides,
        "noballs": noballs,
        "penalty": penalty,
        "total": total,
      };
}

class Fielder {
  String? fielderId;
  String? fielderName;
  int? catches;
  int? runoutThrower;
  int? runoutCatcher;
  int? runoutDirectHit;
  int? stumping;
  String? isSubstitute;

  Fielder({
    this.fielderId,
    this.fielderName,
    this.catches,
    this.runoutThrower,
    this.runoutCatcher,
    this.runoutDirectHit,
    this.stumping,
    this.isSubstitute,
  });

  factory Fielder.fromJson(Map<String, dynamic> json) => Fielder(
        fielderId: json["fielder_id"],
        fielderName: json["fielder_name"],
        catches: json["catches"],
        runoutThrower: json["runout_thrower"],
        runoutCatcher: json["runout_catcher"],
        runoutDirectHit: json["runout_direct_hit"],
        stumping: json["stumping"],
        isSubstitute: json["is_substitute"],
      );

  Map<String, dynamic> toJson() => {
        "fielder_id": fielderId,
        "fielder_name": fielderName,
        "catches": catches,
        "runout_thrower": runoutThrower,
        "runout_catcher": runoutCatcher,
        "runout_direct_hit": runoutDirectHit,
        "stumping": stumping,
        "is_substitute": isSubstitute,
      };
}

class LastWicket {
  String? name;
  String? batsmanId;
  String? runs;
  String? balls;
  String? howOut;
  int? scoreAtDismissal;
  String? oversAtDismissal;
  String? bowlerId;
  String? dismissal;
  int? number;

  LastWicket({
    this.name,
    this.batsmanId,
    this.runs,
    this.balls,
    this.howOut,
    this.scoreAtDismissal,
    this.oversAtDismissal,
    this.bowlerId,
    this.dismissal,
    this.number,
  });

  factory LastWicket.fromJson(Map<String, dynamic> json) => LastWicket(
        name: json["name"],
        batsmanId: json["batsman_id"],
        runs: json["runs"],
        balls: json["balls"],
        howOut: json["how_out"],
        scoreAtDismissal: json["score_at_dismissal"],
        oversAtDismissal: json["overs_at_dismissal"],
        bowlerId: json["bowler_id"],
        dismissal: json["dismissal"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "batsman_id": batsmanId,
        "runs": runs,
        "balls": balls,
        "how_out": howOut,
        "score_at_dismissal": scoreAtDismissal,
        "overs_at_dismissal": oversAtDismissal,
        "bowler_id": bowlerId,
        "dismissal": dismissal,
        "number": number,
      };
}

class Powerplay {
  P1? p1;

  Powerplay({
    this.p1,
  });

  factory Powerplay.fromJson(Map<String, dynamic> json) => Powerplay(
        p1: json["p1"] == null ? null : P1.fromJson(json["p1"]),
      );

  Map<String, dynamic> toJson() => {
        "p1": p1?.toJson(),
      };
}

class P1 {
  String? startover;
  String? endover;

  P1({
    this.startover,
    this.endover,
  });

  factory P1.fromJson(Map<String, dynamic> json) => P1(
        startover: json["startover"],
        endover: json["endover"],
      );

  Map<String, dynamic> toJson() => {
        "startover": startover,
        "endover": endover,
      };
}

class Review {
  Batting? batting;
  Bowling? bowling;

  Review({
    this.batting,
    this.bowling,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        batting:
            json["batting"] == null ? null : Batting.fromJson(json["batting"]),
        bowling:
            json["bowling"] == null ? null : Bowling.fromJson(json["bowling"]),
      );

  Map<String, dynamic> toJson() => {
        "batting": batting?.toJson(),
        "bowling": bowling?.toJson(),
      };
}

class Batting {
  String? battingTeamTotalReview;
  String? battingTeamReviewSuccess;
  String? battingTeamReviewFailed;
  String? battingTeamReviewAvailable;
  String? battingTeamReviewRetained;

  Batting({
    this.battingTeamTotalReview,
    this.battingTeamReviewSuccess,
    this.battingTeamReviewFailed,
    this.battingTeamReviewAvailable,
    this.battingTeamReviewRetained,
  });

  factory Batting.fromJson(Map<String, dynamic> json) => Batting(
        battingTeamTotalReview: json["batting_team_total_review"],
        battingTeamReviewSuccess: json["batting_team_review_success"],
        battingTeamReviewFailed: json["batting_team_review_failed"],
        battingTeamReviewAvailable: json["batting_team_review_available"],
        battingTeamReviewRetained: json["batting_team_review_retained"],
      );

  Map<String, dynamic> toJson() => {
        "batting_team_total_review": battingTeamTotalReview,
        "batting_team_review_success": battingTeamReviewSuccess,
        "batting_team_review_failed": battingTeamReviewFailed,
        "batting_team_review_available": battingTeamReviewAvailable,
        "batting_team_review_retained": battingTeamReviewRetained,
      };
}

class Bowling {
  String? bowlingTeamTotalReview;
  String? bowlingTeamReviewSuccess;
  String? bowlingTeamReviewFailed;
  String? bowlingTeamReviewAvailable;
  String? bowlingTeamReviewRetained;

  Bowling({
    this.bowlingTeamTotalReview,
    this.bowlingTeamReviewSuccess,
    this.bowlingTeamReviewFailed,
    this.bowlingTeamReviewAvailable,
    this.bowlingTeamReviewRetained,
  });

  factory Bowling.fromJson(Map<String, dynamic> json) => Bowling(
        bowlingTeamTotalReview: json["bowling_team_total_review"],
        bowlingTeamReviewSuccess: json["bowling_team_review_success"],
        bowlingTeamReviewFailed: json["bowling_team_review_failed"],
        bowlingTeamReviewAvailable: json["bowling_team_review_available"],
        bowlingTeamReviewRetained: json["bowling_team_review_retained"],
      );

  Map<String, dynamic> toJson() => {
        "bowling_team_total_review": bowlingTeamTotalReview,
        "bowling_team_review_success": bowlingTeamReviewSuccess,
        "bowling_team_review_failed": bowlingTeamReviewFailed,
        "bowling_team_review_available": bowlingTeamReviewAvailable,
        "bowling_team_review_retained": bowlingTeamReviewRetained,
      };
}

class ManOfTheMatch {
  int? pid;
  String? name;
  String? thumbUrl;

  ManOfTheMatch({
    this.pid,
    this.name,
    this.thumbUrl,
  });

  factory ManOfTheMatch.fromJson(Map<String, dynamic> json) => ManOfTheMatch(
        pid: json["pid"],
        name: json["name"],
        thumbUrl: json["thumb_url"],
      );

  Map<String, dynamic> toJson() => {
        "pid": pid,
        "name": name,
        "thumb_url": thumbUrl,
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

enum Name { INTERNATIONAL, MALAYSIA, NEPAL }

final nameValues = EnumValues({
  "International": Name.INTERNATIONAL,
  "Malaysia": Name.MALAYSIA,
  "Nepal": Name.NEPAL
});

class Team {
  int? teamId;
  String? name;
  String? shortName;
  String? logoUrl;
  String? thumbUrl;
  String? scoresFull;
  String? scores;
  String? overs;

  Team({
    this.teamId,
    this.name,
    this.shortName,
    this.logoUrl,
    this.thumbUrl,
    this.scoresFull,
    this.scores,
    this.overs,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

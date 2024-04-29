// To parse this JSON data, do
//
//     final matchInfoPage = matchInfoPageFromJson(jsonString);

import 'dart:convert';

import 'package:cricupdate/data/model/response/player_page.dart';

MatchInfoPage matchInfoPageFromJson(String str) =>
    MatchInfoPage.fromJson(json.decode(str));

String matchInfoPageToJson(MatchInfoPage data) => json.encode(data.toJson());

class MatchInfoPage {
  String? status;
  MatchInfoModel? response;
  String? etag;
  DateTime? modified;
  DateTime? datetime;
  String? apiVersion;

  MatchInfoPage({
    this.status,
    this.response,
    this.etag,
    this.modified,
    this.datetime,
    this.apiVersion,
  });

  factory MatchInfoPage.fromJson(Map<String, dynamic> json) => MatchInfoPage(
        status: json["status"],
        response: json["response"] == null
            ? null
            : MatchInfoModel.fromJson(json["response"]),
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

class MatchInfoModel {
  int? matchId;
  MatchInfo? matchInfo;
  MatchPlaying11? matchPlaying11;
  ManOfTheMatch? manOfTheMatch;
  ManOfTheMatch? manOfTheSeries;
  Scorecard? scorecard;
  Live? live;
  LiveOdds? liveOdds;
  List<FeaturedSession>? sessionOdds;
  List<FeaturedSession>? featuredSession;
  List<PlayerModel>? players;

  MatchInfoModel({
    this.matchId,
    this.matchInfo,
    this.matchPlaying11,
    this.manOfTheMatch,
    this.manOfTheSeries,
    this.scorecard,
    this.live,
    this.liveOdds,
    this.sessionOdds,
    this.featuredSession,
    this.players,
  });

  factory MatchInfoModel.fromJson(Map<String, dynamic> json) => MatchInfoModel(
        matchId: json["match_id"],
        matchInfo: json["match_info"] == null
            ? null
            : MatchInfo.fromJson(json["match_info"]),
        matchPlaying11: json["match-playing11"] == null
            ? null
            : MatchPlaying11.fromJson(json["match-playing11"]),
        manOfTheMatch: json["man_of_the_match"] == null
            ? null
            : json["man_of_the_match"] is List
                ? null
                : ManOfTheMatch.fromJson(json["man_of_the_match"]),
        manOfTheSeries: json["man_of_the_series"] == null
            ? null
            : json["man_of_the_series"] is List
                ? null
                : ManOfTheMatch.fromJson(json["man_of_the_series"]),
        scorecard: json["scorecard"] == null
            ? null
            : Scorecard.fromJson(json["scorecard"]),
        live: json["live"] == null
            ? null
            : json["live"] is List
                ? null
                : Live.fromJson(json["live"]),
        liveOdds: json["live_odds"] == null
            ? null
            : json["live_odds"] is List
                ? null
                : LiveOdds.fromJson(json["live_odds"]),
        sessionOdds: json["session_odds"] == null
            ? []
            : List<FeaturedSession>.from(
                json["session_odds"]!.map((x) => FeaturedSession.fromJson(x))),
        featuredSession: json["featured_session"] == null
            ? []
            : List<FeaturedSession>.from(json["featured_session"]!
                .map((x) => FeaturedSession.fromJson(x))),
        players: json["players"] == null
            ? []
            : List<PlayerModel>.from(
                json["players"]!.map((x) => PlayerModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "match_id": matchId,
        "match_info": matchInfo?.toJson(),
        "match-playing11": matchPlaying11?.toJson(),
        "man_of_the_match": manOfTheMatch?.toJson(),
        "man_of_the_series": manOfTheMatch?.toJson(),
        "scorecard": scorecard?.toJson(),
        "live": live?.toJson(),
        "live_odds": liveOdds?.toJson(),
        "session_odds": sessionOdds == null
            ? []
            : List<dynamic>.from(sessionOdds!.map((x) => x.toJson())),
        "featured_session": featuredSession == null
            ? []
            : List<dynamic>.from(featuredSession!.map((x) => x.toJson())),
        "players": players == null
            ? []
            : List<dynamic>.from(players!.map((x) => x.toJson())),
      };
}

class FeaturedSession {
  int? questionId;
  String? teamBatting;
  String? title;
  String? backCondition;
  String? back;
  String? layCondition;
  String? lay;
  String? status;
  String? over;

  FeaturedSession({
    this.questionId,
    this.teamBatting,
    this.title,
    this.backCondition,
    this.back,
    this.layCondition,
    this.lay,
    this.status,
    this.over,
  });

  factory FeaturedSession.fromJson(Map<String, dynamic> json) =>
      FeaturedSession(
        questionId: json["question_id"],
        teamBatting: json["team_batting"],
        title: json["title"],
        backCondition: json["back_condition"],
        back: json["back"],
        layCondition: json["lay_condition"],
        lay: json["lay"],
        status: json["status"],
        over: json["over"],
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
        "over": over,
      };
}

enum Status { BALL_RUNNING, SUSPENDED }

final statusValues = EnumValues(
    {"Ball Running": Status.BALL_RUNNING, "SUSPENDED": Status.SUSPENDED});

class Live {
  int? mid;
  int? status;
  String? statusStr;
  int? gameState;
  String? gameStateStr;
  String? statusNote;
  String? teamBatting;
  String? teamBowling;
  int? liveInningNumber;
  LiveScore? liveScore;
  List<LiveBatsman>? batsmen;
  List<LiveBowler>? bowlers;
  List<Commentary>? commentaries;
  Inning? liveInning;

  Live({
    this.mid,
    this.status,
    this.statusStr,
    this.gameState,
    this.gameStateStr,
    this.statusNote,
    this.teamBatting,
    this.teamBowling,
    this.liveInningNumber,
    this.liveScore,
    this.batsmen,
    this.bowlers,
    this.commentaries,
    this.liveInning,
  });

  factory Live.fromJson(Map<String, dynamic> json) => Live(
        mid: json["mid"],
        status: json["status"],
        statusStr: json["status_str"],
        gameState: json["game_state"],
        gameStateStr: json["game_state_str"],
        statusNote: json["status_note"],
        teamBatting: json["team_batting"],
        teamBowling: json["team_bowling"],
        liveInningNumber: json["live_inning_number"],
        liveScore: json["live_score"] == null
            ? null
            : LiveScore.fromJson(json["live_score"]),
        batsmen: json["batsmen"] == null
            ? []
            : List<LiveBatsman>.from(
                json["batsmen"]!.map((x) => LiveBatsman.fromJson(x))),
        bowlers: json["bowlers"] == null
            ? []
            : List<LiveBowler>.from(
                json["bowlers"]!.map((x) => LiveBowler.fromJson(x))),
        commentaries: json["commentaries"] == null
            ? []
            : List<Commentary>.from(
                json["commentaries"]!.map((x) => Commentary.fromJson(x))),
        liveInning: json["live_inning"] == null
            ? null
            : Inning.fromJson(json["live_inning"]),
      );

  Map<String, dynamic> toJson() => {
        "mid": mid,
        "status": status,
        "status_str": statusStr,
        "game_state": gameState,
        "game_state_str": gameStateStr,
        "status_note": statusNote,
        "team_batting": teamBatting,
        "team_bowling": teamBowling,
        "live_inning_number": liveInningNumber,
        "live_score": liveScore?.toJson(),
        "batsmen": batsmen == null
            ? []
            : List<dynamic>.from(batsmen!.map((x) => x.toJson())),
        "bowlers": bowlers == null
            ? []
            : List<dynamic>.from(bowlers!.map((x) => x.toJson())),
        "commentaries": commentaries == null
            ? []
            : List<dynamic>.from(commentaries!.map((x) => x.toJson())),
        "live_inning": liveInning?.toJson(),
      };
}

class LiveBatsman {
  String? name;
  int? batsmanId;
  int? runs;
  int? ballsFaced;
  int? fours;
  int? sixes;
  String? strikeRate;

  LiveBatsman({
    this.name,
    this.batsmanId,
    this.runs,
    this.ballsFaced,
    this.fours,
    this.sixes,
    this.strikeRate,
  });

  factory LiveBatsman.fromJson(Map<String, dynamic> json) => LiveBatsman(
        name: json["name"],
        batsmanId: json["batsman_id"],
        runs: json["runs"],
        ballsFaced: json["balls_faced"],
        fours: json["fours"],
        sixes: json["sixes"],
        strikeRate: json["strike_rate"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "batsman_id": batsmanId,
        "runs": runs,
        "balls_faced": ballsFaced,
        "fours": fours,
        "sixes": sixes,
        "strike_rate": strikeRate,
      };
}

class LiveBowler {
  String? name;
  int? bowlerId;
  double? overs;
  int? runsConceded;
  int? wickets;
  int? maidens;
  String? econ;

  LiveBowler({
    this.name,
    this.bowlerId,
    this.overs,
    this.runsConceded,
    this.wickets,
    this.maidens,
    this.econ,
  });

  factory LiveBowler.fromJson(Map<String, dynamic> json) => LiveBowler(
        name: json["name"],
        bowlerId: json["bowler_id"],
        overs: json["overs"]?.toDouble(),
        runsConceded: json["runs_conceded"],
        wickets: json["wickets"],
        maidens: json["maidens"],
        econ: json["econ"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "bowler_id": bowlerId,
        "overs": overs,
        "runs_conceded": runsConceded,
        "wickets": wickets,
        "maidens": maidens,
        "econ": econ,
      };
}

class Commentary {
  String? eventId;
  String? event;
  String? batsmanId;
  String? bowlerId;
  dynamic over;
  String? ball;
  dynamic score;
  String? commentary;
  bool? noballDismissal;
  String? text;
  int? timestamp;
  int? run;
  String? noballRun;
  String? wideRun;
  String? byeRun;
  String? legbyeRun;
  String? batRun;
  dynamic odds;
  int? xball;
  int? runs;
  List<Bat>? bats;
  List<Bowl>? bowls;
  String? wicketBatsmanId;
  String? howOut;
  String? batsmanRuns;
  String? batsmanBalls;

  Commentary({
    this.eventId,
    this.event,
    this.batsmanId,
    this.bowlerId,
    this.over,
    this.ball,
    this.score,
    this.commentary,
    this.noballDismissal,
    this.text,
    this.timestamp,
    this.run,
    this.noballRun,
    this.wideRun,
    this.byeRun,
    this.legbyeRun,
    this.batRun,
    this.odds,
    this.xball,
    this.runs,
    this.bats,
    this.bowls,
    this.wicketBatsmanId,
    this.howOut,
    this.batsmanRuns,
    this.batsmanBalls,
  });

  factory Commentary.fromJson(Map<String, dynamic> json) => Commentary(
        eventId: json["event_id"],
        event: json["event"],
        batsmanId: json["batsman_id"],
        bowlerId: json["bowler_id"],
        over: json["over"],
        ball: json["ball"],
        score: json["score"],
        commentary: json["commentary"],
        noballDismissal: json["noball_dismissal"],
        text: json["text"],
        timestamp: json["timestamp"],
        run: json["run"],
        noballRun: json["noball_run"],
        wideRun: json["wide_run"],
        byeRun: json["bye_run"],
        legbyeRun: json["legbye_run"],
        batRun: json["bat_run"],
        odds: json["odds"],
        xball: json["xball"],
        runs: json["runs"],
        bats: json["bats"] == null
            ? []
            : List<Bat>.from(json["bats"]!.map((x) => Bat.fromJson(x))),
        bowls: json["bowls"] == null
            ? []
            : List<Bowl>.from(json["bowls"]!.map((x) => Bowl.fromJson(x))),
        wicketBatsmanId: json["wicket_batsman_id"],
        howOut: json["how_out"],
        batsmanRuns: json["batsman_runs"],
        batsmanBalls: json["batsman_balls"],
      );

  Map<String, dynamic> toJson() => {
        "event_id": eventId,
        "event": event,
        "batsman_id": batsmanId,
        "bowler_id": bowlerId,
        "over": over,
        "ball": ball,
        "score": score,
        "commentary": commentary,
        "noball_dismissal": noballDismissal,
        "text": text,
        "timestamp": timestamp,
        "run": run,
        "noball_run": noballRun,
        "wide_run": wideRun,
        "bye_run": byeRun,
        "legbye_run": legbyeRun,
        "bat_run": batRun,
        "odds": odds,
        "xball": xball,
        "runs": runs,
        "bats": bats == null
            ? []
            : List<dynamic>.from(bats!.map((x) => x.toJson())),
        "bowls": bowls == null
            ? []
            : List<dynamic>.from(bowls!.map((x) => x.toJson())),
        "wicket_batsman_id": wicketBatsmanId,
        "how_out": howOut,
        "batsman_runs": batsmanRuns,
        "batsman_balls": batsmanBalls,
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

class Bat {
  int? runs;
  int? ballsFaced;
  int? fours;
  int? sixes;
  int? batsmanId;

  Bat({
    this.runs,
    this.ballsFaced,
    this.fours,
    this.sixes,
    this.batsmanId,
  });

  factory Bat.fromJson(Map<String, dynamic> json) => Bat(
        runs: json["runs"],
        ballsFaced: json["balls_faced"],
        fours: json["fours"],
        sixes: json["sixes"],
        batsmanId: json["batsman_id"],
      );

  Map<String, dynamic> toJson() => {
        "runs": runs,
        "balls_faced": ballsFaced,
        "fours": fours,
        "sixes": sixes,
        "batsman_id": batsmanId,
      };
}

class Bowl {
  int? runsConceded;
  int? maidens;
  int? wickets;
  int? bowlerId;
  int? overs;

  Bowl({
    this.runsConceded,
    this.maidens,
    this.wickets,
    this.bowlerId,
    this.overs,
  });

  factory Bowl.fromJson(Map<String, dynamic> json) => Bowl(
        runsConceded: json["runs_conceded"],
        maidens: json["maidens"],
        wickets: json["wickets"],
        bowlerId: json["bowler_id"],
        overs: json["overs"],
      );

  Map<String, dynamic> toJson() => {
        "runs_conceded": runsConceded,
        "maidens": maidens,
        "wickets": wickets,
        "bowler_id": bowlerId,
        "overs": overs,
      };
}

enum Event { BALL, OVEREND, WICKET }

final eventValues = EnumValues(
    {"ball": Event.BALL, "overend": Event.OVEREND, "wicket": Event.WICKET});

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
  List<Fielder>? fielder;
  Powerplay? powerplay;
  LastWicket? lastWicket;
  ExtraRuns? extraRuns;
  Equations? equations;
  CurrentPartnership? currentPartnership;
  List<DidNotBat>? didNotBat;
  String? maxOver;
  List<LiveInningBatsman>? batsmen;
  List<LiveInningBowler>? bowlers;
  List<LastWicket>? fows;

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
    this.fielder,
    this.powerplay,
    this.lastWicket,
    this.extraRuns,
    this.equations,
    this.currentPartnership,
    this.didNotBat,
    this.maxOver,
    this.batsmen,
    this.bowlers,
    this.fows,
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
        fielder: json["fielder"] == null
            ? []
            : List<Fielder>.from(
                json["fielder"]!.map((x) => Fielder.fromJson(x))),
        powerplay: json["powerplay"] == null
            ? null
            : json["powerplay"] is List
                ? null
                : Powerplay.fromJson(json["powerplay"]),
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
        batsmen: json["batsmen"] == null
            ? []
            : List<LiveInningBatsman>.from(
                json["batsmen"]!.map((x) => LiveInningBatsman.fromJson(x))),
        bowlers: json["bowlers"] == null
            ? []
            : List<LiveInningBowler>.from(
                json["bowlers"]!.map((x) => LiveInningBowler.fromJson(x))),
        fows: json["fows"] == null
            ? []
            : List<LastWicket>.from(
                json["fows"]!.map((x) => LastWicket.fromJson(x))),
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
        "fielder": fielder == null
            ? []
            : List<dynamic>.from(fielder!.map((x) => x.toJson())),
        "powerplay": powerplay?.toJson(),
        "last_wicket": lastWicket?.toJson(),
        "extra_runs": extraRuns?.toJson(),
        "equations": equations?.toJson(),
        "current_partnership": currentPartnership?.toJson(),
        "did_not_bat": didNotBat == null
            ? []
            : List<dynamic>.from(didNotBat!.map((x) => x.toJson())),
        "max_over": maxOver,
        "batsmen": batsmen == null
            ? []
            : List<dynamic>.from(batsmen!.map((x) => x.toJson())),
        "bowlers": bowlers == null
            ? []
            : List<dynamic>.from(bowlers!.map((x) => x.toJson())),
        "fows": fows == null
            ? []
            : List<dynamic>.from(fows!.map((x) => x.toJson())),
      };
}

class LiveInningBatsman {
  String? name;
  String? batsmanId;
  String? batting;
  String? position;
  Role? role;
  RoleStr? roleStr;
  String? runs;
  String? ballsFaced;
  String? fours;
  String? sixes;
  String? run0;
  String? howOut;
  String? dismissal;
  String? strikeRate;
  String? bowlerId;
  String? firstFielderId;
  String? secondFielderId;
  String? thirdFielderId;

  LiveInningBatsman({
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
    this.howOut,
    this.dismissal,
    this.strikeRate,
    this.bowlerId,
    this.firstFielderId,
    this.secondFielderId,
    this.thirdFielderId,
  });

  factory LiveInningBatsman.fromJson(Map<String, dynamic> json) =>
      LiveInningBatsman(
        name: json["name"],
        batsmanId: json["batsman_id"],
        batting: json["batting"],
        position: json["position"],
        role: roleValues.map[json["role"]]!,
        roleStr: roleStrValues.map[json["role_str"]]!,
        runs: json["runs"],
        ballsFaced: json["balls_faced"],
        fours: json["fours"],
        sixes: json["sixes"],
        run0: json["run0"],
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
        "role": roleValues.reverse[role],
        "role_str": roleStrValues.reverse[roleStr],
        "runs": runs,
        "balls_faced": ballsFaced,
        "fours": fours,
        "sixes": sixes,
        "run0": run0,
        "how_out": howOut,
        "dismissal": dismissal,
        "strike_rate": strikeRate,
        "bowler_id": bowlerId,
        "first_fielder_id": firstFielderId,
        "second_fielder_id": secondFielderId,
        "third_fielder_id": thirdFielderId,
      };
}

enum Role { ALL, BAT, BOWL, WK }

final roleValues = EnumValues(
    {"all": Role.ALL, "bat": Role.BAT, "bowl": Role.BOWL, "wk": Role.WK});

enum RoleStr { C, EMPTY, WK, WK_C }

final roleStrValues = EnumValues({
  "(C)": RoleStr.C,
  "": RoleStr.EMPTY,
  "(WK)": RoleStr.WK,
  "(WK/C)": RoleStr.WK_C
});

class LiveInningBowler {
  String? name;
  String? bowlerId;
  String? bowling;
  String? position;
  String? overs;
  String? maidens;
  String? runsConceded;
  String? wickets;
  String? noballs;
  String? wides;
  String? econ;
  String? run0;

  LiveInningBowler({
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
  });

  factory LiveInningBowler.fromJson(Map<String, dynamic> json) =>
      LiveInningBowler(
        name: json["name"],
        bowlerId: json["bowler_id"],
        bowling: json["bowling"],
        position: json["position"],
        overs: json["overs"],
        maidens: json["maidens"],
        runsConceded: json["runs_conceded"],
        wickets: json["wickets"],
        noballs: json["noballs"],
        wides: json["wides"],
        econ: json["econ"],
        run0: json["run0"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "bowler_id": bowlerId,
        "bowling": bowling,
        "position": position,
        "overs": overs,
        "maidens": maidens,
        "runs_conceded": runsConceded,
        "wickets": wickets,
        "noballs": noballs,
        "wides": wides,
        "econ": econ,
        "run0": run0,
      };
}

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
  int? stumping;
  String? isSubstitute;

  Fielder({
    this.fielderId,
    this.fielderName,
    this.catches,
    this.stumping,
    this.isSubstitute,
  });

  factory Fielder.fromJson(Map<String, dynamic> json) => Fielder(
        fielderId: json["fielder_id"],
        fielderName: json["fielder_name"],
        catches: json["catches"],
        stumping: json["stumping"],
        isSubstitute: json["is_substitute"],
      );

  Map<String, dynamic> toJson() => {
        "fielder_id": fielderId,
        "fielder_name": fielderName,
        "catches": catches,
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

class LiveScore {
  int? runs;
  double? overs;
  int? wickets;
  int? target;
  double? runrate;
  double? requiredRunrate;

  LiveScore({
    this.runs,
    this.overs,
    this.wickets,
    this.target,
    this.runrate,
    this.requiredRunrate,
  });

  factory LiveScore.fromJson(Map<String, dynamic> json) => LiveScore(
        runs: json["runs"],
        overs: json["overs"]?.toDouble(),
        wickets: json["wickets"],
        target: json["target"],
        runrate: json["runrate"]?.toDouble(),
        requiredRunrate: json["required_runrate"] is String
            ? null
            : json["required_runrate"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "runs": runs,
        "overs": overs,
        "wickets": wickets,
        "target": target,
        "runrate": runrate,
        "required_runrate": requiredRunrate,
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

class MatchInfo {
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
  int? gameState;
  String? gameStateStr;
  String? domestic;
  Competition? competition;
  MatchInfoTeama? teama;
  MatchInfoTeama? teamb;
  DateTime? dateStart;
  DateTime? dateEnd;
  int? timestampStart;
  int? timestampEnd;
  DateTime? dateStartIst;
  DateTime? dateEndIst;
  Venue? venue;
  String? umpires;
  dynamic referee;
  String? equation;
  String? live;
  String? result;
  dynamic resultType;
  String? winMargin;
  int? winningTeamId;
  int? commentary;
  int? wagon;
  int? latestInningNumber;
  String? oddstype;
  Toss? toss;

  MatchInfo({
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
    this.oddstype,
    this.toss,
  });

  factory MatchInfo.fromJson(Map<String, dynamic> json) => MatchInfo(
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
        gameState: json["game_state"],
        gameStateStr: json["game_state_str"],
        domestic: json["domestic"],
        competition: json["competition"] == null
            ? null
            : Competition.fromJson(json["competition"]),
        teama: json["teama"] == null
            ? null
            : MatchInfoTeama.fromJson(json["teama"]),
        teamb: json["teamb"] == null
            ? null
            : MatchInfoTeama.fromJson(json["teamb"]),
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
        oddstype: json["oddstype"],
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
        "oddstype": oddstype,
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

class MatchPlaying11 {
  MatchPlaying11Teama? teama;
  MatchPlaying11Teama? teamb;

  MatchPlaying11({
    this.teama,
    this.teamb,
  });

  factory MatchPlaying11.fromJson(Map<String, dynamic> json) => MatchPlaying11(
        teama: json["teama"] == null
            ? null
            : MatchPlaying11Teama.fromJson(json["teama"]),
        teamb: json["teamb"] == null
            ? null
            : MatchPlaying11Teama.fromJson(json["teamb"]),
      );

  Map<String, dynamic> toJson() => {
        "teama": teama?.toJson(),
        "teamb": teamb?.toJson(),
      };
}

class MatchPlaying11Teama {
  int? teamId;
  List<Squad>? squads;

  MatchPlaying11Teama({
    this.teamId,
    this.squads,
  });

  factory MatchPlaying11Teama.fromJson(Map<String, dynamic> json) =>
      MatchPlaying11Teama(
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
  RoleStr? roleStr;
  Role? role;
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
        roleStr: roleStrValues.map[json["role_str"]]!,
        role: roleValues.map[json["role"]]!,
        playing11: json["playing11"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "player_id": playerId,
        "substitute": substitute,
        "out": out,
        "in": squadIn,
        "role_str": roleStrValues.reverse[roleStr],
        "role": roleValues.reverse[role],
        "playing11": playing11,
        "name": name,
      };
}

enum BattingStyle { EMPTY, LEFT_HAND_BAT, RIGHT_HAND_BAT }

final battingStyleValues = EnumValues({
  "": BattingStyle.EMPTY,
  "Left hand Bat": BattingStyle.LEFT_HAND_BAT,
  "Right Hand Bat": BattingStyle.RIGHT_HAND_BAT
});

enum FieldingPosition {
  EMPTY,
  FIELDING_POSITION_WICKETKEEPER,
  WICKETKEEPER,
  WICKET_KEEPER
}

final fieldingPositionValues = EnumValues({
  "": FieldingPosition.EMPTY,
  "wicketkeeper": FieldingPosition.FIELDING_POSITION_WICKETKEEPER,
  "Wicketkeeper": FieldingPosition.WICKETKEEPER,
  "Wicket keeper": FieldingPosition.WICKET_KEEPER
});

class Scorecard {
  List<Inning>? innings;
  int? isFollowon;
  String? dayRemainingOver;

  Scorecard({
    this.innings,
    this.isFollowon,
    this.dayRemainingOver,
  });

  factory Scorecard.fromJson(Map<String, dynamic> json) => Scorecard(
        innings: json["innings"] == null
            ? []
            : List<Inning>.from(
                json["innings"]!.map((x) => Inning.fromJson(x))),
        isFollowon: json["is_followon"],
        dayRemainingOver: json["day_remaining_over"],
      );

  Map<String, dynamic> toJson() => {
        "innings": innings == null
            ? []
            : List<dynamic>.from(innings!.map((x) => x.toJson())),
        "is_followon": isFollowon,
        "day_remaining_over": dayRemainingOver,
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

// To parse this JSON data, do
//
//     final commentaryPage = commentaryPageFromJson(jsonString);

import 'dart:convert';

import 'live_matchh_detail_page.dart';

CommentaryPage commentaryPageFromJson(String str) =>
    CommentaryPage.fromJson(json.decode(str));

String commentaryPageToJson(CommentaryPage data) => json.encode(data.toJson());

class CommentaryPage {
  String? status;
  CommentaryModel? response;
  String? etag;
  DateTime? modified;
  DateTime? datetime;
  String? apiVersion;

  CommentaryPage({
    this.status,
    this.response,
    this.etag,
    this.modified,
    this.datetime,
    this.apiVersion,
  });

  factory CommentaryPage.fromJson(Map<String, dynamic> json) => CommentaryPage(
        status: json["status"],
        response: json["response"] == null
            ? null
            : json["response"] is String
                ? null
                : CommentaryModel.fromJson(json["response"]),
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

class CommentaryModel {
  MatchName? match;
  Inning? inning;
  List<Commentary>? commentaries;
  List<Team>? teams;
  List<Player>? players;

  CommentaryModel({
    this.match,
    this.inning,
    this.commentaries,
    this.teams,
    this.players,
  });

  factory CommentaryModel.fromJson(Map<String, dynamic> json) =>
      CommentaryModel(
        match: json["match"] == null ? null : MatchName.fromJson(json["match"]),
        inning: json["inning"] == null ? null : Inning.fromJson(json["inning"]),
        commentaries: json["commentaries"] == null
            ? []
            : List<Commentary>.from(
                json["commentaries"]!.map((x) => Commentary.fromJson(x))),
        teams: json["teams"] == null
            ? []
            : List<Team>.from(json["teams"]!.map((x) => Team.fromJson(x))),
        players: json["players"] == null
            ? []
            : List<Player>.from(
                json["players"]!.map((x) => Player.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "match": match?.toJson(),
        "inning": inning?.toJson(),
        "commentaries": commentaries == null
            ? []
            : List<dynamic>.from(commentaries!.map((x) => x.toJson())),
        "teams": teams == null
            ? []
            : List<dynamic>.from(teams!.map((x) => x.toJson())),
        "players": players == null
            ? []
            : List<dynamic>.from(players!.map((x) => x.toJson())),
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
  bool? noball;
  bool? wideball;
  bool? six;
  bool? four;
  List<Bat>? batsmen;
  List<Bowl>? bowlers;
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
    this.noball,
    this.wideball,
    this.six,
    this.four,
    this.batsmen,
    this.bowlers,
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
        noball: json["noball"],
        wideball: json["wideball"],
        six: json["six"],
        four: json["four"],
        batsmen: json["batsmen"] == null
            ? []
            : List<Bat>.from(json["batsmen"]!.map((x) => Bat.fromJson(x))),
        bowlers: json["bowlers"] == null
            ? []
            : List<Bowl>.from(json["bowlers"]!.map((x) => Bowl.fromJson(x))),
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
        "noball": noball,
        "wideball": wideball,
        "six": six,
        "four": four,
        "batsmen": batsmen == null
            ? []
            : List<dynamic>.from(batsmen!.map((x) => x.toJson())),
        "bowlers": bowlers == null
            ? []
            : List<dynamic>.from(bowlers!.map((x) => x.toJson())),
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
  double? overs;

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
        overs: json["overs"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "runs_conceded": runsConceded,
        "maidens": maidens,
        "wickets": wickets,
        "bowler_id": bowlerId,
        "overs": overs,
      };
}

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
  List<Batsman>? batsmen;
  List<Bowler>? bowlers;
  List<Fielder>? fielder;
  Powerplay? powerplay;
  Review? review;
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
    this.powerplay,
    this.review,
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
            : List<Batsman>.from(
                json["batsmen"]!.map((x) => Batsman.fromJson(x))),
        bowlers: json["bowlers"] == null
            ? []
            : List<Bowler>.from(
                json["bowlers"]!.map((x) => Bowler.fromJson(x))),
        fielder: json["fielder"] == null
            ? []
            : List<Fielder>.from(
                json["fielder"]!.map((x) => Fielder.fromJson(x))),
        powerplay: json["powerplay"] == null
            ? null
            : Powerplay.fromJson(json["powerplay"]),
        review: json["review"] == null ? null : Review.fromJson(json["review"]),
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
        "powerplay": powerplay?.toJson(),
        "review": review?.toJson(),
        "did_not_bat": didNotBat == null
            ? []
            : List<dynamic>.from(didNotBat!.map((x) => x.toJson())),
        "max_over": maxOver,
        "target": target,
      };
}

class Batsman {
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

  Batsman({
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

  factory Batsman.fromJson(Map<String, dynamic> json) => Batsman(
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

final roleStrValues =
    EnumValues({"(C)": RoleStr.C, "": RoleStr.EMPTY, "(WK)": RoleStr.WK});

class Bowler {
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
        position: json["position"],
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
        "position": position,
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

class MatchName {
  int? status;
  int? gameState;

  MatchName({
    this.status,
    this.gameState,
  });

  factory MatchName.fromJson(Map<String, dynamic> json) => MatchName(
        status: json["status"],
        gameState: json["game_state"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "game_state": gameState,
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

class Team {
  int? tid;
  String? title;
  String? abbr;
  String? altName;
  String? type;
  String? thumbUrl;
  String? logoUrl;
  String? country;
  String? sex;

  Team({
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

  factory Team.fromJson(Map<String, dynamic> json) => Team(
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

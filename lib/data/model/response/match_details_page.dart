// To parse this JSON data, do
//
//     final matchDetailsPage = matchDetailsPageFromJson(jsonString);

import 'dart:convert';

MatchDetailsPage matchDetailsPageFromJson(String str) =>
    MatchDetailsPage.fromJson(json.decode(str));

String matchDetailsPageToJson(MatchDetailsPage data) =>
    json.encode(data.toJson());

class MatchDetailsPage {
  MatchDetailsModel? data;
  Cache? cache;
  Schema? schema;
  dynamic error;
  int? httpStatusCode;

  MatchDetailsPage({
    this.data,
    this.cache,
    this.schema,
    this.error,
    this.httpStatusCode,
  });

  factory MatchDetailsPage.fromJson(Map<String, dynamic> json) =>
      MatchDetailsPage(
        data: json["data"] == null
            ? null
            : MatchDetailsModel.fromJson(json["data"]),
        cache: json["cache"] == null ? null : Cache.fromJson(json["cache"]),
        schema: json["schema"] == null ? null : Schema.fromJson(json["schema"]),
        error: json["error"],
        httpStatusCode: json["http_status_code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "cache": cache?.toJson(),
        "schema": schema?.toJson(),
        "error": error,
        "http_status_code": httpStatusCode,
      };
}

class Cache {
  String? key;
  double? expires;
  String? etag;
  int? maxAge;

  Cache({
    this.key,
    this.expires,
    this.etag,
    this.maxAge,
  });

  factory Cache.fromJson(Map<String, dynamic> json) => Cache(
        key: json["key"],
        expires: json["expires"]?.toDouble(),
        etag: json["etag"],
        maxAge: json["max_age"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "expires": expires,
        "etag": etag,
        "max_age": maxAge,
      };
}

class MatchDetailsModel {
  String? key;
  String? name;
  String? shortName;
  String? subTitle;
  String? status;
  int? startAt;
  Tournament? tournament;
  String? metricGroup;
  String? sport;
  Winner? winner;
  Teams? teams;
  Venue? venue;
  Association? association;
  List<dynamic>? messages;
  Gender? gender;
  String? format;
  String? title;
  String? playStatus;
  int? startAtLocal;
  dynamic expectedStartAt;
  Toss? toss;
  Play? play;
  Players? players;
  List<dynamic>? notes;
  DataReview? dataReview;
  Squad? squad;
  int? estimatedEndDate;
  double? completedDateApproximate;
  Umpires? umpires;
  String? weather;

  MatchDetailsModel({
    this.key,
    this.name,
    this.shortName,
    this.subTitle,
    this.status,
    this.startAt,
    this.tournament,
    this.metricGroup,
    this.sport,
    this.winner,
    this.teams,
    this.venue,
    this.association,
    this.messages,
    this.gender,
    this.format,
    this.title,
    this.playStatus,
    this.startAtLocal,
    this.expectedStartAt,
    this.toss,
    this.play,
    this.players,
    this.notes,
    this.dataReview,
    this.squad,
    this.estimatedEndDate,
    this.completedDateApproximate,
    this.umpires,
    this.weather,
  });

  factory MatchDetailsModel.fromJson(Map<String, dynamic> json) =>
      MatchDetailsModel(
        key: json["key"],
        name: json["name"],
        shortName: json["short_name"],
        subTitle: json["sub_title"],
        status: json["status"],
        startAt: json["start_at"],
        tournament: json["tournament"] == null
            ? null
            : Tournament.fromJson(json["tournament"]),
        metricGroup: json["metric_group"],
        sport: json["sport"],
        winner: winnerValues.map[json["winner"]]!,
        teams: json["teams"] == null ? null : Teams.fromJson(json["teams"]),
        venue: json["venue"] == null ? null : Venue.fromJson(json["venue"]),
        association: json["association"] == null
            ? null
            : Association.fromJson(json["association"]),
        messages: json["messages"] == null
            ? []
            : List<dynamic>.from(json["messages"]!.map((x) => x)),
        gender: genderValues.map[json["gender"]]!,
        format: json["format"],
        title: json["title"],
        playStatus: json["play_status"],
        startAtLocal: json["start_at_local"],
        expectedStartAt: json["expected_start_at"],
        toss: json["toss"] == null ? null : Toss.fromJson(json["toss"]),
        play: json["play"] == null ? null : Play.fromJson(json["play"]),
        players:
            json["players"] == null ? null : Players.fromJson(json["players"]),
        notes: json["notes"] == null
            ? []
            : List<dynamic>.from(json["notes"]!.map((x) => x)),
        dataReview: json["data_review"] == null
            ? null
            : DataReview.fromJson(json["data_review"]),
        squad: json["squad"] == null ? null : Squad.fromJson(json["squad"]),
        estimatedEndDate: json["estimated_end_date"],
        completedDateApproximate:
            json["completed_date_approximate"]?.toDouble(),
        umpires:
            json["umpires"] == null ? null : Umpires.fromJson(json["umpires"]),
        weather: json["weather"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "name": name,
        "short_name": shortName,
        "sub_title": subTitle,
        "status": status,
        "start_at": startAt,
        "tournament": tournament?.toJson(),
        "metric_group": metricGroup,
        "sport": sport,
        "winner": winnerValues.reverse[winner],
        "teams": teams?.toJson(),
        "venue": venue?.toJson(),
        "association": association?.toJson(),
        "messages":
            messages == null ? [] : List<dynamic>.from(messages!.map((x) => x)),
        "gender": genderValues.reverse[gender],
        "format": format,
        "title": title,
        "play_status": playStatus,
        "start_at_local": startAtLocal,
        "expected_start_at": expectedStartAt,
        "toss": toss?.toJson(),
        "play": play?.toJson(),
        "players": players?.toJson(),
        "notes": notes == null ? [] : List<dynamic>.from(notes!.map((x) => x)),
        "data_review": dataReview?.toJson(),
        "squad": squad?.toJson(),
        "estimated_end_date": estimatedEndDate,
        "completed_date_approximate": completedDateApproximate,
        "umpires": umpires?.toJson(),
        "weather": weather,
      };
}

class Association {
  String? key;
  String? code;
  String? name;
  Country? country;
  dynamic parent;

  Association({
    this.key,
    this.code,
    this.name,
    this.country,
    this.parent,
  });

  factory Association.fromJson(Map<String, dynamic> json) => Association(
        key: json["key"],
        code: json["code"],
        name: json["name"],
        country:
            json["country"] == null ? null : Country.fromJson(json["country"]),
        parent: json["parent"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "code": code,
        "name": name,
        "country": country?.toJson(),
        "parent": parent,
      };
}

class Country {
  String? shortCode;
  String? code;
  String? name;
  String? officialName;
  bool? isRegion;

  Country({
    this.shortCode,
    this.code,
    this.name,
    this.officialName,
    this.isRegion,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        shortCode: json["short_code"],
        code: json["code"],
        name: json["name"],
        officialName: json["official_name"],
        isRegion: json["is_region"],
      );

  Map<String, dynamic> toJson() => {
        "short_code": shortCode,
        "code": code,
        "name": name,
        "official_name": officialName,
        "is_region": isRegion,
      };
}

class DataReview {
  bool? schedule;
  bool? venue;
  bool? result;
  bool? pom;
  bool? score;
  bool? players;
  bool? playingXi;
  List<dynamic>? scoreReviewedBallIndex;
  bool? teamA;
  bool? teamB;
  bool? goodToClose;
  dynamic note;

  DataReview({
    this.schedule,
    this.venue,
    this.result,
    this.pom,
    this.score,
    this.players,
    this.playingXi,
    this.scoreReviewedBallIndex,
    this.teamA,
    this.teamB,
    this.goodToClose,
    this.note,
  });

  factory DataReview.fromJson(Map<String, dynamic> json) => DataReview(
        schedule: json["schedule"],
        venue: json["venue"],
        result: json["result"],
        pom: json["pom"],
        score: json["score"],
        players: json["players"],
        playingXi: json["playing_xi"],
        scoreReviewedBallIndex: json["score_reviewed_ball_index"] == null
            ? []
            : List<dynamic>.from(
                json["score_reviewed_ball_index"]!.map((x) => x)),
        teamA: json["team_a"],
        teamB: json["team_b"],
        goodToClose: json["good_to_close"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "schedule": schedule,
        "venue": venue,
        "result": result,
        "pom": pom,
        "score": score,
        "players": players,
        "playing_xi": playingXi,
        "score_reviewed_ball_index": scoreReviewedBallIndex == null
            ? []
            : List<dynamic>.from(scoreReviewedBallIndex!.map((x) => x)),
        "team_a": teamA,
        "team_b": teamB,
        "good_to_close": goodToClose,
        "note": note,
      };
}

enum InningsOrder { A_1, B_1 }

final inningsOrderValues =
    EnumValues({"a_1": InningsOrder.A_1, "b_1": InningsOrder.B_1});

enum Gender { MALE }

final genderValues = EnumValues({"male": Gender.MALE});

class Play {
  Winner? firstBatting;
  int? dayNumber;
  List<int>? oversPerInnings;
  dynamic reducedOvers;
  Target? target;
  Result? result;
  List<InningsOrder>? inningsOrder;
  Innings? innings;
  dynamic live;
  Map<String, RelatedBall>? relatedBalls;

  Play({
    this.firstBatting,
    this.dayNumber,
    this.oversPerInnings,
    this.reducedOvers,
    this.target,
    this.result,
    this.inningsOrder,
    this.innings,
    this.live,
    this.relatedBalls,
  });

  factory Play.fromJson(Map<String, dynamic> json) => Play(
        firstBatting: winnerValues.map[json["first_batting"]]!,
        dayNumber: json["day_number"],
        oversPerInnings: json["overs_per_innings"] == null
            ? []
            : List<int>.from(json["overs_per_innings"]!.map((x) => x)),
        reducedOvers: json["reduced_overs"],
        target: json["target"] == null ? null : Target.fromJson(json["target"]),
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
        inningsOrder: json["innings_order"] == null
            ? []
            : List<InningsOrder>.from(
                json["innings_order"]!.map((x) => inningsOrderValues.map[x]!)),
        innings:
            json["innings"] == null ? null : Innings.fromJson(json["innings"]),
        live: json["live"],
        relatedBalls: Map.from(json["related_balls"]!).map((k, v) =>
            MapEntry<String, RelatedBall>(k, RelatedBall.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "first_batting": winnerValues.reverse[firstBatting],
        "day_number": dayNumber,
        "overs_per_innings": oversPerInnings == null
            ? []
            : List<dynamic>.from(oversPerInnings!.map((x) => x)),
        "reduced_overs": reducedOvers,
        "target": target?.toJson(),
        "result": result?.toJson(),
        "innings_order": inningsOrder == null
            ? []
            : List<dynamic>.from(
                inningsOrder!.map((x) => inningsOrderValues.reverse[x])),
        "innings": innings?.toJson(),
        "live": live,
        "related_balls": Map.from(relatedBalls!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

enum Winner { A, B }

final winnerValues = EnumValues({"a": Winner.A, "b": Winner.B});

class Innings {
  A1? b1;
  A1? a1;

  Innings({
    this.b1,
    this.a1,
  });

  factory Innings.fromJson(Map<String, dynamic> json) => Innings(
        b1: json["b_1"] == null ? null : A1.fromJson(json["b_1"]),
        a1: json["a_1"] == null ? null : A1.fromJson(json["a_1"]),
      );

  Map<String, dynamic> toJson() => {
        "b_1": b1?.toJson(),
        "a_1": a1?.toJson(),
      };
}

class A1 {
  InningsOrder? index;
  List<int>? overs;
  bool? isCompleted;
  String? scoreStr;
  PlayerAScoreClass? score;
  ScoreBreakupDetail? scoreBreakupDetail;
  int? wickets;
  ExtraRuns? extraRuns;
  A1BallsBreakup? ballsBreakup;
  List<String>? battingOrder;
  List<String>? bowlingOrder;
  List<String>? wicketOrder;
  List<Partnership>? partnerships;

  A1({
    this.index,
    this.overs,
    this.isCompleted,
    this.scoreStr,
    this.score,
    this.scoreBreakupDetail,
    this.wickets,
    this.extraRuns,
    this.ballsBreakup,
    this.battingOrder,
    this.bowlingOrder,
    this.wicketOrder,
    this.partnerships,
  });

  factory A1.fromJson(Map<String, dynamic> json) => A1(
        index: inningsOrderValues.map[json["index"]]!,
        overs: json["overs"] == null
            ? []
            : List<int>.from(json["overs"]!.map((x) => x)),
        isCompleted: json["is_completed"],
        scoreStr: json["score_str"],
        score: json["score"] == null
            ? null
            : PlayerAScoreClass.fromJson(json["score"]),
        scoreBreakupDetail: json["score_breakup_detail"] == null
            ? null
            : ScoreBreakupDetail.fromJson(json["score_breakup_detail"]),
        wickets: json["wickets"],
        extraRuns: json["extra_runs"] == null
            ? null
            : ExtraRuns.fromJson(json["extra_runs"]),
        ballsBreakup: json["balls_breakup"] == null
            ? null
            : A1BallsBreakup.fromJson(json["balls_breakup"]),
        battingOrder: json["batting_order"] == null
            ? []
            : List<String>.from(json["batting_order"]!.map((x) => x)),
        bowlingOrder: json["bowling_order"] == null
            ? []
            : List<String>.from(json["bowling_order"]!.map((x) => x)),
        wicketOrder: json["wicket_order"] == null
            ? []
            : List<String>.from(json["wicket_order"]!.map((x) => x)),
        partnerships: json["partnerships"] == null
            ? []
            : List<Partnership>.from(
                json["partnerships"]!.map((x) => Partnership.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "index": inningsOrderValues.reverse[index],
        "overs": overs == null ? [] : List<dynamic>.from(overs!.map((x) => x)),
        "is_completed": isCompleted,
        "score_str": scoreStr,
        "score": score?.toJson(),
        "score_breakup_detail": scoreBreakupDetail?.toJson(),
        "wickets": wickets,
        "extra_runs": extraRuns?.toJson(),
        "balls_breakup": ballsBreakup?.toJson(),
        "batting_order": battingOrder == null
            ? []
            : List<dynamic>.from(battingOrder!.map((x) => x)),
        "bowling_order": bowlingOrder == null
            ? []
            : List<dynamic>.from(bowlingOrder!.map((x) => x)),
        "wicket_order": wicketOrder == null
            ? []
            : List<dynamic>.from(wicketOrder!.map((x) => x)),
        "partnerships": partnerships == null
            ? []
            : List<dynamic>.from(partnerships!.map((x) => x.toJson())),
      };
}

class A1BallsBreakup {
  int? balls;
  int? dotBalls;
  int? wides;
  int? noBalls;

  A1BallsBreakup({
    this.balls,
    this.dotBalls,
    this.wides,
    this.noBalls,
  });

  factory A1BallsBreakup.fromJson(Map<String, dynamic> json) => A1BallsBreakup(
        balls: json["balls"],
        dotBalls: json["dot_balls"],
        wides: json["wides"],
        noBalls: json["no_balls"],
      );

  Map<String, dynamic> toJson() => {
        "balls": balls,
        "dot_balls": dotBalls,
        "wides": wides,
        "no_balls": noBalls,
      };
}

class ExtraRuns {
  int? extra;
  int? bye;
  int? legBye;
  int? wide;
  int? noBall;
  int? penalty;

  ExtraRuns({
    this.extra,
    this.bye,
    this.legBye,
    this.wide,
    this.noBall,
    this.penalty,
  });

  factory ExtraRuns.fromJson(Map<String, dynamic> json) => ExtraRuns(
        extra: json["extra"],
        bye: json["bye"],
        legBye: json["leg_bye"],
        wide: json["wide"],
        noBall: json["no_ball"],
        penalty: json["penalty"],
      );

  Map<String, dynamic> toJson() => {
        "extra": extra,
        "bye": bye,
        "leg_bye": legBye,
        "wide": wide,
        "no_ball": noBall,
        "penalty": penalty,
      };
}

class Partnership {
  List<int>? beginOvers;
  List<int>? endOvers;
  String? playerAKey;
  PlayerAScoreClass? playerAScore;
  String? playerBKey;
  PlayerAScoreClass? playerBScore;
  PlayerAScoreClass? score;
  bool? isCompleted;

  Partnership({
    this.beginOvers,
    this.endOvers,
    this.playerAKey,
    this.playerAScore,
    this.playerBKey,
    this.playerBScore,
    this.score,
    this.isCompleted,
  });

  factory Partnership.fromJson(Map<String, dynamic> json) => Partnership(
        beginOvers: json["begin_overs"] == null
            ? []
            : List<int>.from(json["begin_overs"]!.map((x) => x)),
        endOvers: json["end_overs"] == null
            ? []
            : List<int>.from(json["end_overs"]!.map((x) => x)),
        playerAKey: json["player_a_key"],
        playerAScore: json["player_a_score"] == null
            ? null
            : PlayerAScoreClass.fromJson(json["player_a_score"]),
        playerBKey: json["player_b_key"],
        playerBScore: json["player_b_score"] == null
            ? null
            : PlayerAScoreClass.fromJson(json["player_b_score"]),
        score: json["score"] == null
            ? null
            : PlayerAScoreClass.fromJson(json["score"]),
        isCompleted: json["is_completed"],
      );

  Map<String, dynamic> toJson() => {
        "begin_overs": beginOvers == null
            ? []
            : List<dynamic>.from(beginOvers!.map((x) => x)),
        "end_overs":
            endOvers == null ? [] : List<dynamic>.from(endOvers!.map((x) => x)),
        "player_a_key": playerAKey,
        "player_a_score": playerAScore?.toJson(),
        "player_b_key": playerBKey,
        "player_b_score": playerBScore?.toJson(),
        "score": score?.toJson(),
        "is_completed": isCompleted,
      };
}

class PlayerAScoreClass {
  int? runs;
  int? balls;
  int? fours;
  int? sixes;
  double? runRate;
  int? dotBalls;
  double? strikeRate;

  PlayerAScoreClass({
    this.runs,
    this.balls,
    this.fours,
    this.sixes,
    this.runRate,
    this.dotBalls,
    this.strikeRate,
  });

  factory PlayerAScoreClass.fromJson(Map<String, dynamic> json) =>
      PlayerAScoreClass(
        runs: json["runs"],
        balls: json["balls"],
        fours: json["fours"],
        sixes: json["sixes"],
        runRate: json["run_rate"]?.toDouble(),
        dotBalls: json["dot_balls"],
        strikeRate: json["strike_rate"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "runs": runs,
        "balls": balls,
        "fours": fours,
        "sixes": sixes,
        "run_rate": runRate,
        "dot_balls": dotBalls,
        "strike_rate": strikeRate,
      };
}

class ScoreBreakupDetail {
  bool? available;
  int? ones;
  int? twos;
  int? threes;
  int? fours;
  int? fives;
  int? sixes;
  int? fourBoundaries;
  int? sixBoundaries;

  ScoreBreakupDetail({
    this.available,
    this.ones,
    this.twos,
    this.threes,
    this.fours,
    this.fives,
    this.sixes,
    this.fourBoundaries,
    this.sixBoundaries,
  });

  factory ScoreBreakupDetail.fromJson(Map<String, dynamic> json) =>
      ScoreBreakupDetail(
        available: json["available"],
        ones: json["ones"],
        twos: json["twos"],
        threes: json["threes"],
        fours: json["fours"],
        fives: json["fives"],
        sixes: json["sixes"],
        fourBoundaries: json["four_boundaries"],
        sixBoundaries: json["six_boundaries"],
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "ones": ones,
        "twos": twos,
        "threes": threes,
        "fours": fours,
        "fives": fives,
        "sixes": sixes,
        "four_boundaries": fourBoundaries,
        "six_boundaries": sixBoundaries,
      };
}

class RelatedBall {
  String? key;
  BallType? ballType;
  Winner? battingTeam;
  String? comment;
  InningsOrder? innings;
  List<int>? overs;
  Batsman? batsman;
  Bowler? bowler;
  Bowler? teamScore;
  List<Fielder>? fielders;
  Wicket? wicket;
  String? nonStrikerKey;
  double? entryTime;
  BallPlayStatus? ballPlayStatus;
  List<dynamic>? ballTags;
  double? updatedTime;

  RelatedBall({
    this.key,
    this.ballType,
    this.battingTeam,
    this.comment,
    this.innings,
    this.overs,
    this.batsman,
    this.bowler,
    this.teamScore,
    this.fielders,
    this.wicket,
    this.nonStrikerKey,
    this.entryTime,
    this.ballPlayStatus,
    this.ballTags,
    this.updatedTime,
  });

  factory RelatedBall.fromJson(Map<String, dynamic> json) => RelatedBall(
        key: json["key"],
        ballType: ballTypeValues.map[json["ball_type"]]!,
        battingTeam: winnerValues.map[json["batting_team"]]!,
        comment: json["comment"],
        innings: inningsOrderValues.map[json["innings"]]!,
        overs: json["overs"] == null
            ? []
            : List<int>.from(json["overs"]!.map((x) => x)),
        batsman:
            json["batsman"] == null ? null : Batsman.fromJson(json["batsman"]),
        bowler: json["bowler"] == null ? null : Bowler.fromJson(json["bowler"]),
        teamScore: json["team_score"] == null
            ? null
            : Bowler.fromJson(json["team_score"]),
        fielders: json["fielders"] == null
            ? []
            : List<Fielder>.from(
                json["fielders"]!.map((x) => Fielder.fromJson(x))),
        wicket: json["wicket"] == null ? null : Wicket.fromJson(json["wicket"]),
        nonStrikerKey: json["non_striker_key"],
        entryTime: json["entry_time"]?.toDouble(),
        ballPlayStatus: ballPlayStatusValues.map[json["ball_play_status"]]!,
        ballTags: json["ball_tags"] == null
            ? []
            : List<dynamic>.from(json["ball_tags"]!.map((x) => x)),
        updatedTime: json["updated_time"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "ball_type": ballTypeValues.reverse[ballType],
        "batting_team": winnerValues.reverse[battingTeam],
        "comment": comment,
        "innings": inningsOrderValues.reverse[innings],
        "overs": overs == null ? [] : List<dynamic>.from(overs!.map((x) => x)),
        "batsman": batsman?.toJson(),
        "bowler": bowler?.toJson(),
        "team_score": teamScore?.toJson(),
        "fielders": fielders == null
            ? []
            : List<dynamic>.from(fielders!.map((x) => x.toJson())),
        "wicket": wicket?.toJson(),
        "non_striker_key": nonStrikerKey,
        "entry_time": entryTime,
        "ball_play_status": ballPlayStatusValues.reverse[ballPlayStatus],
        "ball_tags":
            ballTags == null ? [] : List<dynamic>.from(ballTags!.map((x) => x)),
        "updated_time": updatedTime,
      };
}

enum BallPlayStatus { NON_PLAY_EVENT, PLAYED }

final ballPlayStatusValues = EnumValues({
  "non_play_event": BallPlayStatus.NON_PLAY_EVENT,
  "played": BallPlayStatus.PLAYED
});

enum BallType { LEG_BYE, NORMAL, WIDE }

final ballTypeValues = EnumValues({
  "leg_bye": BallType.LEG_BYE,
  "normal": BallType.NORMAL,
  "wide": BallType.WIDE
});

class Batsman {
  String? playerKey;
  int? ballCount;
  int? runs;
  bool? isDotBall;
  bool? isFour;
  bool? isSix;

  Batsman({
    this.playerKey,
    this.ballCount,
    this.runs,
    this.isDotBall,
    this.isFour,
    this.isSix,
  });

  factory Batsman.fromJson(Map<String, dynamic> json) => Batsman(
        playerKey: json["player_key"],
        ballCount: json["ball_count"],
        runs: json["runs"],
        isDotBall: json["is_dot_ball"],
        isFour: json["is_four"],
        isSix: json["is_six"],
      );

  Map<String, dynamic> toJson() => {
        "player_key": playerKey,
        "ball_count": ballCount,
        "runs": runs,
        "is_dot_ball": isDotBall,
        "is_four": isFour,
        "is_six": isSix,
      };
}

class Bowler {
  String? playerKey;
  int? ballCount;
  int? runs;
  int? extras;
  bool? isWicket;

  Bowler({
    this.playerKey,
    this.ballCount,
    this.runs,
    this.extras,
    this.isWicket,
  });

  factory Bowler.fromJson(Map<String, dynamic> json) => Bowler(
        playerKey: json["player_key"],
        ballCount: json["ball_count"],
        runs: json["runs"],
        extras: json["extras"],
        isWicket: json["is_wicket"],
      );

  Map<String, dynamic> toJson() => {
        "player_key": playerKey,
        "ball_count": ballCount,
        "runs": runs,
        "extras": extras,
        "is_wicket": isWicket,
      };
}

class Fielder {
  String? playerKey;
  bool? isRunOut;
  bool? isStumps;
  bool? isCatch;
  bool? isAssists;

  Fielder({
    this.playerKey,
    this.isRunOut,
    this.isStumps,
    this.isCatch,
    this.isAssists,
  });

  factory Fielder.fromJson(Map<String, dynamic> json) => Fielder(
        playerKey: json["player_key"],
        isRunOut: json["is_run_out"],
        isStumps: json["is_stumps"],
        isCatch: json["is_catch"],
        isAssists: json["is_assists"],
      );

  Map<String, dynamic> toJson() => {
        "player_key": playerKey,
        "is_run_out": isRunOut,
        "is_stumps": isStumps,
        "is_catch": isCatch,
        "is_assists": isAssists,
      };
}

class Wicket {
  String? playerKey;
  WicketType? wicketType;

  Wicket({
    this.playerKey,
    this.wicketType,
  });

  factory Wicket.fromJson(Map<String, dynamic> json) => Wicket(
        playerKey: json["player_key"],
        wicketType: wicketTypeValues.map[json["wicket_type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "player_key": playerKey,
        "wicket_type": wicketTypeValues.reverse[wicketType],
      };
}

enum WicketType { BOWLED, CAUGHT, RUN_OUT }

final wicketTypeValues = EnumValues({
  "bowled": WicketType.BOWLED,
  "caught": WicketType.CAUGHT,
  "run_out": WicketType.RUN_OUT
});

class Result {
  List<String>? pom;
  Winner? winner;
  String? resultType;
  int? winBy;
  String? msg;

  Result({
    this.pom,
    this.winner,
    this.resultType,
    this.winBy,
    this.msg,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        pom: json["pom"] == null
            ? []
            : List<String>.from(json["pom"]!.map((x) => x)),
        winner: winnerValues.map[json["winner"]]!,
        resultType: json["result_type"],
        winBy: json["win_by"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "pom": pom == null ? [] : List<dynamic>.from(pom!.map((x) => x)),
        "winner": winnerValues.reverse[winner],
        "result_type": resultType,
        "win_by": winBy,
        "msg": msg,
      };
}

class Target {
  int? balls;
  int? runs;
  bool? dlApplied;

  Target({
    this.balls,
    this.runs,
    this.dlApplied,
  });

  factory Target.fromJson(Map<String, dynamic> json) => Target(
        balls: json["balls"],
        runs: json["runs"],
        dlApplied: json["dl_applied"],
      );

  Map<String, dynamic> toJson() => {
        "balls": balls,
        "runs": runs,
        "dl_applied": dlApplied,
      };
}

class Players {
  ARzCricketSjTgCk? aRzCricketSjTgCk;
  ARzCricketSjTgCk? vyVijaykumar;
  ARzCricketSjTgCk? dHooda;
  CPlayerAnujRawat2A356? mLomror;
  ARzCricketSjTgCk? cPlayerAkashDeep2F13F;
  ARzCricketSjTgCk? aTurner;
  ARzCricketSjTgCk? kGowtham;
  ARzCricketSjTgCk? locFerguson;
  ARzCricketSjTgCk? cPlayerArshadKhan9C18B;
  ARzCricketSjTgCk? cPlayerYudhvirSinghF1B27;
  ARzCricketSjTgCk? sMavi;
  ARzCricketSjTgCk? aMishra;
  ARzCricketSjTgCk? cPlayerSuyashPrabhudessaiE64C9;
  ARzCricketSjTgCk? cPlayerSauravChauhan782Db;
  ARzCricketSjTgCk? swSingh;
  ARzCricketSjTgCk? manBhandge;
  ARzCricketSjTgCk? cPlayerHimanshuSharma9D59D;
  ARzCricketSjTgCk? cPlayerRajanKumar696Dd;
  ARzCricketSjTgCk? cPlayerArshinKulkarni2B67F;
  ARzCricketSjTgCk? pnMankad;
  ARzCricketSjTgCk? mHenry;
  ARzCricketSjTgCk? kSharma;
  ARzCricketSjTgCk? kMayers;
  CPlayerAnujRawat2A356? duPlessis;
  CPlayerAnujRawat2A356? vKohli;
  CPlayerAnujRawat2A356? cPlayerRajatPatidar62629;
  CPlayerAnujRawat2A356? gMaxwell;
  CPlayerAnujRawat2A356? camGreen;
  CPlayerAnujRawat2A356? dKarthik;
  CPlayerAnujRawat2A356? cPlayerAnujRawat2A356;
  CPlayerAnujRawat2A356? myDagar;
  CPlayerAnujRawat2A356? mSiraj;
  CPlayerAnujRawat2A356? cPlayerYashDayal75Ffe;
  CPlayerAnujRawat2A356? lRahul;
  CPlayerAnujRawat2A356? deKock;
  CPlayerAnujRawat2A356? dPadikal;
  CPlayerAnujRawat2A356? mStoinis;
  CPlayerAnujRawat2A356? nPooran;
  CPlayerAnujRawat2A356? cPlayerAyushBadoniEa723;
  CPlayerAnujRawat2A356? kPandya;
  CPlayerAnujRawat2A356? cPlayerRaviBishnoi8A9Ae;
  CPlayerAnujRawat2A356? cPlayerYashThakur7001D;
  CPlayerAnujRawat2A356? cPlayerMayankYadav3Ce36;
  CPlayerAnujRawat2A356? navUlhaq;
  CPlayerAnujRawat2A356? rTopley;
  ARzCricketSjTgCk? tkCurran;
  ARzCricketSjTgCk? willJacks;
  ARzCricketSjTgCk? alJoseph;
  ARzCricketSjTgCk? cPlayerMohsinKhan2A13E;
  CPlayerAnujRawat2A356? mSiddharth;

  Players({
    this.aRzCricketSjTgCk,
    this.vyVijaykumar,
    this.dHooda,
    this.mLomror,
    this.cPlayerAkashDeep2F13F,
    this.aTurner,
    this.kGowtham,
    this.locFerguson,
    this.cPlayerArshadKhan9C18B,
    this.cPlayerYudhvirSinghF1B27,
    this.sMavi,
    this.aMishra,
    this.cPlayerSuyashPrabhudessaiE64C9,
    this.cPlayerSauravChauhan782Db,
    this.swSingh,
    this.manBhandge,
    this.cPlayerHimanshuSharma9D59D,
    this.cPlayerRajanKumar696Dd,
    this.cPlayerArshinKulkarni2B67F,
    this.pnMankad,
    this.mHenry,
    this.kSharma,
    this.kMayers,
    this.duPlessis,
    this.vKohli,
    this.cPlayerRajatPatidar62629,
    this.gMaxwell,
    this.camGreen,
    this.dKarthik,
    this.cPlayerAnujRawat2A356,
    this.myDagar,
    this.mSiraj,
    this.cPlayerYashDayal75Ffe,
    this.lRahul,
    this.deKock,
    this.dPadikal,
    this.mStoinis,
    this.nPooran,
    this.cPlayerAyushBadoniEa723,
    this.kPandya,
    this.cPlayerRaviBishnoi8A9Ae,
    this.cPlayerYashThakur7001D,
    this.cPlayerMayankYadav3Ce36,
    this.navUlhaq,
    this.rTopley,
    this.tkCurran,
    this.willJacks,
    this.alJoseph,
    this.cPlayerMohsinKhan2A13E,
    this.mSiddharth,
  });

  factory Players.fromJson(Map<String, dynamic> json) => Players(
        aRzCricketSjTgCk: json["a-rz--cricket--sj-tgCk"] == null
            ? null
            : ARzCricketSjTgCk.fromJson(json["a-rz--cricket--sj-tgCk"]),
        vyVijaykumar: json["vy_vijaykumar"] == null
            ? null
            : ARzCricketSjTgCk.fromJson(json["vy_vijaykumar"]),
        dHooda: json["d_hooda"] == null
            ? null
            : ARzCricketSjTgCk.fromJson(json["d_hooda"]),
        mLomror: json["m_lomror"] == null
            ? null
            : CPlayerAnujRawat2A356.fromJson(json["m_lomror"]),
        cPlayerAkashDeep2F13F: json["c__player__akash_deep__2f13f"] == null
            ? null
            : ARzCricketSjTgCk.fromJson(json["c__player__akash_deep__2f13f"]),
        aTurner: json["a_turner"] == null
            ? null
            : ARzCricketSjTgCk.fromJson(json["a_turner"]),
        kGowtham: json["k_gowtham"] == null
            ? null
            : ARzCricketSjTgCk.fromJson(json["k_gowtham"]),
        locFerguson: json["loc_ferguson"] == null
            ? null
            : ARzCricketSjTgCk.fromJson(json["loc_ferguson"]),
        cPlayerArshadKhan9C18B: json["c__player__arshad_khan__9c18b"] == null
            ? null
            : ARzCricketSjTgCk.fromJson(json["c__player__arshad_khan__9c18b"]),
        cPlayerYudhvirSinghF1B27:
            json["c__player__yudhvir_singh__f1b27"] == null
                ? null
                : ARzCricketSjTgCk.fromJson(
                    json["c__player__yudhvir_singh__f1b27"]),
        sMavi: json["s_mavi"] == null
            ? null
            : ARzCricketSjTgCk.fromJson(json["s_mavi"]),
        aMishra: json["a_mishra"] == null
            ? null
            : ARzCricketSjTgCk.fromJson(json["a_mishra"]),
        cPlayerSuyashPrabhudessaiE64C9:
            json["c__player__suyash_prabhudessai__e64c9"] == null
                ? null
                : ARzCricketSjTgCk.fromJson(
                    json["c__player__suyash_prabhudessai__e64c9"]),
        cPlayerSauravChauhan782Db:
            json["c__player__saurav_chauhan__782db"] == null
                ? null
                : ARzCricketSjTgCk.fromJson(
                    json["c__player__saurav_chauhan__782db"]),
        swSingh: json["sw_singh"] == null
            ? null
            : ARzCricketSjTgCk.fromJson(json["sw_singh"]),
        manBhandge: json["man_bhandge"] == null
            ? null
            : ARzCricketSjTgCk.fromJson(json["man_bhandge"]),
        cPlayerHimanshuSharma9D59D:
            json["c__player__himanshu_sharma__9d59d"] == null
                ? null
                : ARzCricketSjTgCk.fromJson(
                    json["c__player__himanshu_sharma__9d59d"]),
        cPlayerRajanKumar696Dd: json["c__player__rajan_kumar__696dd"] == null
            ? null
            : ARzCricketSjTgCk.fromJson(json["c__player__rajan_kumar__696dd"]),
        cPlayerArshinKulkarni2B67F:
            json["c__player__arshin_kulkarni__2b67f"] == null
                ? null
                : ARzCricketSjTgCk.fromJson(
                    json["c__player__arshin_kulkarni__2b67f"]),
        pnMankad: json["pn_mankad"] == null
            ? null
            : ARzCricketSjTgCk.fromJson(json["pn_mankad"]),
        mHenry: json["m_henry"] == null
            ? null
            : ARzCricketSjTgCk.fromJson(json["m_henry"]),
        kSharma: json["k_sharma"] == null
            ? null
            : ARzCricketSjTgCk.fromJson(json["k_sharma"]),
        kMayers: json["k_mayers"] == null
            ? null
            : ARzCricketSjTgCk.fromJson(json["k_mayers"]),
        duPlessis: json["du_plessis"] == null
            ? null
            : CPlayerAnujRawat2A356.fromJson(json["du_plessis"]),
        vKohli: json["v_kohli"] == null
            ? null
            : CPlayerAnujRawat2A356.fromJson(json["v_kohli"]),
        cPlayerRajatPatidar62629:
            json["c__player__rajat_patidar__62629"] == null
                ? null
                : CPlayerAnujRawat2A356.fromJson(
                    json["c__player__rajat_patidar__62629"]),
        gMaxwell: json["g_maxwell"] == null
            ? null
            : CPlayerAnujRawat2A356.fromJson(json["g_maxwell"]),
        camGreen: json["cam_green"] == null
            ? null
            : CPlayerAnujRawat2A356.fromJson(json["cam_green"]),
        dKarthik: json["d_karthik"] == null
            ? null
            : CPlayerAnujRawat2A356.fromJson(json["d_karthik"]),
        cPlayerAnujRawat2A356: json["c__player__anuj_rawat__2a356"] == null
            ? null
            : CPlayerAnujRawat2A356.fromJson(
                json["c__player__anuj_rawat__2a356"]),
        myDagar: json["my_dagar"] == null
            ? null
            : CPlayerAnujRawat2A356.fromJson(json["my_dagar"]),
        mSiraj: json["m_siraj"] == null
            ? null
            : CPlayerAnujRawat2A356.fromJson(json["m_siraj"]),
        cPlayerYashDayal75Ffe: json["c__player__yash_dayal__75ffe"] == null
            ? null
            : CPlayerAnujRawat2A356.fromJson(
                json["c__player__yash_dayal__75ffe"]),
        lRahul: json["l_rahul"] == null
            ? null
            : CPlayerAnujRawat2A356.fromJson(json["l_rahul"]),
        deKock: json["de_kock"] == null
            ? null
            : CPlayerAnujRawat2A356.fromJson(json["de_kock"]),
        dPadikal: json["d_padikal"] == null
            ? null
            : CPlayerAnujRawat2A356.fromJson(json["d_padikal"]),
        mStoinis: json["m_stoinis"] == null
            ? null
            : CPlayerAnujRawat2A356.fromJson(json["m_stoinis"]),
        nPooran: json["n_pooran"] == null
            ? null
            : CPlayerAnujRawat2A356.fromJson(json["n_pooran"]),
        cPlayerAyushBadoniEa723: json["c__player__ayush_badoni__ea723"] == null
            ? null
            : CPlayerAnujRawat2A356.fromJson(
                json["c__player__ayush_badoni__ea723"]),
        kPandya: json["k_pandya"] == null
            ? null
            : CPlayerAnujRawat2A356.fromJson(json["k_pandya"]),
        cPlayerRaviBishnoi8A9Ae: json["c__player__ravi_bishnoi__8a9ae"] == null
            ? null
            : CPlayerAnujRawat2A356.fromJson(
                json["c__player__ravi_bishnoi__8a9ae"]),
        cPlayerYashThakur7001D: json["c__player__yash_thakur__7001d"] == null
            ? null
            : CPlayerAnujRawat2A356.fromJson(
                json["c__player__yash_thakur__7001d"]),
        cPlayerMayankYadav3Ce36: json["c__player__mayank_yadav__3ce36"] == null
            ? null
            : CPlayerAnujRawat2A356.fromJson(
                json["c__player__mayank_yadav__3ce36"]),
        navUlhaq: json["nav_ulhaq"] == null
            ? null
            : CPlayerAnujRawat2A356.fromJson(json["nav_ulhaq"]),
        rTopley: json["r_topley"] == null
            ? null
            : CPlayerAnujRawat2A356.fromJson(json["r_topley"]),
        tkCurran: json["tk_curran"] == null
            ? null
            : ARzCricketSjTgCk.fromJson(json["tk_curran"]),
        willJacks: json["will_jacks"] == null
            ? null
            : ARzCricketSjTgCk.fromJson(json["will_jacks"]),
        alJoseph: json["al_joseph"] == null
            ? null
            : ARzCricketSjTgCk.fromJson(json["al_joseph"]),
        cPlayerMohsinKhan2A13E: json["c__player__mohsin_khan__2a13e"] == null
            ? null
            : ARzCricketSjTgCk.fromJson(json["c__player__mohsin_khan__2a13e"]),
        mSiddharth: json["m_siddharth"] == null
            ? null
            : CPlayerAnujRawat2A356.fromJson(json["m_siddharth"]),
      );

  Map<String, dynamic> toJson() => {
        "a-rz--cricket--sj-tgCk": aRzCricketSjTgCk?.toJson(),
        "vy_vijaykumar": vyVijaykumar?.toJson(),
        "d_hooda": dHooda?.toJson(),
        "m_lomror": mLomror?.toJson(),
        "c__player__akash_deep__2f13f": cPlayerAkashDeep2F13F?.toJson(),
        "a_turner": aTurner?.toJson(),
        "k_gowtham": kGowtham?.toJson(),
        "loc_ferguson": locFerguson?.toJson(),
        "c__player__arshad_khan__9c18b": cPlayerArshadKhan9C18B?.toJson(),
        "c__player__yudhvir_singh__f1b27": cPlayerYudhvirSinghF1B27?.toJson(),
        "s_mavi": sMavi?.toJson(),
        "a_mishra": aMishra?.toJson(),
        "c__player__suyash_prabhudessai__e64c9":
            cPlayerSuyashPrabhudessaiE64C9?.toJson(),
        "c__player__saurav_chauhan__782db": cPlayerSauravChauhan782Db?.toJson(),
        "sw_singh": swSingh?.toJson(),
        "man_bhandge": manBhandge?.toJson(),
        "c__player__himanshu_sharma__9d59d":
            cPlayerHimanshuSharma9D59D?.toJson(),
        "c__player__rajan_kumar__696dd": cPlayerRajanKumar696Dd?.toJson(),
        "c__player__arshin_kulkarni__2b67f":
            cPlayerArshinKulkarni2B67F?.toJson(),
        "pn_mankad": pnMankad?.toJson(),
        "m_henry": mHenry?.toJson(),
        "k_sharma": kSharma?.toJson(),
        "k_mayers": kMayers?.toJson(),
        "du_plessis": duPlessis?.toJson(),
        "v_kohli": vKohli?.toJson(),
        "c__player__rajat_patidar__62629": cPlayerRajatPatidar62629?.toJson(),
        "g_maxwell": gMaxwell?.toJson(),
        "cam_green": camGreen?.toJson(),
        "d_karthik": dKarthik?.toJson(),
        "c__player__anuj_rawat__2a356": cPlayerAnujRawat2A356?.toJson(),
        "my_dagar": myDagar?.toJson(),
        "m_siraj": mSiraj?.toJson(),
        "c__player__yash_dayal__75ffe": cPlayerYashDayal75Ffe?.toJson(),
        "l_rahul": lRahul?.toJson(),
        "de_kock": deKock?.toJson(),
        "d_padikal": dPadikal?.toJson(),
        "m_stoinis": mStoinis?.toJson(),
        "n_pooran": nPooran?.toJson(),
        "c__player__ayush_badoni__ea723": cPlayerAyushBadoniEa723?.toJson(),
        "k_pandya": kPandya?.toJson(),
        "c__player__ravi_bishnoi__8a9ae": cPlayerRaviBishnoi8A9Ae?.toJson(),
        "c__player__yash_thakur__7001d": cPlayerYashThakur7001D?.toJson(),
        "c__player__mayank_yadav__3ce36": cPlayerMayankYadav3Ce36?.toJson(),
        "nav_ulhaq": navUlhaq?.toJson(),
        "r_topley": rTopley?.toJson(),
        "tk_curran": tkCurran?.toJson(),
        "will_jacks": willJacks?.toJson(),
        "al_joseph": alJoseph?.toJson(),
        "c__player__mohsin_khan__2a13e": cPlayerMohsinKhan2A13E?.toJson(),
        "m_siddharth": mSiddharth?.toJson(),
      };
}

class ARzCricketSjTgCk {
  Player? player;
  ARzCricketSjTgCkScore? score;

  ARzCricketSjTgCk({
    this.player,
    this.score,
  });

  factory ARzCricketSjTgCk.fromJson(Map<String, dynamic> json) =>
      ARzCricketSjTgCk(
        player: json["player"] == null ? null : Player.fromJson(json["player"]),
        score: json["score"] == null
            ? null
            : ARzCricketSjTgCkScore.fromJson(json["score"]),
      );

  Map<String, dynamic> toJson() => {
        "player": player?.toJson(),
        "score": score?.toJson(),
      };
}

class Player {
  String? key;
  String? name;
  String? jerseyName;
  String? legalName;
  String? gender;
  Country? nationality;
  int? dateOfBirth;
  String? seasonalRole;
  List<Role>? roles;
  String? battingStyle;
  BowlingStyle? bowlingStyle;
  List<Elected>? skills;
  String? legalNameV2;
  String? jerseyNameV2;

  Player({
    this.key,
    this.name,
    this.jerseyName,
    this.legalName,
    this.gender,
    this.nationality,
    this.dateOfBirth,
    this.seasonalRole,
    this.roles,
    this.battingStyle,
    this.bowlingStyle,
    this.skills,
    this.legalNameV2,
    this.jerseyNameV2,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        key: json["key"],
        name: json["name"],
        jerseyName: json["jersey_name"],
        legalName: json["legal_name"],
        gender: json["gender"],
        nationality: json["nationality"] == null
            ? null
            : json["nationality"] is String
                ? null
                : Country.fromJson(json["nationality"]),
        dateOfBirth: json["date_of_birth"],
        seasonalRole: json["seasonal_role"],
        roles: json["roles"] == null
            ? []
            : List<Role>.from(json["roles"]!.map((x) => roleValues.map[x]!)),
        battingStyle: json["batting_style"],
        bowlingStyle: json["bowling_style"] == null
            ? null
            : json["bowling_style"] is String
                ? null
                : BowlingStyle.fromJson(json["bowling_style"]),
        skills: json["skills"] == null
            ? []
            : List<Elected>.from(
                json["skills"]!.map((x) => electedValues.map[x]!)),
        legalNameV2: json["legal_name_v2"],
        jerseyNameV2: json["jersey_name_v2"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "name": name,
        "jersey_name": jerseyName,
        "legal_name": legalName,
        "gender": gender,
        "nationality": nationality?.toJson(),
        "date_of_birth": dateOfBirth,
        "seasonal_role": seasonalRole,
        "roles": roles == null
            ? []
            : List<dynamic>.from(roles!.map((x) => roleValues.reverse[x])),
        "batting_style": battingStyle,
        "bowling_style": bowlingStyle?.toJson(),
        "skills": skills == null
            ? []
            : List<dynamic>.from(skills!.map((x) => electedValues.reverse[x])),
        "legal_name_v2": legalNameV2,
        "jersey_name_v2": jerseyNameV2,
      };
}

enum BattingStyle { LEFT_HAND, RIGHT_HAND }

final battingStyleValues = EnumValues({
  "left_hand": BattingStyle.LEFT_HAND,
  "right_hand": BattingStyle.RIGHT_HAND
});

class BowlingStyle {
  Arm? arm;
  Pace? pace;
  BowlingType? bowlingType;

  BowlingStyle({
    this.arm,
    this.pace,
    this.bowlingType,
  });

  factory BowlingStyle.fromJson(Map<String, dynamic> json) => BowlingStyle(
        arm: armValues.map[json["arm"]]!,
        pace: paceValues.map[json["pace"]]!,
        bowlingType: bowlingTypeValues.map[json["bowling_type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "arm": armValues.reverse[arm],
        "pace": paceValues.reverse[pace],
        "bowling_type": bowlingTypeValues.reverse[bowlingType],
      };
}

enum Arm { LEFT_ARM, RIGHT_ARM }

final armValues =
    EnumValues({"left_arm": Arm.LEFT_ARM, "right_arm": Arm.RIGHT_ARM});

enum BowlingType { LEG_BREAK, OFF_BREAK, ORTHODOX }

final bowlingTypeValues = EnumValues({
  "leg_break": BowlingType.LEG_BREAK,
  "off_break": BowlingType.OFF_BREAK,
  "orthodox": BowlingType.ORTHODOX
});

enum Pace { FAST, FAST_MEDIUM, MEDIUM, MEDIUM_FAST, SLOW }

final paceValues = EnumValues({
  "fast": Pace.FAST,
  "fast_medium": Pace.FAST_MEDIUM,
  "medium": Pace.MEDIUM,
  "medium_fast": Pace.MEDIUM_FAST,
  "slow": Pace.SLOW
});

enum Role { ALL_ROUNDER, BATSMAN, BOWLER, KEEPER }

final roleValues = EnumValues({
  "all_rounder": Role.ALL_ROUNDER,
  "batsman": Role.BATSMAN,
  "bowler": Role.BOWLER,
  "keeper": Role.KEEPER
});

enum Elected { BAT, BOWL, KEEP }

final electedValues = EnumValues(
    {"bat": Elected.BAT, "bowl": Elected.BOWL, "keep": Elected.KEEP});

class ARzCricketSjTgCkScore {
  ARzCricketSjTgCkScore();

  factory ARzCricketSjTgCkScore.fromJson(Map<String, dynamic> json) =>
      ARzCricketSjTgCkScore();

  Map<String, dynamic> toJson() => {};
}

class CPlayerAnujRawat2A356 {
  Player? player;
  CPlayerAnujRawat2A356Score? score;

  CPlayerAnujRawat2A356({
    this.player,
    this.score,
  });

  factory CPlayerAnujRawat2A356.fromJson(Map<String, dynamic> json) =>
      CPlayerAnujRawat2A356(
        player: json["player"] == null ? null : Player.fromJson(json["player"]),
        score: json["score"] == null
            ? null
            : CPlayerAnujRawat2A356Score.fromJson(json["score"]),
      );

  Map<String, dynamic> toJson() => {
        "player": player?.toJson(),
        "score": score?.toJson(),
      };
}

class CPlayerAnujRawat2A356Score {
  The1? the1;

  CPlayerAnujRawat2A356Score({
    this.the1,
  });

  factory CPlayerAnujRawat2A356Score.fromJson(Map<String, dynamic> json) =>
      CPlayerAnujRawat2A356Score(
        the1: json["1"] == null ? null : The1.fromJson(json["1"]),
      );

  Map<String, dynamic> toJson() => {
        "1": the1?.toJson(),
      };
}

class The1 {
  Batting? batting;
  Bowling? bowling;
  Fielding? fielding;

  The1({
    this.batting,
    this.bowling,
    this.fielding,
  });

  factory The1.fromJson(Map<String, dynamic> json) => The1(
        batting:
            json["batting"] == null ? null : Batting.fromJson(json["batting"]),
        bowling:
            json["bowling"] == null ? null : Bowling.fromJson(json["bowling"]),
        fielding: json["fielding"] == null
            ? null
            : Fielding.fromJson(json["fielding"]),
      );

  Map<String, dynamic> toJson() => {
        "batting": batting?.toJson(),
        "bowling": bowling?.toJson(),
        "fielding": fielding?.toJson(),
      };
}

class Batting {
  PlayerAScoreClass? score;
  Dismissal? dismissal;

  Batting({
    this.score,
    this.dismissal,
  });

  factory Batting.fromJson(Map<String, dynamic> json) => Batting(
        score: json["score"] == null
            ? null
            : PlayerAScoreClass.fromJson(json["score"]),
        dismissal: json["dismissal"] == null
            ? null
            : Dismissal.fromJson(json["dismissal"]),
      );

  Map<String, dynamic> toJson() => {
        "score": score?.toJson(),
        "dismissal": dismissal?.toJson(),
      };
}

class Dismissal {
  List<int>? overs;
  int? teamRuns;
  int? wicketNumber;
  String? msg;
  String? ballKey;
  WicketType? wicketType;

  Dismissal({
    this.overs,
    this.teamRuns,
    this.wicketNumber,
    this.msg,
    this.ballKey,
    this.wicketType,
  });

  factory Dismissal.fromJson(Map<String, dynamic> json) => Dismissal(
        overs: json["overs"] == null
            ? []
            : List<int>.from(json["overs"]!.map((x) => x)),
        teamRuns: json["team_runs"],
        wicketNumber: json["wicket_number"],
        msg: json["msg"],
        ballKey: json["ball_key"],
        wicketType: wicketTypeValues.map[json["wicket_type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "overs": overs == null ? [] : List<dynamic>.from(overs!.map((x) => x)),
        "team_runs": teamRuns,
        "wicket_number": wicketNumber,
        "msg": msg,
        "ball_key": ballKey,
        "wicket_type": wicketTypeValues.reverse[wicketType],
      };
}

class Bowling {
  BowlingScore? score;

  Bowling({
    this.score,
  });

  factory Bowling.fromJson(Map<String, dynamic> json) => Bowling(
        score:
            json["score"] == null ? null : BowlingScore.fromJson(json["score"]),
      );

  Map<String, dynamic> toJson() => {
        "score": score?.toJson(),
      };
}

class BowlingScore {
  int? balls;
  int? runs;
  double? economy;
  int? wickets;
  int? extras;
  int? maidenOvers;
  List<int>? overs;
  ScoreBallsBreakup? ballsBreakup;

  BowlingScore({
    this.balls,
    this.runs,
    this.economy,
    this.wickets,
    this.extras,
    this.maidenOvers,
    this.overs,
    this.ballsBreakup,
  });

  factory BowlingScore.fromJson(Map<String, dynamic> json) => BowlingScore(
        balls: json["balls"],
        runs: json["runs"],
        economy: json["economy"]?.toDouble(),
        wickets: json["wickets"],
        extras: json["extras"],
        maidenOvers: json["maiden_overs"],
        overs: json["overs"] == null
            ? []
            : List<int>.from(json["overs"]!.map((x) => x)),
        ballsBreakup: json["balls_breakup"] == null
            ? null
            : ScoreBallsBreakup.fromJson(json["balls_breakup"]),
      );

  Map<String, dynamic> toJson() => {
        "balls": balls,
        "runs": runs,
        "economy": economy,
        "wickets": wickets,
        "extras": extras,
        "maiden_overs": maidenOvers,
        "overs": overs == null ? [] : List<dynamic>.from(overs!.map((x) => x)),
        "balls_breakup": ballsBreakup?.toJson(),
      };
}

class ScoreBallsBreakup {
  int? dotBalls;
  int? wides;
  int? noBalls;
  int? fours;
  int? sixes;

  ScoreBallsBreakup({
    this.dotBalls,
    this.wides,
    this.noBalls,
    this.fours,
    this.sixes,
  });

  factory ScoreBallsBreakup.fromJson(Map<String, dynamic> json) =>
      ScoreBallsBreakup(
        dotBalls: json["dot_balls"],
        wides: json["wides"],
        noBalls: json["no_balls"],
        fours: json["fours"],
        sixes: json["sixes"],
      );

  Map<String, dynamic> toJson() => {
        "dot_balls": dotBalls,
        "wides": wides,
        "no_balls": noBalls,
        "fours": fours,
        "sixes": sixes,
      };
}

class Fielding {
  int? catches;
  int? stumpings;
  int? runouts;

  Fielding({
    this.catches,
    this.stumpings,
    this.runouts,
  });

  factory Fielding.fromJson(Map<String, dynamic> json) => Fielding(
        catches: json["catches"],
        stumpings: json["stumpings"],
        runouts: json["runouts"],
      );

  Map<String, dynamic> toJson() => {
        "catches": catches,
        "stumpings": stumpings,
        "runouts": runouts,
      };
}

class Squad {
  SquadA? a;
  SquadA? b;

  Squad({
    this.a,
    this.b,
  });

  factory Squad.fromJson(Map<String, dynamic> json) => Squad(
        a: json["a"] == null ? null : SquadA.fromJson(json["a"]),
        b: json["b"] == null ? null : SquadA.fromJson(json["b"]),
      );

  Map<String, dynamic> toJson() => {
        "a": a?.toJson(),
        "b": b?.toJson(),
      };
}

class SquadA {
  List<String>? playerKeys;
  String? captain;
  String? keeper;
  List<String>? playingXi;
  List<Replacement>? replacements;

  SquadA({
    this.playerKeys,
    this.captain,
    this.keeper,
    this.playingXi,
    this.replacements,
  });

  factory SquadA.fromJson(Map<String, dynamic> json) => SquadA(
        playerKeys: json["player_keys"] == null
            ? []
            : List<String>.from(json["player_keys"]!.map((x) => x)),
        captain: json["captain"],
        keeper: json["keeper"],
        playingXi: json["playing_xi"] == null
            ? []
            : List<String>.from(json["playing_xi"]!.map((x) => x)),
        replacements: json["replacements"] == null
            ? []
            : List<Replacement>.from(
                json["replacements"]!.map((x) => Replacement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "player_keys": playerKeys == null
            ? []
            : List<dynamic>.from(playerKeys!.map((x) => x)),
        "captain": captain,
        "keeper": keeper,
        "playing_xi": playingXi == null
            ? []
            : List<dynamic>.from(playingXi!.map((x) => x)),
        "replacements": replacements == null
            ? []
            : List<dynamic>.from(replacements!.map((x) => x.toJson())),
      };
}

class Replacement {
  String? playerIn;
  ReplacementReason? replacementReason;
  bool? inInnings;
  String? playerOut;

  Replacement({
    this.playerIn,
    this.replacementReason,
    this.inInnings,
    this.playerOut,
  });

  factory Replacement.fromJson(Map<String, dynamic> json) => Replacement(
        playerIn: json["player_in"],
        replacementReason:
            replacementReasonValues.map[json["replacement_reason"]]!,
        inInnings: json["in_innings"],
        playerOut: json["player_out"],
      );

  Map<String, dynamic> toJson() => {
        "player_in": playerIn,
        "replacement_reason":
            replacementReasonValues.reverse[replacementReason],
        "in_innings": inInnings,
        "player_out": playerOut,
      };
}

enum ReplacementReason { SUPERSUB }

final replacementReasonValues =
    EnumValues({"supersub": ReplacementReason.SUPERSUB});

class Teams {
  TeamsA? b;
  TeamsA? a;

  Teams({
    this.b,
    this.a,
  });

  factory Teams.fromJson(Map<String, dynamic> json) => Teams(
        b: json["b"] == null ? null : TeamsA.fromJson(json["b"]),
        a: json["a"] == null ? null : TeamsA.fromJson(json["a"]),
      );

  Map<String, dynamic> toJson() => {
        "b": b?.toJson(),
        "a": a?.toJson(),
      };
}

class TeamsA {
  String? key;
  String? code;
  String? name;
  String? alternateName;
  String? alternateCode;
  String? countryCode;

  TeamsA({
    this.key,
    this.code,
    this.name,
    this.alternateName,
    this.alternateCode,
    this.countryCode,
  });

  factory TeamsA.fromJson(Map<String, dynamic> json) => TeamsA(
        key: json["key"],
        code: json["code"],
        name: json["name"],
        alternateName: json["alternate_name"],
        alternateCode: json["alternate_code"],
        countryCode: json["country_code"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "code": code,
        "name": name,
        "alternate_name": alternateName,
        "alternate_code": alternateCode,
        "country_code": countryCode,
      };
}

class Toss {
  Winner? called;
  Winner? winner;
  Elected? elected;
  bool? squadAnnounced;

  Toss({
    this.called,
    this.winner,
    this.elected,
    this.squadAnnounced,
  });

  factory Toss.fromJson(Map<String, dynamic> json) => Toss(
        called: winnerValues.map[json["called"]]!,
        winner: winnerValues.map[json["winner"]]!,
        elected: electedValues.map[json["elected"]]!,
        squadAnnounced: json["squad_announced"],
      );

  Map<String, dynamic> toJson() => {
        "called": winnerValues.reverse[called],
        "winner": winnerValues.reverse[winner],
        "elected": electedValues.reverse[elected],
        "squad_announced": squadAnnounced,
      };
}

class Tournament {
  String? key;
  String? name;
  String? shortName;
  String? alternateName;
  String? alternateShortName;

  Tournament({
    this.key,
    this.name,
    this.shortName,
    this.alternateName,
    this.alternateShortName,
  });

  factory Tournament.fromJson(Map<String, dynamic> json) => Tournament(
        key: json["key"],
        name: json["name"],
        shortName: json["short_name"],
        alternateName: json["alternate_name"],
        alternateShortName: json["alternate_short_name"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "name": name,
        "short_name": shortName,
        "alternate_name": alternateName,
        "alternate_short_name": alternateShortName,
      };
}

class Umpires {
  List<MatchReferee>? matchUmpires;
  List<MatchReferee>? tvUmpires;
  List<MatchReferee>? reserveUmpires;
  List<MatchReferee>? matchReferee;

  Umpires({
    this.matchUmpires,
    this.tvUmpires,
    this.reserveUmpires,
    this.matchReferee,
  });

  factory Umpires.fromJson(Map<String, dynamic> json) => Umpires(
        matchUmpires: json["match_umpires"] == null
            ? []
            : List<MatchReferee>.from(
                json["match_umpires"]!.map((x) => MatchReferee.fromJson(x))),
        tvUmpires: json["tv_umpires"] == null
            ? []
            : List<MatchReferee>.from(
                json["tv_umpires"]!.map((x) => MatchReferee.fromJson(x))),
        reserveUmpires: json["reserve_umpires"] == null
            ? []
            : List<MatchReferee>.from(
                json["reserve_umpires"]!.map((x) => MatchReferee.fromJson(x))),
        matchReferee: json["match_referee"] == null
            ? []
            : List<MatchReferee>.from(
                json["match_referee"]!.map((x) => MatchReferee.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "match_umpires": matchUmpires == null
            ? []
            : List<dynamic>.from(matchUmpires!.map((x) => x.toJson())),
        "tv_umpires": tvUmpires == null
            ? []
            : List<dynamic>.from(tvUmpires!.map((x) => x.toJson())),
        "reserve_umpires": reserveUmpires == null
            ? []
            : List<dynamic>.from(reserveUmpires!.map((x) => x.toJson())),
        "match_referee": matchReferee == null
            ? []
            : List<dynamic>.from(matchReferee!.map((x) => x.toJson())),
      };
}

class MatchReferee {
  String? key;
  String? name;
  String? legalName;
  Country? nationality;

  MatchReferee({
    this.key,
    this.name,
    this.legalName,
    this.nationality,
  });

  factory MatchReferee.fromJson(Map<String, dynamic> json) => MatchReferee(
        key: json["key"],
        name: json["name"],
        legalName: json["legal_name"],
        nationality: json["nationality"] == null
            ? null
            : Country.fromJson(json["nationality"]),
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "name": name,
        "legal_name": legalName,
        "nationality": nationality?.toJson(),
      };
}

class Venue {
  String? key;
  String? name;
  String? city;
  Country? country;
  String? geolocation;

  Venue({
    this.key,
    this.name,
    this.city,
    this.country,
    this.geolocation,
  });

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        key: json["key"],
        name: json["name"],
        city: json["city"],
        country:
            json["country"] == null ? null : Country.fromJson(json["country"]),
        geolocation: json["geolocation"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "name": name,
        "city": city,
        "country": country?.toJson(),
        "geolocation": geolocation,
      };
}

class Schema {
  String? majorVersion;
  String? minorVersion;

  Schema({
    this.majorVersion,
    this.minorVersion,
  });

  factory Schema.fromJson(Map<String, dynamic> json) => Schema(
        majorVersion: json["major_version"],
        minorVersion: json["minor_version"],
      );

  Map<String, dynamic> toJson() => {
        "major_version": majorVersion,
        "minor_version": minorVersion,
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

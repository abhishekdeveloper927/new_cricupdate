// To parse this JSON data, do
//
//     final liveMatchDetailsPage = liveMatchDetailsPageFromJson(jsonString);

import 'dart:convert';

import 'commentary_page.dart';

LiveMatchDetailsPage liveMatchDetailsPageFromJson(String str) =>
    LiveMatchDetailsPage.fromJson(json.decode(str));

String liveMatchDetailsPageToJson(LiveMatchDetailsPage data) =>
    json.encode(data.toJson());

class LiveMatchDetailsPage {
  String? status;
  LiveMatchDetailModel? response;
  String? etag;
  DateTime? modified;
  DateTime? datetime;
  String? apiVersion;

  LiveMatchDetailsPage({
    this.status,
    this.response,
    this.etag,
    this.modified,
    this.datetime,
    this.apiVersion,
  });

  factory LiveMatchDetailsPage.fromJson(Map<String, dynamic> json) =>
      LiveMatchDetailsPage(
        status: json["status"],
        response: json["response"] == null
            ? null
            : json["response"] is String
                ? null
                : LiveMatchDetailModel.fromJson(json["response"]),
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

class LiveMatchDetailModel {
  int? mid;
  int? status;
  String? statusStr;
  int? gameState;
  String? gameStateStr;
  String? statusNote;
  String? dayRemainingOver;
  String? teamBatting;
  String? teamBowling;
  int? liveInningNumber;
  LiveScore? liveScore;
  int? commentary;
  int? wagon;
  List<ResponseBatsman>? batsmen;
  List<Bowler>? bowlers;
  List<Commentary>? commentaries;
  String? day;
  String? session;
  LiveInning? liveInning;
  List<Team>? teams;
  List<Player>? players;

  LiveMatchDetailModel({
    this.mid,
    this.status,
    this.statusStr,
    this.gameState,
    this.gameStateStr,
    this.statusNote,
    this.dayRemainingOver,
    this.teamBatting,
    this.teamBowling,
    this.liveInningNumber,
    this.liveScore,
    this.commentary,
    this.wagon,
    this.batsmen,
    this.bowlers,
    this.commentaries,
    this.day,
    this.session,
    this.liveInning,
    this.teams,
    this.players,
  });

  factory LiveMatchDetailModel.fromJson(Map<String, dynamic> json) =>
      LiveMatchDetailModel(
        mid: json["mid"],
        status: json["status"],
        statusStr: json["status_str"],
        gameState: json["game_state"],
        gameStateStr: json["game_state_str"],
        statusNote: json["status_note"],
        dayRemainingOver: json["day_remaining_over"],
        teamBatting: json["team_batting"],
        teamBowling: json["team_bowling"],
        liveInningNumber: json["live_inning_number"],
        liveScore: json["live_score"] == null
            ? null
            : LiveScore.fromJson(json["live_score"]),
        commentary: json["commentary"],
        wagon: json["wagon"],
        batsmen: json["batsmen"] == null
            ? []
            : List<ResponseBatsman>.from(
                json["batsmen"]!.map((x) => ResponseBatsman.fromJson(x))),
        bowlers: json["bowlers"] == null
            ? []
            : List<Bowler>.from(
                json["bowlers"]!.map((x) => Bowler.fromJson(x))),
        commentaries: json["commentaries"] == null
            ? []
            : List<Commentary>.from(
                json["commentaries"]!.map((x) => Commentary.fromJson(x))),
        day: json["day"],
        session: json["session"],
        liveInning: json["live_inning"] == null
            ? null
            : LiveInning.fromJson(json["live_inning"]),
        teams: json["teams"] == null
            ? []
            : List<Team>.from(json["teams"]!.map((x) => Team.fromJson(x))),
        players: json["players"] == null
            ? []
            : List<Player>.from(
                json["players"]!.map((x) => Player.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mid": mid,
        "status": status,
        "status_str": statusStr,
        "game_state": gameState,
        "game_state_str": gameStateStr,
        "status_note": statusNote,
        "day_remaining_over": dayRemainingOver,
        "team_batting": teamBatting,
        "team_bowling": teamBowling,
        "live_inning_number": liveInningNumber,
        "live_score": liveScore?.toJson(),
        "commentary": commentary,
        "wagon": wagon,
        "batsmen": batsmen == null
            ? []
            : List<dynamic>.from(batsmen!.map((x) => x.toJson())),
        "bowlers": bowlers == null
            ? []
            : List<dynamic>.from(bowlers!.map((x) => x.toJson())),
        "commentaries": commentaries == null
            ? []
            : List<dynamic>.from(commentaries!.map((x) => x.toJson())),
        "day": day,
        "session": session,
        "live_inning": liveInning?.toJson(),
        "teams": teams == null
            ? []
            : List<dynamic>.from(teams!.map((x) => x.toJson())),
        "players": players == null
            ? []
            : List<dynamic>.from(players!.map((x) => x.toJson())),
      };
}

class ResponseBatsman {
  String? name;
  int? batsmanId;
  int? runs;
  int? ballsFaced;
  int? fours;
  int? sixes;
  String? strikeRate;

  ResponseBatsman({
    this.name,
    this.batsmanId,
    this.runs,
    this.ballsFaced,
    this.fours,
    this.sixes,
    this.strikeRate,
  });

  factory ResponseBatsman.fromJson(Map<String, dynamic> json) =>
      ResponseBatsman(
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

class Bowler {
  String? name;
  int? bowlerId;
  double? overs;
  int? runsConceded;
  int? wickets;
  int? maidens;
  String? econ;

  Bowler({
    this.name,
    this.bowlerId,
    this.overs,
    this.runsConceded,
    this.wickets,
    this.maidens,
    this.econ,
  });

  factory Bowler.fromJson(Map<String, dynamic> json) => Bowler(
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

class LiveInning {
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
  Review? review;

  /*
  LastWicket? lastWicket;*/
  ExtraRuns? extraRuns;
  Equations? equations;
  CurrentPartnership? currentPartnership;
  List<DidNotBat>? didNotBat;
  String? maxOver;
  String? target;

  LiveInning({
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
    this.review,
    /*
    this.lastWicket,*/
    this.extraRuns,
    this.equations,
    this.currentPartnership,
    this.didNotBat,
    this.maxOver,
    this.target,
  });

  factory LiveInning.fromJson(Map<String, dynamic> json) => LiveInning(
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
        review: json["review"] == null ? null : Review.fromJson(json["review"]),
        /* lastWicket: json["last_wicket"] == null
            ? null
            : LastWicket.fromJson(json["last_wicket"]),*/
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
        "fielder": fielder == null
            ? []
            : List<dynamic>.from(fielder!.map((x) => x.toJson())),
        "review": review?.toJson(),
        /*
        "last_wicket": lastWicket?.toJson(),*/
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
        requiredRunrate: json["required_runrate"] == ''
            ? 0.0
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

class Player {
  int? pid;
  String? title;
  String? shortName;
  String? firstName;
  String? lastName;
  String? middleName;
  String? birthdate;
  String? birthplace;
  String? country;
  String? logoUrl;
  String? playingRole;
  String? battingStyle;
  String? bowlingStyle;
  String? fieldingPosition;
  int? recentMatch;
  int? recentAppearance;
  double? fantasyPlayerRating;
  String? altName;
  String? facebookProfile;
  String? twitterProfile;
  String? instagramProfile;
  String? debutData;
  String? thumbUrl;
  String? nationality;
  String? role;
  String? roleStr;

  Player({
    this.pid,
    this.title,
    this.shortName,
    this.firstName,
    this.lastName,
    this.middleName,
    this.birthdate,
    this.birthplace,
    this.country,
    this.logoUrl,
    this.playingRole,
    this.battingStyle,
    this.bowlingStyle,
    this.fieldingPosition,
    this.recentMatch,
    this.recentAppearance,
    this.fantasyPlayerRating,
    this.altName,
    this.facebookProfile,
    this.twitterProfile,
    this.instagramProfile,
    this.debutData,
    this.thumbUrl,
    this.nationality,
    this.role,
    this.roleStr,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        pid: json["pid"],
        title: json["title"],
        shortName: json["short_name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        middleName: json["middle_name"],
        birthdate: json["birthdate"],
        birthplace: json["birthplace"],
        country: json["country"],
        logoUrl: json["logo_url"],
        playingRole: json["playing_role"],
        battingStyle: json["batting_style"],
        bowlingStyle: json["bowling_style"],
        fieldingPosition: json["fielding_position"],
        recentMatch: json["recent_match"],
        recentAppearance: json["recent_appearance"],
        fantasyPlayerRating: json["fantasy_player_rating"]?.toDouble(),
        altName: json["alt_name"],
        facebookProfile: json["facebook_profile"],
        twitterProfile: json["twitter_profile"],
        instagramProfile: json["instagram_profile"],
        debutData: json["debut_data"],
        thumbUrl: json["thumb_url"],
        nationality: json["nationality"],
        role: json["role"],
        roleStr: json["role_str"],
      );

  Map<String, dynamic> toJson() => {
        "pid": pid,
        "title": title,
        "short_name": shortName,
        "first_name": firstName,
        "last_name": lastName,
        "middle_name": middleName,
        "birthdate": birthdate,
        "birthplace": birthplace,
        "country": country,
        "logo_url": logoUrl,
        "playing_role": playingRole,
        "batting_style": battingStyle,
        "bowling_style": bowlingStyle,
        "fielding_position": fieldingPosition,
        "recent_match": recentMatch,
        "recent_appearance": recentAppearance,
        "fantasy_player_rating": fantasyPlayerRating,
        "alt_name": altName,
        "facebook_profile": facebookProfile,
        "twitter_profile": twitterProfile,
        "instagram_profile": instagramProfile,
        "debut_data": debutData,
        "thumb_url": thumbUrl,
        "nationality": nationality,
        "role": role,
        "role_str": roleStr,
      };
}

enum BattingStyle { EMPTY, LEFT_HAND_BAT, RIGHT_HAND_BAT }

final battingStyleValues = EnumValues({
  "": BattingStyle.EMPTY,
  "Left hand Bat": BattingStyle.LEFT_HAND_BAT,
  "Right Hand Bat": BattingStyle.RIGHT_HAND_BAT
});

enum Birthplace { CHRISTCHURCH_CANTERBURY, EMPTY, HIALEAH_FLORIDA, WELKOM }

final birthplaceValues = EnumValues({
  "Christchurch, Canterbury": Birthplace.CHRISTCHURCH_CANTERBURY,
  "": Birthplace.EMPTY,
  " Hialeah, Florida": Birthplace.HIALEAH_FLORIDA,
  "Welkom": Birthplace.WELKOM
});

enum Country { CA, IN, NZ, PK, US, ZA }

final countryValues = EnumValues({
  "ca": Country.CA,
  "in": Country.IN,
  "nz": Country.NZ,
  "pk": Country.PK,
  "us": Country.US,
  "za": Country.ZA
});

enum FieldingPosition { EMPTY, WICKETKEEPER }

final fieldingPositionValues = EnumValues({
  "": FieldingPosition.EMPTY,
  "Wicketkeeper": FieldingPosition.WICKETKEEPER
});

enum TeamBatting {
  CANADA,
  INDIA,
  NEW_ZEALAND,
  PAKISTAN,
  SOUTH_AFRICA,
  UNITED_STATES
}

final teamBattingValues = EnumValues({
  "Canada": TeamBatting.CANADA,
  "India": TeamBatting.INDIA,
  "New Zealand": TeamBatting.NEW_ZEALAND,
  "Pakistan": TeamBatting.PAKISTAN,
  "South Africa": TeamBatting.SOUTH_AFRICA,
  "United States": TeamBatting.UNITED_STATES
});

enum Role { ALL, BAT, BOWL, SQUAD, WK }

final roleValues = EnumValues({
  "all": Role.ALL,
  "bat": Role.BAT,
  "bowl": Role.BOWL,
  "squad": Role.SQUAD,
  "wk": Role.WK
});

enum RoleStr { C, EMPTY, WK, WK_C }

final roleStrValues = EnumValues({
  "(C)": RoleStr.C,
  "": RoleStr.EMPTY,
  "(WK)": RoleStr.WK,
  "(WK/C)": RoleStr.WK_C
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
  String? scoresFull;
  String? scores;
  String? overs;

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
    this.scoresFull,
    this.scores,
    this.overs,
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
        scoresFull: json["scores_full"],
        scores: json["scores"],
        overs: json["overs"],
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
        "scores_full": scoresFull,
        "scores": scores,
        "overs": overs,
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

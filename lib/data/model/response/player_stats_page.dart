// To parse this JSON data, do
//
//     final playerStatsPage = playerStatsPageFromJson(jsonString);

import 'dart:convert';

PlayerStatsPage playerStatsPageFromJson(String str) =>
    PlayerStatsPage.fromJson(json.decode(str));

String playerStatsPageToJson(PlayerStatsPage data) =>
    json.encode(data.toJson());

class PlayerStatsPage {
  String? status;
  PlayerStatsModel? response;
  String? etag;
  DateTime? modified;
  DateTime? datetime;
  String? apiVersion;

  PlayerStatsPage({
    this.status,
    this.response,
    this.etag,
    this.modified,
    this.datetime,
    this.apiVersion,
  });

  factory PlayerStatsPage.fromJson(Map<String, dynamic> json) =>
      PlayerStatsPage(
        status: json["status"],
        response: json["response"] == null
            ? null
            : PlayerStatsModel.fromJson(json["response"]),
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

class PlayerStatsModel {
  Player? player;
  Batting? batting;
  Bowling? bowling;

  PlayerStatsModel({
    this.player,
    this.batting,
    this.bowling,
  });

  factory PlayerStatsModel.fromJson(Map<String, dynamic> json) =>
      PlayerStatsModel(
        player: json["player"] == null ? null : Player.fromJson(json["player"]),
        batting:
            json["batting"] == null ? null : Batting.fromJson(json["batting"]),
        bowling:
            json["bowling"] == null ? null : Bowling.fromJson(json["bowling"]),
      );

  Map<String, dynamic> toJson() => {
        "player": player?.toJson(),
        "batting": batting?.toJson(),
        "bowling": bowling?.toJson(),
      };
}

class Batting {
  BattingModel? test;
  BattingModel? odi;
  BattingModel? t20I;
  BattingModel? t20;
  BattingModel? lista;
  BattingModel? firstclass;
  BattingT10? t10;

  Batting({
    this.test,
    this.odi,
    this.t20I,
    this.t20,
    this.lista,
    this.firstclass,
    this.t10,
  });

  factory Batting.fromJson(Map<String, dynamic> json) => Batting(
        test: json["test"] == null ? null : BattingModel.fromJson(json["test"]),
        odi: json["odi"] == null ? null : BattingModel.fromJson(json["odi"]),
        t20I: json["t20i"] == null ? null : BattingModel.fromJson(json["t20i"]),
        t20: json["t20"] == null ? null : BattingModel.fromJson(json["t20"]),
        lista:
            json["lista"] == null ? null : BattingModel.fromJson(json["lista"]),
        firstclass: json["firstclass"] == null
            ? null
            : BattingModel.fromJson(json["firstclass"]),
        t10: json["t10"] == null ? null : BattingT10.fromJson(json["t10"]),
      );

  Map<String, dynamic> toJson() => {
        "test": test?.toJson(),
        "odi": odi?.toJson(),
        "t20i": t20I?.toJson(),
        "t20": t20?.toJson(),
        "lista": lista?.toJson(),
        "firstclass": firstclass?.toJson(),
        "t10": t10?.toJson(),
      };
}

class BattingModel {
  int? matchId;
  int? inningId;
  int? matches;
  int? innings;
  int? notout;
  int? runs;
  int? balls;
  int? highest;
  int? run100;
  int? run50;
  int? run4;
  int? run6;
  String? average;
  String? strike;
  int? catches;
  int? stumpings;
  int? fastest50Balls;
  int? fastest100Balls;

  BattingModel({
    this.matchId,
    this.inningId,
    this.matches,
    this.innings,
    this.notout,
    this.runs,
    this.balls,
    this.highest,
    this.run100,
    this.run50,
    this.run4,
    this.run6,
    this.average,
    this.strike,
    this.catches,
    this.stumpings,
    this.fastest50Balls,
    this.fastest100Balls,
  });

  factory BattingModel.fromJson(Map<String, dynamic> json) => BattingModel(
        matchId: json["match_id"],
        inningId: json["inning_id"],
        matches: json["matches"],
        innings: json["innings"],
        notout: json["notout"],
        runs: json["runs"],
        balls: json["balls"],
        highest: json["highest"],
        run100: json["run100"],
        run50: json["run50"],
        run4: json["run4"],
        run6: json["run6"],
        average: json["average"],
        strike: json["strike"],
        catches: json["catches"],
        stumpings: json["stumpings"],
        fastest50Balls: json["fastest50balls"],
        fastest100Balls: json["fastest100balls"],
      );

  Map<String, dynamic> toJson() => {
        "match_id": matchId,
        "inning_id": inningId,
        "matches": matches,
        "innings": innings,
        "notout": notout,
        "runs": runs,
        "balls": balls,
        "highest": highest,
        "run100": run100,
        "run50": run50,
        "run4": run4,
        "run6": run6,
        "average": average,
        "strike": strike,
        "catches": catches,
        "stumpings": stumpings,
        "fastest50balls": fastest50Balls,
        "fastest100balls": fastest100Balls,
      };
}

class BattingT10 {
  String? matchId;
  String? inningId;
  String? matches;
  String? innings;
  String? notout;
  String? runs;
  String? balls;
  String? highest;
  String? run100;
  String? run50;
  String? run4;
  String? run6;
  String? average;
  String? strike;
  String? catches;
  String? stumpings;

  BattingT10({
    this.matchId,
    this.inningId,
    this.matches,
    this.innings,
    this.notout,
    this.runs,
    this.balls,
    this.highest,
    this.run100,
    this.run50,
    this.run4,
    this.run6,
    this.average,
    this.strike,
    this.catches,
    this.stumpings,
  });

  factory BattingT10.fromJson(Map<String, dynamic> json) => BattingT10(
        matchId: json["match_id"],
        inningId: json["inning_id"],
        matches: json["matches"],
        innings: json["innings"],
        notout: json["notout"],
        runs: json["runs"],
        balls: json["balls"],
        highest: json["highest"],
        run100: json["run100"],
        run50: json["run50"],
        run4: json["run4"],
        run6: json["run6"],
        average: json["average"],
        strike: json["strike"],
        catches: json["catches"],
        stumpings: json["stumpings"],
      );

  Map<String, dynamic> toJson() => {
        "match_id": matchId,
        "inning_id": inningId,
        "matches": matches,
        "innings": innings,
        "notout": notout,
        "runs": runs,
        "balls": balls,
        "highest": highest,
        "run100": run100,
        "run50": run50,
        "run4": run4,
        "run6": run6,
        "average": average,
        "strike": strike,
        "catches": catches,
        "stumpings": stumpings,
      };
}

class Bowling {
  BowlingModel? test;
  BowlingModel? odi;
  BowlingModel? t20I;
  BowlingModel? t20;
  BowlingModel? lista;
  BowlingModel? firstclass;
  BowlingT10? t10;

  Bowling({
    this.test,
    this.odi,
    this.t20I,
    this.t20,
    this.lista,
    this.firstclass,
    this.t10,
  });

  factory Bowling.fromJson(Map<String, dynamic> json) => Bowling(
        test: json["test"] == null ? null : BowlingModel.fromJson(json["test"]),
        odi: json["odi"] == null ? null : BowlingModel.fromJson(json["odi"]),
        t20I: json["t20i"] == null ? null : BowlingModel.fromJson(json["t20i"]),
        t20: json["t20"] == null ? null : BowlingModel.fromJson(json["t20"]),
        lista:
            json["lista"] == null ? null : BowlingModel.fromJson(json["lista"]),
        firstclass: json["firstclass"] == null
            ? null
            : BowlingModel.fromJson(json["firstclass"]),
        t10: json["t10"] == null ? null : BowlingT10.fromJson(json["t10"]),
      );

  Map<String, dynamic> toJson() => {
        "test": test?.toJson(),
        "odi": odi?.toJson(),
        "t20i": t20I?.toJson(),
        "t20": t20?.toJson(),
        "lista": lista?.toJson(),
        "firstclass": firstclass?.toJson(),
        "t10": t10?.toJson(),
      };
}

class BowlingModel {
  int? matchId;
  int? inningId;
  int? matches;
  int? innings;
  int? balls;
  double? overs;
  int? runs;
  int? wickets;
  String? bestinning;
  String? bestmatch;
  String? econ;
  String? average;
  String? strike;
  int? wicket4I;
  int? wicket5I;
  int? wicket10M;
  int? hattrick;
  int? expensiveOverRuns;

  BowlingModel({
    this.matchId,
    this.inningId,
    this.matches,
    this.innings,
    this.balls,
    this.overs,
    this.runs,
    this.wickets,
    this.bestinning,
    this.bestmatch,
    this.econ,
    this.average,
    this.strike,
    this.wicket4I,
    this.wicket5I,
    this.wicket10M,
    this.hattrick,
    this.expensiveOverRuns,
  });

  factory BowlingModel.fromJson(Map<String, dynamic> json) => BowlingModel(
        matchId: json["match_id"],
        inningId: json["inning_id"],
        matches: json["matches"],
        innings: json["innings"],
        balls: json["balls"],
        overs: json["overs"]?.toDouble(),
        runs: json["runs"],
        wickets: json["wickets"],
        bestinning: json["bestinning"],
        bestmatch: json["bestmatch"],
        econ: json["econ"],
        average: json["average"],
        strike: json["strike"],
        wicket4I: json["wicket4i"],
        wicket5I: json["wicket5i"],
        wicket10M: json["wicket10m"],
        hattrick: json["hattrick"],
        expensiveOverRuns: json["expensive_over_runs"],
      );

  Map<String, dynamic> toJson() => {
        "match_id": matchId,
        "inning_id": inningId,
        "matches": matches,
        "innings": innings,
        "balls": balls,
        "overs": overs,
        "runs": runs,
        "wickets": wickets,
        "bestinning": bestinning,
        "bestmatch": bestmatch,
        "econ": econ,
        "average": average,
        "strike": strike,
        "wicket4i": wicket4I,
        "wicket5i": wicket5I,
        "wicket10m": wicket10M,
        "hattrick": hattrick,
        "expensive_over_runs": expensiveOverRuns,
      };
}

class BowlingT10 {
  String? matchId;
  String? inningId;
  String? matches;
  String? innings;
  String? balls;
  String? overs;
  String? runs;
  String? wickets;
  String? bestinning;
  String? bestmatch;
  String? econ;
  String? average;
  String? strike;
  String? wicket4I;
  String? wicket5I;
  String? wicket10M;

  BowlingT10({
    this.matchId,
    this.inningId,
    this.matches,
    this.innings,
    this.balls,
    this.overs,
    this.runs,
    this.wickets,
    this.bestinning,
    this.bestmatch,
    this.econ,
    this.average,
    this.strike,
    this.wicket4I,
    this.wicket5I,
    this.wicket10M,
  });

  factory BowlingT10.fromJson(Map<String, dynamic> json) => BowlingT10(
        matchId: json["match_id"],
        inningId: json["inning_id"],
        matches: json["matches"],
        innings: json["innings"],
        balls: json["balls"],
        overs: json["overs"],
        runs: json["runs"],
        wickets: json["wickets"],
        bestinning: json["bestinning"],
        bestmatch: json["bestmatch"],
        econ: json["econ"],
        average: json["average"],
        strike: json["strike"],
        wicket4I: json["wicket4i"],
        wicket5I: json["wicket5i"],
        wicket10M: json["wicket10m"],
      );

  Map<String, dynamic> toJson() => {
        "match_id": matchId,
        "inning_id": inningId,
        "matches": matches,
        "innings": innings,
        "balls": balls,
        "overs": overs,
        "runs": runs,
        "wickets": wickets,
        "bestinning": bestinning,
        "bestmatch": bestmatch,
        "econ": econ,
        "average": average,
        "strike": strike,
        "wicket4i": wicket4I,
        "wicket5i": wicket5I,
        "wicket10m": wicket10M,
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
  List<dynamic>? primaryTeam;
  String? logoUrl;
  String? playingRole;
  String? battingStyle;
  String? bowlingStyle;
  String? fieldingPosition;
  int? recentMatch;
  int? recentAppearance;
  dynamic fantasyPlayerRating;
  String? altName;
  String? facebookProfile;
  String? twitterProfile;
  String? instagramProfile;
  String? debutData;
  String? thumbUrl;
  String? nationality;

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
    this.primaryTeam,
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
        primaryTeam: json["primary_team"] == null
            ? []
            : List<dynamic>.from(json["primary_team"]!.map((x) => x)),
        logoUrl: json["logo_url"],
        playingRole: json["playing_role"],
        battingStyle: json["batting_style"],
        bowlingStyle: json["bowling_style"],
        fieldingPosition: json["fielding_position"],
        recentMatch: json["recent_match"],
        recentAppearance: json["recent_appearance"],
        fantasyPlayerRating: json["fantasy_player_rating"],
        altName: json["alt_name"],
        facebookProfile: json["facebook_profile"],
        twitterProfile: json["twitter_profile"],
        instagramProfile: json["instagram_profile"],
        debutData: json["debut_data"],
        thumbUrl: json["thumb_url"],
        nationality: json["nationality"],
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
        "primary_team": primaryTeam == null
            ? []
            : List<dynamic>.from(primaryTeam!.map((x) => x)),
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
      };
}

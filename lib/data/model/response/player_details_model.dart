// To parse this JSON data, do
//
//     final playerDetailsModel = playerDetailsModelFromJson(jsonString);

import 'dart:convert';

PlayerDetailsModel playerDetailsModelFromJson(String str) =>
    PlayerDetailsModel.fromJson(json.decode(str));

String playerDetailsModelToJson(PlayerDetailsModel data) =>
    json.encode(data.toJson());

class PlayerDetailsModel {
  Data? data;

  PlayerDetailsModel({
    this.data,
  });

  factory PlayerDetailsModel.fromJson(Map<String, dynamic> json) =>
      PlayerDetailsModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  String? resource;
  int? id;
  int? countryId;
  String? firstname;
  String? lastname;
  String? fullname;
  String? imagePath;
  DateTime? dateofbirth;
  String? gender;
  String? battingstyle;
  String? bowlingstyle;
  Position? position;
  DateTime? updatedAt;
  List<Career>? career;

  Data({
    this.resource,
    this.id,
    this.countryId,
    this.firstname,
    this.lastname,
    this.fullname,
    this.imagePath,
    this.dateofbirth,
    this.gender,
    this.battingstyle,
    this.bowlingstyle,
    this.position,
    this.updatedAt,
    this.career,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        resource: json["resource"],
        id: json["id"],
        countryId: json["country_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        fullname: json["fullname"],
        imagePath: json["image_path"],
        dateofbirth: json["dateofbirth"] == null
            ? null
            : DateTime.parse(json["dateofbirth"]),
        gender: json["gender"],
        battingstyle: json["battingstyle"],
        bowlingstyle: json["bowlingstyle"],
        position: json["position"] == null
            ? null
            : Position.fromJson(json["position"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        career: json["career"] == null
            ? []
            : List<Career>.from(json["career"]!.map((x) => Career.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "resource": resource,
        "id": id,
        "country_id": countryId,
        "firstname": firstname,
        "lastname": lastname,
        "fullname": fullname,
        "image_path": imagePath,
        "dateofbirth":
            "${dateofbirth!.year.toString().padLeft(4, '0')}-${dateofbirth!.month.toString().padLeft(2, '0')}-${dateofbirth!.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "battingstyle": battingstyle,
        "bowlingstyle": bowlingstyle,
        "position": position?.toJson(),
        "updated_at": updatedAt?.toIso8601String(),
        "career": career == null
            ? []
            : List<dynamic>.from(career!.map((x) => x.toJson())),
      };
}

class Career {
  String? resource;
  String? type;
  int? seasonId;
  int? playerId;
  BowlingCareer? bowling;
  BattingCareer? batting;
  DateTime? updatedAt;

  Career({
    this.resource,
    this.type,
    this.seasonId,
    this.playerId,
    this.bowling,
    this.batting,
    this.updatedAt,
  });

  factory Career.fromJson(Map<String, dynamic> json) => Career(
        resource: json["resource"],
        type: json["type"],
        seasonId: json["season_id"],
        playerId: json["player_id"],
        bowling: json["bowling"] == null
            ? null
            : BowlingCareer.fromJson(json["bowling"]),
        batting: json["batting"] == null
            ? null
            : BattingCareer.fromJson(json["batting"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "resource": resource,
        "type": type,
        "season_id": seasonId,
        "player_id": playerId,
        "bowling": bowling?.toJson(),
        "batting": batting?.toJson(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class BattingCareer {
  int? matches;
  int? innings;
  int? runsScored;
  int? notOuts;
  int? highestInningScore;
  dynamic strikeRate;
  int? ballsFaced;
  dynamic average;
  int? fourX;
  int? sixX;
  int? fowScore;
  dynamic fowBalls;
  int? hundreds;
  int? fifties;
  String? abhi;

  BattingCareer({
    this.matches,
    this.innings,
    this.runsScored,
    this.notOuts,
    this.highestInningScore,
    this.strikeRate,
    this.ballsFaced,
    this.average,
    this.fourX,
    this.sixX,
    this.fowScore,
    this.fowBalls,
    this.hundreds,
    this.fifties,
    this.abhi,
  });

  factory BattingCareer.fromJson(Map<String, dynamic> json) => BattingCareer(
        matches: json["matches"],
        innings: json["innings"],
        runsScored: json["runs_scored"],
        notOuts: json["not_outs"],
        highestInningScore: json["highest_inning_score"],
        strikeRate: json["strike_rate"],
        ballsFaced: json["balls_faced"],
        average: json["average"],
        fourX: json["four_x"],
        sixX: json["six_x"],
        fowScore: json["fow_score"],
        fowBalls: json["fow_balls"],
        hundreds: json["hundreds"],
        fifties: json["fifties"],
        abhi: json["abhi"],
      );

  Map<String, dynamic> toJson() => {
        "matches": matches,
        "innings": innings,
        "runs_scored": runsScored,
        "not_outs": notOuts,
        "highest_inning_score": highestInningScore,
        "strike_rate": strikeRate,
        "balls_faced": ballsFaced,
        "average": average,
        "four_x": fourX,
        "six_x": sixX,
        "fow_score": fowScore,
        "fow_balls": fowBalls,
        "hundreds": hundreds,
        "fifties": fifties,
        "abhi": abhi,
      };
}

class BowlingCareer {
  int? matches;
  dynamic overs;
  int? innings;
  double? average;
  double? econRate;
  int? medians;
  int? runs;
  int? wickets;
  int? wide;
  int? noball;
  dynamic strikeRate;
  int? fourWickets;
  int? fiveWickets;
  int? tenWickets;
  dynamic rate;
  String? abhi;

  BowlingCareer({
    this.matches,
    this.overs,
    this.innings,
    this.average,
    this.econRate,
    this.medians,
    this.runs,
    this.wickets,
    this.wide,
    this.noball,
    this.strikeRate,
    this.fourWickets,
    this.fiveWickets,
    this.tenWickets,
    this.rate,
    this.abhi,
  });

  factory BowlingCareer.fromJson(Map<String, dynamic> json) => BowlingCareer(
        matches: json["matches"],
        overs: json["overs"],
        innings: json["innings"],
        average: json["average"]?.toDouble(),
        econRate: json["econ_rate"]?.toDouble(),
        medians: json["medians"],
        runs: json["runs"],
        wickets: json["wickets"],
        wide: json["wide"],
        noball: json["noball"],
        strikeRate: json["strike_rate"],
        fourWickets: json["four_wickets"],
        fiveWickets: json["five_wickets"],
        tenWickets: json["ten_wickets"],
        rate: json["rate"],
        abhi: json["abhi"],
      );

  Map<String, dynamic> toJson() => {
        "matches": matches,
        "overs": overs,
        "innings": innings,
        "average": average,
        "econ_rate": econRate,
        "medians": medians,
        "runs": runs,
        "wickets": wickets,
        "wide": wide,
        "noball": noball,
        "strike_rate": strikeRate,
        "four_wickets": fourWickets,
        "five_wickets": fiveWickets,
        "ten_wickets": tenWickets,
        "rate": rate,
        "abhi": abhi,
      };
}

class Position {
  String? resource;
  int? id;
  String? name;

  Position({
    this.resource,
    this.id,
    this.name,
  });

  factory Position.fromJson(Map<String, dynamic> json) => Position(
        resource: json["resource"],
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "resource": resource,
        "id": id,
        "name": name,
      };
}

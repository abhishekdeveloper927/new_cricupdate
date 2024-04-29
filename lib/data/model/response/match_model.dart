// To parse this JSON data, do
//
//     final matchModel = matchModelFromJson(jsonString);

import 'dart:convert';

MatchModel matchModelFromJson(String str) =>
    MatchModel.fromJson(json.decode(str));

String matchModelToJson(MatchModel data) => json.encode(data.toJson());

class MatchModel {
  int? id;
  String? team1;
  String? team1Image;
  String? team2Image;
  String? team1ShortName;
  String? team2ShortName;
  String? team2;
  String? team1Score;
  String? team2Score;
  String? matchType;
  List<TeamPlayer>? team1Player;
  List<TeamPlayer>? team2Player;
  String? currentRunRate;
  String? reqRunRate;
  String? matchPlace;
  String? matchDate;
  String? target;
  String? overs;
  String? matchTime;
  String? the3RdUmpire;
  List<String>? commentary;
  String? won;
  String? matchStatus;

  MatchModel(
      {this.id,
      this.team1,
      this.team1Image,
      this.team2Image,
      this.team1ShortName,
      this.team2ShortName,
      this.team2,
      this.team1Score,
      this.team2Score,
      this.matchType,
      this.team1Player,
      this.team2Player,
      this.currentRunRate,
      this.reqRunRate,
      this.matchPlace,
      this.matchDate,
      this.target,
      this.overs,
      this.matchTime,
      this.the3RdUmpire,
      this.commentary,
      this.won,
      this.matchStatus});

  factory MatchModel.fromJson(Map<String, dynamic> json) => MatchModel(
        id: json["id"],
        team1: json["team1"],
        team1Image: json["team1_image"],
        team2Image: json["team2_image"],
        team1ShortName: json["team1_short_name"],
        team2ShortName: json["team2_short_name"],
        team2: json["team2"],
        team1Score: json["team1_score"],
        team2Score: json["team2_score"],
        matchType: json["match_type"],
        team1Player: json["team1_player"] == null
            ? []
            : List<TeamPlayer>.from(
                json["team1_player"]!.map((x) => TeamPlayer.fromJson(x))),
        team2Player: json["team2_player"] == null
            ? []
            : List<TeamPlayer>.from(
                json["team2_player"]!.map((x) => TeamPlayer.fromJson(x))),
        currentRunRate: json["current_run_rate"],
        reqRunRate: json["req_run_rate"],
        matchPlace: json["match_place"],
        matchDate: json["match_date"],
        target: json["target"],
        overs: json["overs"],
        matchTime: json["match_time"],
        the3RdUmpire: json["3rd_umpire"],
        commentary: json["commentary"] == null
            ? []
            : List<String>.from(json["commentary"]!.map((x) => x)),
        won: json["won"],
        matchStatus: json["match_status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "team1": team1,
        "team1_image": team1Image,
        "team2_image": team2Image,
        "team1_short_name": team1ShortName,
        "team2_short_name": team2ShortName,
        "team2": team2,
        "team1_score": team1Score,
        "team2_score": team2Score,
        "match_type": matchType,
        "team1_player": team1Player == null
            ? []
            : List<dynamic>.from(team1Player!.map((x) => x.toJson())),
        "team2_player": team2Player == null
            ? []
            : List<dynamic>.from(team2Player!.map((x) => x.toJson())),
        "current_run_rate": currentRunRate,
        "req_run_rate": reqRunRate,
        "match_place": matchPlace,
        "match_date": matchDate,
        "target": target,
        "overs": overs,
        "match_time": matchTime,
        "3rd_umpire": the3RdUmpire,
        "commentary": commentary == null
            ? []
            : List<dynamic>.from(commentary!.map((x) => x)),
        "won": won,
        "match_status": matchStatus,
      };
}

class TeamPlayer {
  String? name;
  String? image;
  String? type;

  TeamPlayer({
    this.name,
    this.image,
    this.type,
  });

  factory TeamPlayer.fromJson(Map<String, dynamic> json) => TeamPlayer(
        name: json["name"],
        image: json["image"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "type": type,
      };
}

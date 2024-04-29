// To parse this JSON data, do
//
//     final winningPredictionModel = winningPredictionModelFromJson(jsonString);

import 'dart:convert';

WinningPredictionModel winningPredictionModelFromJson(String str) =>
    WinningPredictionModel.fromJson(json.decode(str));

String winningPredictionModelToJson(WinningPredictionModel data) =>
    json.encode(data.toJson());

class WinningPredictionModel {
  double? teamAWinningProbability;
  double? teamBWinningProbability;

  WinningPredictionModel({
    this.teamAWinningProbability,
    this.teamBWinningProbability,
  });

  factory WinningPredictionModel.fromJson(Map<String, dynamic> json) =>
      WinningPredictionModel(
        teamAWinningProbability: json["team_a_winning_probability"]?.toDouble(),
        teamBWinningProbability: json["team_b_winning_probability"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "team_a_winning_probability": teamAWinningProbability,
        "team_b_winning_probability": teamBWinningProbability,
      };
}

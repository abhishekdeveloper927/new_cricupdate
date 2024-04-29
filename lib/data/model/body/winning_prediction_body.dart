// To parse this JSON data, do
//
//     final winningPredictionBody = winningPredictionBodyFromJson(jsonString);

import 'dart:convert';

WinningPredictionBody winningPredictionBodyFromJson(String str) =>
    WinningPredictionBody.fromJson(json.decode(str));

String winningPredictionBodyToJson(WinningPredictionBody data) =>
    json.encode(data.toJson());

class WinningPredictionBody {
  int? teamARuns;
  int? teamBRuns;
  int? teamAFallenWickets;
  int? teamBFallenWickets;
  double? teamACurrentRunrate;
  double? teamBCurrentRunrate;
  double? teamARequiredRunrate;
  double? teamBRequiredRunrate;

  WinningPredictionBody({
    this.teamARuns,
    this.teamBRuns,
    this.teamAFallenWickets,
    this.teamBFallenWickets,
    this.teamACurrentRunrate,
    this.teamBCurrentRunrate,
    this.teamARequiredRunrate,
    this.teamBRequiredRunrate,
  });

  factory WinningPredictionBody.fromJson(Map<String, dynamic> json) =>
      WinningPredictionBody(
        teamARuns: json["team_a_runs"],
        teamBRuns: json["team_b_runs"],
        teamAFallenWickets: json["team_a_fallen_wickets"],
        teamBFallenWickets: json["team_b_fallen_wickets"],
        teamACurrentRunrate: json["team_a_current_runrate"],
        teamBCurrentRunrate: json["team_b_current_runrate"],
        teamARequiredRunrate: json["team_a_required_runrate"],
        teamBRequiredRunrate: json["team_b_required_runrate"],
      );

  Map<String, dynamic> toJson() => {
        "team_a_runs": teamARuns,
        "team_b_runs": teamBRuns,
        "team_a_fallen_wickets": teamAFallenWickets,
        "team_b_fallen_wickets": teamBFallenWickets,
        "team_a_current_runrate": teamACurrentRunrate,
        "team_b_current_runrate": teamBCurrentRunrate,
        "team_a_required_runrate": teamARequiredRunrate,
        "team_b_required_runrate": teamBRequiredRunrate,
      };
}

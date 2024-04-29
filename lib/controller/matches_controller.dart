/*
import 'dart:convert';

import 'package:cricupdate/data/model/response/league_page.dart';
import 'package:cricupdate/data/model/response/player_details_model.dart';
import 'package:cricupdate/data/model/response/player_page.dart';
import 'package:cricupdate/data/model/response/point_table_page.dart';
import 'package:cricupdate/data/model/response/ranking_page.dart';
import 'package:cricupdate/data/model/response/team_list_page.dart';
import 'package:cricupdate/data/model/response/team_page.dart';
import 'package:cricupdate/data/model/response/venue_page.dart';
import 'package:cricupdate/data/repository/matches_repo.dart';
import 'package:cricupdate/util/app_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class MatchesController extends GetxController implements GetxService {
  final MatchesRepo matchesRepo;

  MatchesController({required this.matchesRepo});

  bool isLoading = false;
  RankingPage? rankingPage;
  LeaguePage? leaguePage;
  TeamPage? homeTeamPage;
  TeamPage? awayTeamPage;
  TeamPage? pointsTeamPage;
  VenuePage? venuePage;
  PlayerPage? playerPage;
  PlayerDetailsModel? playerCareerDetailsModel;
  PointTablePage? pointTablePage;
  List<Career> carerSeriesList = [];
  TeamListPage? teamPage;
  List<TeamModel> internationTeamList = [];
  List<TeamModel> domesticTeamList = [];
  List<RankingModel> rankingList = [];
  List<RankingModel> odiMensTeamRankingList = [];
  List<RankingModel> t20MensTeamRankingList = [];
  List<RankingModel> testMensTeamRankingList = [];
  LeagueModel? selectedCompletedLeagueModel;
  LeagueModel? selectedUpcomingLeagueModel;
  LeagueModel? selectedLiveLeagueModel;

  void updateUpcomingLeague(LeagueModel model) {
    selectedUpcomingLeagueModel = model;
    update();
  }

  void clearUpcomingUpdateLeague() {
    selectedUpcomingLeagueModel = null;
    update();
  }

  void updateLiveLeague(LeagueModel model) {
    selectedLiveLeagueModel = model;
    update();
  }

  void clearLiveUpdateLeague() {
    selectedUpcomingLeagueModel = null;
    update();
  }

  void updateCompletedLeague(LeagueModel model) {
    selectedCompletedLeagueModel = model;
    update();
  }

  void clearCompletedUpdateLeague() {
    selectedCompletedLeagueModel = null;
    update();
  }

  Future<void> getTeamList() async {
    teamPage = null;
    final response = await http.get(Uri.parse(
        "${AppConstants.teamsUri}?api_token=${AppConstants.apiTokenUri}"));

    if (response.statusCode == 200) {
      teamPage = teamListPageFromJson(response.body);
      if (teamPage != null) {
        if (kDebugMode) {
          print(jsonEncode(teamPage));
        }
        internationTeamList = teamPage!.data!
            .where((element) => element.nationalTeam == true)
            .toList();
        domesticTeamList = teamPage!.data!
            .where((element) => element.nationalTeam == false)
            .toList();
      }
    } else {
      // Handle errors appropriately
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getAllUpcomingFixtureMatch(int? leagueId) async {
    upcomingFixtureMatchPage = null;
    isLoading = true;

    final response = await http.get(Uri.parse(leagueId == null
        ? "${AppConstants.fixturesUri}?api_token=${AppConstants.apiTokenUri}&filter[status]=NS&filter[starts_between]=${DateFormat('yyyy-MM-dd').format(DateTime.now())},${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(days: 20)))}"
        : "${AppConstants.fixturesUri}?api_token=${AppConstants.apiTokenUri}&filter[league_id]=$leagueId&filter[status]=NS&filter[starts_between]=${DateFormat('yyyy-MM-dd').format(DateTime.now())},${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(days: 20)))}"));

    if (response.statusCode == 200) {
      isLoading = false;
      upcomingFixtureMatchPage = fixtureMatchPageFromJson(response.body);
      if (kDebugMode) {
        print(jsonEncode(upcomingFixtureMatchPage));
      }
    } else {
      isLoading = false;
      // Handle errors appropriately
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getAllLiveFixtureMatch() async {
    liveFixtureMatchPage = null;
    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.liveScoreUri}?api_token=${AppConstants.apiTokenUri}"));

    if (response.statusCode == 200) {
      isLoading = false;
      liveFixtureMatchPage = fixtureMatchPageFromJson(response.body);
      if (kDebugMode) {
        print(jsonEncode(liveFixtureMatchPage));
      }
    } else {
      isLoading = false;
      // Handle errors appropriately
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getAllTodayFixtureMatch() async {
    todayFixtureMatchPage = null;
    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.fixturesUri}?api_token=${AppConstants.apiTokenUri}&filter[starts_between]=${DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(const Duration(days: 1)))},${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(days: 1)))}"));
    if (response.statusCode == 200) {
      isLoading = false;
      todayFixtureMatchPage = fixtureMatchPageFromJson(response.body);
      if (kDebugMode) {
        print(jsonEncode(todayFixtureMatchPage));
      }
    } else {
      isLoading = false;
      // Handle errors appropriately
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getAllCompletedFixtureMatch(int? leagueId) async {
    recentFixtureMatchPage = null;
    isLoading = true;
    final response = await http.get(Uri.parse(leagueId == null
        ? "${AppConstants.fixturesUri}?api_token=${AppConstants.apiTokenUri}&filter[status]=Finished&filter[starts_between]=${DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(const Duration(days: 5)))},${DateFormat('yyyy-MM-dd').format(DateTime.now())}"
        : "${AppConstants.fixturesUri}?api_token=${AppConstants.apiTokenUri}&filter[league_id]=$leagueId&filter[status]=Finished&filter[starts_between]=${DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(const Duration(days: 5)))},${DateFormat('yyyy-MM-dd').format(DateTime.now())}"));
    if (kDebugMode) {
      print(
          "${AppConstants.fixturesUri}?api_token=${AppConstants.apiTokenUri}&filter[league_id]=$leagueId&filter[status]=Finished&filter[starts_between]=${DateFormat('yyyy-MM-dd').format(DateTime.now())},${DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(const Duration(days: 10)))}");
    }
    if (response.statusCode == 200) {
      isLoading = false;
      recentFixtureMatchPage = fixtureMatchPageFromJson(response.body);
      if (kDebugMode) {
        print(jsonEncode(recentFixtureMatchPage));
      }
    } else {
      isLoading = false;
      // Handle errors appropriately
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getAllHomeCompletedFixtureMatch() async {
    homeRecentFixtureMatchPage = null;
    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.fixturesUri}?api_token=${AppConstants.apiTokenUri}&filter[status]=Finished&filter[starts_between]=${DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(const Duration(days: 1)))},${DateFormat('yyyy-MM-dd').format(DateTime.now())}"));

    if (response.statusCode == 200) {
      isLoading = false;
      homeRecentFixtureMatchPage = fixtureMatchPageFromJson(response.body);
      if (kDebugMode) {
        print(jsonEncode(homeRecentFixtureMatchPage));
      }
    } else {
      isLoading = false;
      // Handle errors appropriately
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getHomeTeamDetailsByTeamId({required int teamId}) async {
    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.teamsUri}/$teamId?api_token=${AppConstants.apiTokenUri}"));

    if (response.statusCode == 200) {
      isLoading = false;

      homeTeamPage = teamPageFromJson(response.body);
    } else {
      isLoading = false;
      // Handle errors appropriately
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getAwayTeamDetailsByTeamId({required int teamId}) async {
    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.teamsUri}/$teamId?api_token=${AppConstants.apiTokenUri}"));

    if (response.statusCode == 200) {
      isLoading = false;
      awayTeamPage = teamPageFromJson(response.body);
    } else {
      isLoading = false;
      // Handle errors appropriately
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getTeamDetailsByTeamId({required int teamId}) async {
    pointsTeamPage = null;
    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.teamsUri}/$teamId?api_token=${AppConstants.apiTokenUri}"));

    if (response.statusCode == 200) {
      isLoading = false;
      pointsTeamPage = teamPageFromJson(response.body);
    } else {
      isLoading = false;
      // Handle errors appropriately
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getHomeTeamSquadByTeamId(
      {required int teamId, required int sessionId}) async {
    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.teamsUri}/$teamId/squad/$sessionId?api_token=${AppConstants.apiTokenUri}"));

    if (response.statusCode == 200) {
      isLoading = false;
    } else {
      isLoading = false;
      // Handle errors appropriately
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getAwayTeamSquadByTeamId(
      {required int teamId, required int sessionId}) async {
    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.teamsUri}/$teamId/squad/$sessionId?api_token=${AppConstants.apiTokenUri}"));
    if (response.statusCode == 200) {
      isLoading = false;
    } else {
      isLoading = false;
      // Handle errors appropriately
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getVenueById({
    required int venue,
  }) async {
    venuePage = null;
    isLoading = true;
    final response = await http.get(
      Uri.parse(
          "${AppConstants.venueUri}/$venue?api_token=${AppConstants.apiTokenUri}"),
    );

    if (response.statusCode == 200) {
      isLoading = false;
      venuePage = venuePageFromJson(response.body);
    } else {
      isLoading = false;
      // Handle errors appropriately
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getAllLeagueList() async {
    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.leaguesUri}?api_token=${AppConstants.apiTokenUri}"));

    if (response.statusCode == 200) {
      isLoading = false;
      leaguePage = leaguePageFromJson(response.body);
    } else {
      isLoading = false;
      // Handle errors appropriately
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getTeamSquadByTeamIdAndSessionId(
      {required int teamId, required int sessionId}) async {
    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.teamsUri}/$teamId/squad/$sessionId?api_token=${AppConstants.apiTokenUri}"));

    if (response.statusCode == 200) {
      isLoading = false;
      upcomingFixtureMatchPage = fixtureMatchPageFromJson(response.body);
    } else {
      isLoading = false;
      // Handle errors appropriately
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getAllPlayerList() async {
    playerPage = null;
    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.playersUri}?api_token=${AppConstants.apiTokenUri}"));

    if (response.statusCode == 200) {
      isLoading = false;
      playerPage = playerPageFromJson(response.body);
      print(jsonEncode(playerPage));
    } else {
      isLoading = false;
      // Handle errors appropriately
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getBowlingScoreBoardByFixtureId({
    required int fixtureId,
  }) async {
    bowlingScoreboardPage = null;
    homeTeamBowling.clear();
    awayTeamBowling.clear();
    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.fixturesUri}/$fixtureId?include=bowling&api_token=${AppConstants.apiTokenUri}"));

    if (response.statusCode == 200) {
      isLoading = false;
      bowlingScoreboardPage = scoreboardPageFromJson(response.body);
      print(jsonEncode(bowlingScoreboardPage));

      if (bowlingScoreboardPage != null) {
        for (var i in bowlingScoreboardPage!.data!.bowling!) {
          if (bowlingScoreboardPage!.data!.localteamId == i.teamId) {
            homeTeamBowling.add(i);
          } else {
            awayTeamBowling.add(i);
          }
        }
      }
    } else {
      isLoading = false;
      // Handle errors appropriately
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getBBattingScoreBoardByFixtureId({
    required int fixtureId,
  }) async {
    batingScoreboardPage = null;
    homeTeamBatting.clear();
    awayTeamBatting.clear();
    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.fixturesUri}/$fixtureId?include=batting&api_token=${AppConstants.apiTokenUri}"));

    if (response.statusCode == 200) {
      isLoading = false;
      batingScoreboardPage = scoreboardPageFromJson(response.body);
      if (kDebugMode) {
        print(jsonEncode(batingScoreboardPage));
      }

      if (batingScoreboardPage != null) {
        for (var i in batingScoreboardPage!.data!.batting!) {
          if (batingScoreboardPage!.data!.localteamId == i.teamId) {
            homeTeamBatting.add(i);
          } else {
            awayTeamBatting.add(i);
          }
        }
      }
    } else {
      isLoading = false;
      // Handle errors appropriately
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getRunsScoreBoardByFixtureId({
    required int fixtureId,
  }) async {
    teamRunsPage = null;
    homeTeamRuns = null;
    awayTeamRuns = null;
    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.fixturesUri}/$fixtureId?include=runs&api_token=${AppConstants.apiTokenUri}"));
    print(
        "${AppConstants.fixturesUri}/$fixtureId?include=runs&api_token=${AppConstants.apiTokenUri}");
    if (response.statusCode == 200) {
      isLoading = false;
      teamRunsPage = scoreboardPageFromJson(response.body);
      print(jsonEncode(teamRunsPage));

      if (teamRunsPage != null) {
        for (var i in teamRunsPage!.data!.runs!) {
          if (teamRunsPage!.data!.localteamId == i.teamId) {
            homeTeamRuns = i;
          }
          if (teamRunsPage!.data!.visitorteamId == i.teamId) {
            awayTeamRuns = i;
          }
        }
      }
    } else {
      isLoading = false;
      // Handle errors appropriately
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getWinningTossScoreBoardByFixtureId({
    required int fixtureId,
  }) async {
    teamWonTossPage = null;
    winningTossTeam = null;
    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.fixturesUri}/$fixtureId?include=tosswon&api_token=${AppConstants.apiTokenUri}"));

    if (response.statusCode == 200) {
      isLoading = false;
      teamWonTossPage = scoreboardPageFromJson(response.body);
      print(jsonEncode(teamWonTossPage));

      if (teamWonTossPage != null) {
        if (teamWonTossPage!.data != null) {
          if (teamWonTossPage!.data!.tosswon != null) {
            winningTossTeam = teamWonTossPage!.data!.tosswon!;
          }
        }
      }
    } else {
      isLoading = false;
      // Handle errors appropriately
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> geBallByBallScoreBoardByFixtureId({
    required int fixtureId,
  }) async {
    ballByBallPage = null;
    homeTeamBallByBallDataList.clear();
    awayTeamBallByBallDataList.clear();
    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.fixturesUri}/$fixtureId?include=balls&api_token=${AppConstants.apiTokenUri}"));

    if (response.statusCode == 200) {
      isLoading = false;
      ballByBallPage = scoreboardPageFromJson(response.body);
      print(jsonEncode(ballByBallPage));

      if (ballByBallPage != null) {
        if (ballByBallPage!.data != null) {
          if (ballByBallPage!.data!.balls != null ||
              ballByBallPage!.data!.balls!.isNotEmpty) {
            for (var i in ballByBallPage!.data!.balls!) {
              if (i.teamId == ballByBallPage!.data!.localteamId!) {
                homeTeamBallByBallDataList.add(i);
              }
              if (i.teamId == ballByBallPage!.data!.visitorteamId!) {
                awayTeamBallByBallDataList.add(i);
              }
            }
          }
        }
      }
    } else {
      isLoading = false;
      // Handle errors appropriately
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getPlayerById({required int playerId}) async {
    playerDataModel = null;
    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.playersUri}/$playerId?api_token=${AppConstants.apiTokenUri}"));

    if (response.statusCode == 200) {
      isLoading = false;
      playerDataModel = playerDataModelFromJson(response.body);
    } else {
      isLoading = false;
      // Handle errors appropriately
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getPointsTable({required int sessionId}) async {
    pointTablePage = null;
    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.pointTableUri}/$sessionId?api_token=${AppConstants.apiTokenUri}"));

    if (response.statusCode == 200) {
      isLoading = false;
      pointTablePage = pointTablePageFromJson(response.body);
    } else {
      isLoading = false;
      // Handle errors appropriately
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getManOfTheMatchByFixtureId({
    required int fixtureId,
  }) async {
    manOfTheMatchPage = null;
    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.fixturesUri}/$fixtureId?include=manofmatch&api_token=${AppConstants.apiTokenUri}"));

    if (response.statusCode == 200) {
      isLoading = false;
      manOfTheMatchPage = scoreboardPageFromJson(response.body);
      print(jsonEncode(ballByBallPage));
    } else {
      isLoading = false;
      // Handle errors appropriately
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getPlayerDetailsById({required int playerId}) async {
    playerCareerDetailsModel = null;
    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.playersUri}/$playerId?api_token=${AppConstants.apiTokenUri}&include=career"));
    print(
        "${AppConstants.playersUri}/$playerId?api_token=${AppConstants.apiTokenUri}&include=career");
    if (response.statusCode == 200) {
      isLoading = false;
      playerCareerDetailsModel = playerDetailsModelFromJson(response.body);

      if (playerCareerDetailsModel != null) {
        if (playerCareerDetailsModel!.data != null) {
          if (playerCareerDetailsModel!.data!.career != null) {
            carerSeriesList = playerCareerDetailsModel!.data!.career!;
            carerSeriesList
                .sort((a, b) => b.updatedAt!.compareTo(a.updatedAt!));
          }
        }
      }
    } else {
      isLoading = false;
      // Handle errors appropriately
      throw Exception('Failed to load cricket data');
    }
    update();
  }
}
*/

import 'package:cricupdate/data/model/response/commentary_page.dart';
import 'package:cricupdate/data/model/response/competition_page.dart';
import 'package:cricupdate/data/model/response/live_matchh_detail_page.dart';
import 'package:cricupdate/data/model/response/match_info_page.dart';
import 'package:cricupdate/data/model/response/match_odds_page.dart';
import 'package:cricupdate/data/model/response/matchh_page.dart';
import 'package:cricupdate/data/model/response/player_page.dart';
import 'package:cricupdate/data/model/response/player_stats_page.dart';
import 'package:cricupdate/data/model/response/ranking_page.dart';
import 'package:cricupdate/data/model/response/scoreoard_detail_page.dart';
import 'package:cricupdate/data/model/response/team_page.dart';
import 'package:cricupdate/data/model/response/team_squad_page.dart';
import 'package:cricupdate/data/repository/all_matches_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../util/app_constants.dart';

class AllMatchesController extends GetxController implements GetxService {
  final AllMatchesRepo allMatchesRepo;

  AllMatchesController({required this.allMatchesRepo});

  MatchPage? matchPage;
  MatchPage? competitionMatchPage;
  List<Match> competitionMatchList = [];
  TeamPage? teamPage;
  List<TeamModel> teamList = [];
  MatchInfoPage? matchInfoPage;
  MatchInfoModel? matchInfoModel;
  MatchOddsPage? matchOddsPage;
  MatchOddsModel? matchOddsModel;
  List<Match> upcomingMatchList = [];
  List<Match> completeMatchList = [];
  List<Match> liveMatchList = [];
  ScoreboardDetailPage? scoreboardDetailPage;
  ScoreboardDetailsModel? scoreboardDetailsModel;
  TeamSquadPage? teamSquadPage;
  TeamSquadModel? teamSquadModel;
  CommentaryPage? commentaryPage;
  CommentaryModel? commentaryModel;
  RankingPage? rankingPage;
  RankingModel? rankingModel;
  CompetitionPage? competitionPage;
  List<CompetitionModel> liveCompetitionList = [];
  PlayerPage? playerPage;
  List<PlayerModel> playerList = [];
  PlayerStatsPage? playerStatsPage;
  PlayerStatsModel? playerStatsModel;
  List<CompetitionModel> completeCompetitionList = [];
  List<CompetitionModel> upcomingCompetitionList = [];
  int inning = 1;
  CompetitionModel? selectedCompetitionModel;

  int selectedRankType = 1;
  int selectedMatchFormat = 0;

  updateInning(int index) {
    inning = index;
    update();
  }

  updateMatchFormat(int index) {
    selectedMatchFormat = index;
    update();
  }

  updateRankType(int index) {
    selectedRankType = index;
    update();
  }

  updateCompetitionModel(CompetitionModel model) {
    selectedCompetitionModel = model;
    update();
  }

  clearCompetitionModel() {
    selectedCompetitionModel = null;
    update();
  }

  LiveMatchDetailsPage? liveMatchDetailsPage;
  LiveMatchDetailModel? liveMatchDetailModel;

  bool isLoading = false;

  Future<void> getAllMatches({
    required String token,
    required int status,
    int? format,
  }) async {
    if (status == 1) {
      upcomingMatchList.clear();
    }
    if (status == 2) {
      completeMatchList.clear();
    }
    if (status == 3) {
      liveMatchList.clear();
    }

    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.cricketBaseUri}${AppConstants.allMatchesUri}?status=$status&format=$format&token=$token"));
    print(
        "${AppConstants.cricketBaseUri}${AppConstants.allMatchesUri}?status=$status&format=$format&token=$token");

    if (response.statusCode == 200) {
      isLoading = false;
      matchPage = matchPageFromJson(response.body);
      if (matchPage != null) {
        if (matchPage!.response != null) {
          if (matchPage!.response!.items != null ||
              matchPage!.response!.items!.isNotEmpty) {
            if (status == 1) {
              upcomingMatchList = matchPage!.response!.items!;
            }
            if (status == 2) {
              completeMatchList = matchPage!.response!.items!;
            }
            if (status == 3) {
              liveMatchList = matchPage!.response!.items!;
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

  Future<void> getMatchDetails({
    required String token,
    required int matchId,
  }) async {
    matchInfoPage = null;
    matchInfoModel = null;
    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.cricketBaseUri}${AppConstants.allMatchesUri}$matchId/info?token=$token"));

    if (response.statusCode == 200) {
      isLoading = false;
      matchInfoPage = matchInfoPageFromJson(response.body);

      if (matchInfoPage != null) {
        if (matchInfoPage!.response != null) {
          matchInfoModel = matchInfoPage!.response;
        }
      }
    } else {
      isLoading = false;
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getMatchOdds({
    required String token,
    required int matchId,
  }) async {
    matchOddsPage = null;
    matchOddsModel = null;
    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.cricketBaseUri}${AppConstants.allMatchesUri}$matchId/odds?token=$token"));

    if (response.statusCode == 200) {
      isLoading = false;
      matchOddsPage = matchOddsPageFromJson(response.body);

      if (matchOddsPage != null) {
        if (matchOddsPage!.response != null) {
          matchOddsModel = matchOddsPage!.response;
        }
      }
    } else {
      isLoading = false;
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getCommentaryByInning({
    required String token,
    required int matchId,
    required int inningsId,
  }) async {
    commentaryPage = null;
    commentaryModel = null;
    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.cricketBaseUri}${AppConstants.allMatchesUri}$matchId/innings/$inningsId/commentary?token=$token"));
    print(
        "${AppConstants.cricketBaseUri}${AppConstants.allMatchesUri}$matchId/innings/$inningsId/commentary?token=$token");

    if (response.statusCode == 200) {
      isLoading = false;
      commentaryPage = commentaryPageFromJson(response.body);

      if (commentaryPage != null) {
        if (commentaryPage!.response != null) {
          commentaryModel = commentaryPage!.response;
        }
      }
    } else {
      isLoading = false;
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getRanking({
    required String token,
  }) async {
    rankingPage = null;
    rankingModel = null;
    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.cricketBaseUri}${AppConstants.rankingUri}?token=$token"));
    print(
        "${AppConstants.cricketBaseUri}${AppConstants.rankingUri}?token=$token");

    if (response.statusCode == 200) {
      isLoading = false;
      rankingPage = rankingPageFromJson(response.body);

      if (rankingPage != null) {
        if (rankingPage!.response != null) {
          rankingModel = rankingPage!.response;
        }
      }
    } else {
      isLoading = false;
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getCompetitionList({
    required String token,
    required String status,
  }) async {
    competitionPage = null;
    if (status == "live") {
      liveCompetitionList.clear();
    }
    if (status == "result") {
      completeCompetitionList.clear();
    }
    if (status == "fixture") {
      upcomingCompetitionList.clear();
    }
    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.cricketBaseUri}${AppConstants.competitionUri}?token=$token&per_page=30&&paged=1&status=$status"));
    print(
        "${AppConstants.cricketBaseUri}${AppConstants.competitionUri}?token=$token&per_page=30&&paged=1&status=&status");

    if (response.statusCode == 200) {
      isLoading = false;
      competitionPage = competitionPageFromJson(response.body);

      if (competitionPage != null) {
        if (competitionPage!.response != null) {
          if (competitionPage!.response!.items != null) {
            if (status == "live") {
              liveCompetitionList = competitionPage!.response!.items!;
            }
            if (status == "result") {
              completeCompetitionList = competitionPage!.response!.items!;
            }
            if (status == "fixture") {
              upcomingCompetitionList = competitionPage!.response!.items!;
            }
          }
        }
      }
    } else {
      isLoading = false;
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getPlayerList({
    required String token,
    required String search,
  }) async {
    playerPage = null;
    playerList.clear();
    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.cricketBaseUri}${AppConstants.playerUri}?token=$token&per_page=30&&paged=1&search=$search"));
    print(
        "${AppConstants.cricketBaseUri}${AppConstants.playerUri}?token=$token");
    if (response.statusCode == 200) {
      isLoading = false;
      playerPage = playerPageFromJson(response.body);

      if (playerPage != null) {
        if (playerPage!.response != null) {
          if (playerPage!.response!.items != null) {
            playerList = playerPage!.response!.items!;
          }
        }
      }
    } else {
      isLoading = false;
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getPlayerStats({
    required String token,
    required int playerId,
  }) async {
    playerStatsPage = null;
    playerStatsModel = null;
    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.cricketBaseUri}${AppConstants.playerUri}/$playerId/stats?token=$token"));
    if (kDebugMode) {
      print(
          "${AppConstants.cricketBaseUri}${AppConstants.playerUri}/$playerId/stats?token=$token");
    }
    if (response.statusCode == 200) {
      isLoading = false;
      playerStatsPage = playerStatsPageFromJson(response.body);

      if (playerStatsPage != null) {
        if (playerStatsPage!.response != null) {
          playerStatsModel = playerStatsPage!.response;
        }
      }
    } else {
      isLoading = false;
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getCompetitionMatchesList({
    required String token,
    required int competitionId,
  }) async {
    competitionMatchPage = null;
    competitionMatchList.clear();
    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.cricketBaseUri}${AppConstants.competitionUri}/$competitionId/matches?token=$token&per_page=150&&paged=1"));
    if (kDebugMode) {
      print(
          "${AppConstants.cricketBaseUri}${AppConstants.competitionUri}/$competitionId/matches?token=$token&per_page=150&&paged=1");
    }

    if (response.statusCode == 200) {
      isLoading = false;
      competitionMatchPage = matchPageFromJson(response.body);

      if (competitionMatchPage != null) {
        if (competitionMatchPage!.response != null) {
          if (competitionMatchPage!.response!.items != null) {
            competitionMatchList = competitionMatchPage!.response!.items!;
          }
        }
      }
    } else {
      isLoading = false;
      throw Exception('Failed to load cricket data');
    }
    update();
  }

  Future<void> getTeamsList({
    required String token,
    required String search,
  }) async {
    teamPage = null;
    teamList.clear();
    isLoading = true;
    final response = await http.get(Uri.parse(
        "${AppConstants.cricketBaseUri}${AppConstants.teamUri}?token=$token&per_page=30&&paged=1&search=$search"));
    if (kDebugMode) {
      print(
          "${AppConstants.cricketBaseUri}${AppConstants.teamUri}?token=$token&per_page=30&&paged=1");
    }
    if (response.statusCode == 200) {
      isLoading = false;
      teamPage = teamPageFromJson(response.body);

      if (teamPage != null) {
        if (teamPage!.response != null) {
          if (teamPage!.response!.items != null) {
            teamList = teamPage!.response!.items!;
          }
        }
      }
    } else {
      isLoading = false;
      throw Exception('Failed to load cricket data');
    }
    update();
  }
}

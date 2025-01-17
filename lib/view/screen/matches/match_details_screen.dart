import 'package:cricupdate/data/model/response/matchh_page.dart';
import 'package:cricupdate/view/screen/competition_details/competition_details.dart';
import 'package:cricupdate/view/screen/matches/commentary_screen.dart';
import 'package:cricupdate/view/screen/matches/info_screen.dart';
import 'package:cricupdate/view/screen/matches/live_match_screen.dart';
import 'package:cricupdate/view/screen/matches/scoreboard_screen.dart';
import 'package:cricupdate/view/screen/matches/team_squads_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../util/dimensions.dart';

class MatchDetailsScreen extends StatelessWidget {
  final Match match;

  const MatchDetailsScreen({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Get.theme.primaryColor,
          title: Text(
            "${match.teama != null ? match.teama!.shortName ?? "" : ""} Vs ${match.teamb != null ? match.teamb!.shortName ?? "" : ""}",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.fontSizeLarge),
          ),
          actions: [
            PopupMenuButton(
                color: Colors.white,
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem<int>(
                      value: 0,
                      child: Text(
                        "Series Page",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ];
                },
                onSelected: (value) {
                  if (value == 0) {
                    Get.to(() => CompetitionDetailsScreen(
                        competitionModel: match.competition!));
                  }
                }),
          ],
          bottom: TabBar(
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            labelColor: Colors.white,
            indicatorColor: Theme.of(context).primaryColor,
            tabs: const [
              Tab(text: "Live"),
              Tab(text: "Scorecard"),
              Tab(
                text: "Info",
              ),
              Tab(text: "Squads"),
              Tab(text: "Highlights"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LiveMatchScreen(
              match: match,
            ),
            ScoreboardScreen(
              matchModel: match,
            ),
            InfoScreen(matchModel: match),
            TeamSquadsScreen(matchModel: match),
            CommentaryScreen(
              matchModel: match,
            ),
            /*
            InfoScreen(matchModel: match),*/
          ],
        ),
      ),
    );
  }
}

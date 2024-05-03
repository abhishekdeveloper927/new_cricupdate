import 'package:cricupdate/data/model/response/competition_page.dart';
import 'package:cricupdate/view/screen/competition_details/competition_all_matches_screen.dart';
import 'package:cricupdate/view/screen/competition_details/competition_teams_screen.dart';
import 'package:cricupdate/view/screen/competition_details/competition_venue_screen.dart';
import 'package:cricupdate/view/screen/competition_details/points_table_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/dimensions.dart';

class CompetitionDetailsScreen extends StatelessWidget {
  final CompetitionModel competitionModel;

  const CompetitionDetailsScreen({super.key, required this.competitionModel});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Get.theme.primaryColor,
            title: Text(
              competitionModel.title ?? "",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.fontSizeLarge),
            ),
            bottom: TabBar(
              isScrollable: true,
              labelColor: Colors.white,
              tabAlignment: TabAlignment.start,
              indicatorColor: Theme.of(context).primaryColor,
              tabs: const [
                Tab(text: "Matches"),
                Tab(text: "Points Table"),
                Tab(text: "Teams"),
                Tab(text: "Venues"),
              ],
            ),
          ),
          backgroundColor: Get.theme.scaffoldBackgroundColor,
          body: TabBarView(
            children: [
              CompetitionAllMatchesScreen(competitionModel: competitionModel),
              PointTableScreen(competitionModel: competitionModel),
              CompetitionTeamsScreen(competitionModel: competitionModel),
              CompetitionVenueScreen(competitionModel: competitionModel),
            ],
          )),
    );
  }
}

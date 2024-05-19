import 'package:cricupdate/controller/all_matches_controller.dart';
import 'package:cricupdate/controller/auth_controller.dart';
import 'package:cricupdate/data/model/response/competition_page.dart';
import 'package:cricupdate/view/base/loader.dart';
import 'package:cricupdate/view/screen/matches/widget/completed_match_card.dart';
import 'package:cricupdate/view/screen/matches/widget/live_match_card.dart';
import 'package:cricupdate/view/screen/matches/widget/match_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/dimensions.dart';

class CompetitionAllMatchesScreen extends StatefulWidget {
  final CompetitionModel competitionModel;

  const CompetitionAllMatchesScreen(
      {super.key, required this.competitionModel});

  @override
  State<CompetitionAllMatchesScreen> createState() =>
      _CompetitionAllMatchesScreenState();
}

class _CompetitionAllMatchesScreenState
    extends State<CompetitionAllMatchesScreen> {
  @override
  void initState() {
    Get.find<AllMatchesController>().getCompetitionMatchesList(
        token: Get.find<AuthController>().entityToken,
        competitionId: widget.competitionModel.cid!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllMatchesController>(
      builder: (matchesController) {
        if (matchesController.isLoading) {
          return const Loader();
        }
        if (matchesController.competitionMatchList.isEmpty) {
          return Center(
            child: Text(
              "No data found",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.fontSizeLarge),
            ),
          );
        }
        return ListView.builder(
            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            itemCount: matchesController.competitionMatchList.length,
            itemBuilder: (context, index) {
              return matchesController.competitionMatchList[index].status == 1
                  ? MatchCard(
                      matchModel: matchesController.competitionMatchList[index])
                  : matchesController.competitionMatchList[index].status == 2
                      ? CompletedMatchCard(
                          matchModel:
                              matchesController.competitionMatchList[index])
                      : LiveMatchCard(
                          matchModel:
                              matchesController.competitionMatchList[index]);
            });
      },
    );
  }
}

import 'package:cricupdate/controller/all_matches_controller.dart';
import 'package:cricupdate/controller/auth_controller.dart';
import 'package:cricupdate/view/base/loader.dart';
import 'package:cricupdate/view/screen/competition/widgets/competition_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/dimensions.dart';

class CompletedCompetitionScreen extends StatefulWidget {
  const CompletedCompetitionScreen({super.key});

  @override
  State<CompletedCompetitionScreen> createState() =>
      _CompletedCompetitionScreenState();
}

class _CompletedCompetitionScreenState
    extends State<CompletedCompetitionScreen> {
  @override
  void initState() {
    Get.find<AllMatchesController>().getCompetitionList(
        token: Get.find<AuthController>().entityToken, status: "result");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllMatchesController>(
      builder: (matchesController) {
        if (matchesController.isLoading) {
          return const Loader();
        }
        if (matchesController.completeCompetitionList.isEmpty) {
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
            itemCount: matchesController.completeCompetitionList.length,
            itemBuilder: (context, index) {
              return CompetitionCard(
                  competitionModel:
                      matchesController.completeCompetitionList[index]);
            });
      },
    );
  }
}

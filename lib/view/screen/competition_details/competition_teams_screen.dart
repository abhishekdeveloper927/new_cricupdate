import 'package:cricupdate/controller/all_matches_controller.dart';
import 'package:cricupdate/controller/auth_controller.dart';
import 'package:cricupdate/data/model/response/competition_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/dimensions.dart';
import '../../../util/images.dart';
import '../teams/team_details_screen.dart';

class CompetitionTeamsScreen extends StatefulWidget {
  final CompetitionModel competitionModel;

  const CompetitionTeamsScreen({super.key, required this.competitionModel});

  @override
  State<CompetitionTeamsScreen> createState() => _CompetitionTeamsScreenState();
}

class _CompetitionTeamsScreenState extends State<CompetitionTeamsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<AllMatchesController>().getCompetitionInfo(
          token: Get.find<AuthController>().entityToken,
          competitionId: widget.competitionModel.cid!);
    });
    super.initState();
  }

  final ScrollController controller = ScrollController();
  final ScrollController controller2 = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllMatchesController>(builder: (matchesController) {
      if (matchesController.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (matchesController.competitionInfoModel == null) {
        return Center(
          child: Text(
            "No Data Found",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.fontSizeLarge),
          ),
        );
      }
      if (matchesController.competitionInfoModel == null) {
        return Center(
          child: Text(
            "No Data Found",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.fontSizeLarge),
          ),
        );
      }
      if (matchesController.competitionInfoModel!.teams == null ||
          matchesController.competitionInfoModel!.teams!.isEmpty) {
        return Center(
          child: Text(
            "No Data Found",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.fontSizeLarge),
          ),
        );
      }

      return ListView.builder(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        itemCount: matchesController.competitionInfoModel!.teams!.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.to(() => TeamDetailsScreen(
                  teamModel:
                      matchesController.competitionInfoModel!.teams![index]));
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Get.theme.cardColor,
                borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              ),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    matchesController
                        .competitionInfoModel!.teams![index].logoUrl!,
                    height: 35,
                    width: 35,
                    errorBuilder: (BuildContext context, Object object,
                        StackTrace? tree) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          Images.appIcon2,
                          height: 35,
                          width: 35,
                        ),
                      );
                    },
                  ),
                ),
                title: Text(
                  matchesController.competitionInfoModel!.teams![index].title!,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: Dimensions.fontSizeDefault,
                      fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 18,
                  color: Colors.black,
                ),
              ),
            ),
          );
        },
      );
    });
  }
}

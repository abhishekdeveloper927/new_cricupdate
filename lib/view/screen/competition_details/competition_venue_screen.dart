import 'package:cricupdate/controller/all_matches_controller.dart';
import 'package:cricupdate/controller/auth_controller.dart';
import 'package:cricupdate/data/model/response/competition_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/dimensions.dart';
import '../../../util/images.dart';
import '../teams/team_details_screen.dart';

class CompetitionVenueScreen extends StatefulWidget {
  final CompetitionModel competitionModel;

  const CompetitionVenueScreen({super.key, required this.competitionModel});

  @override
  State<CompetitionVenueScreen> createState() => _CompetitionVenueScreenState();
}

class _CompetitionVenueScreenState extends State<CompetitionVenueScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<AllMatchesController>().getCompetitionInfo(
          token: Get.find<AuthController>().entityToken,
          competitionId: widget.competitionModel.cid!);
    });
    super.initState();
  }

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
      if (matchesController.competitionInfoModel!.venueList == null ||
          matchesController.competitionInfoModel!.venueList!.isEmpty) {
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
        itemCount: matchesController.competitionInfoModel!.venueList!.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Get.theme.cardColor,
                borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radiusDefault),
                        bottomLeft: Radius.circular(Dimensions.radiusDefault)),
                    child: Image.asset(
                      Images.ground,
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.paddingSizeDefault,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          matchesController
                              .competitionInfoModel!.venueList![index].name!,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.fontSizeDefault,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          matchesController
                              .competitionInfoModel!.venueList![index].city!,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.fontSizeDefault,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Capacity : " +
                              matchesController.competitionInfoModel!
                                  .venueList![index].capacity!,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.fontSizeDefault,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    });
  }
}

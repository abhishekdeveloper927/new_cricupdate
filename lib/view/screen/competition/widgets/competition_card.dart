import 'package:cricupdate/data/model/response/competition_page.dart';
import 'package:cricupdate/view/screen/competition/competition_matches_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/dimensions.dart';

class CompetitionCard extends StatelessWidget {
  final CompetitionModel competitionModel;

  const CompetitionCard({super.key, required this.competitionModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
            () => CompetitionMatchesScreen(competitionModel: competitionModel));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: Dimensions.paddingSizeDefault),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
            boxShadow: [BoxShadow(color: Colors.grey[300]!, blurRadius: 3)]),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radiusDefault),
                      topRight: Radius.circular(Dimensions.radiusDefault))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      competitionModel.title ?? '',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.fontSizeLarge,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black,
                    size: 19,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        competitionModel.category ?? '',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.fontSizeLarge,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.all(Dimensions.paddingSizeSmall),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4)),
                        child: Text(
                          competitionModel.status ?? '',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Dimensions.fontSizeDefault,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.paddingSizeSmall,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Matches",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.fontSizeDefault,
                        ),
                      ),
                      Text(
                        competitionModel.totalMatches ?? '',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.fontSizeDefault,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.paddingSizeSmall,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Format",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.fontSizeDefault,
                        ),
                      ),
                      Text(
                        competitionModel.gameFormat ?? '',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.fontSizeDefault,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:cricupdate/controller/all_matches_controller.dart';
import 'package:cricupdate/data/model/response/matchh_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller.dart';
import '../../../util/dimensions.dart';
import '../../base/loader.dart';

class CommentaryScreen extends StatefulWidget {
  final Match matchModel;

  const CommentaryScreen({super.key, required this.matchModel});

  @override
  State<CommentaryScreen> createState() => _CommentaryScreenState();
}

class _CommentaryScreenState extends State<CommentaryScreen> {
  @override
  void initState() {
    Get.find<AllMatchesController>().getCommentaryByInning(
        token: Get.find<AuthController>().entityToken!,
        matchId: widget.matchModel.matchId!,
        inningsId: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllMatchesController>(builder: (matchesController) {
      if (matchesController.isLoading) {
        return const Loader();
      }
      if (matchesController.commentaryModel == null) {
        return Center(
          child: Text(
            "Match has not started yet",
            style: TextStyle(
                color: Colors.black,
                fontSize: Dimensions.fontSizeLarge,
                fontWeight: FontWeight.bold),
          ),
        );
      }
      return ListView(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        children: [
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () async {
                    matchesController.updateInning(1);
                    await Get.find<AllMatchesController>()
                        .getCommentaryByInning(
                            token: Get.find<AuthController>().entityToken!,
                            matchId: widget.matchModel.matchId!,
                            inningsId: 1);
                    setState(() {});
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.all(Dimensions.paddingSizeDefault),
                    decoration: BoxDecoration(
                      color: matchesController.inning == 1
                          ? Get.theme.primaryColor
                          : Colors.grey,
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusDefault),
                    ),
                    child: Center(
                      child: Text(
                        "1st Inning",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.fontSizeLarge),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: Dimensions.paddingSizeDefault,
              ),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    matchesController.updateInning(2);
                    await Get.find<AllMatchesController>()
                        .getCommentaryByInning(
                            token: Get.find<AuthController>().entityToken!,
                            matchId: widget.matchModel.matchId!,
                            inningsId: 2);
                    setState(() {});
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.all(Dimensions.paddingSizeDefault),
                    decoration: BoxDecoration(
                      color: matchesController.inning == 2
                          ? Get.theme.primaryColor
                          : Colors.grey,
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusDefault),
                    ),
                    child: Center(
                      child: Text(
                        "2nd Inning",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.fontSizeLarge),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: Dimensions.paddingSizeDefault,
          ),
          const SizedBox(
            height: Dimensions.paddingSizeDefault,
          ),
          matchesController.commentaryModel!.commentaries != null
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      matchesController.commentaryModel!.commentaries!.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    int reversedIndex = matchesController
                            .commentaryModel!.commentaries!.length -
                        1 -
                        index;
                    return Container(
                      margin: const EdgeInsets.only(
                          bottom: Dimensions.paddingSizeDefault),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          matchesController.commentaryModel!
                                      .commentaries![reversedIndex].event !=
                                  "overend"
                              ? Column(
                                  children: [
                                    Text(
                                      "${matchesController.commentaryModel!.commentaries![reversedIndex].over}.${matchesController.commentaryModel!.commentaries![reversedIndex].ball}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: Dimensions.fontSizeLarge,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(
                                          Dimensions.paddingSizeSmall),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: matchesController
                                                      .commentaryModel!
                                                      .commentaries![
                                                          reversedIndex]
                                                      .event ==
                                                  "wicket"
                                              ? Colors.red
                                              : matchesController
                                                          .commentaryModel!
                                                          .commentaries![
                                                              reversedIndex]
                                                          .four ==
                                                      true
                                                  ? Colors.blue
                                                  : matchesController
                                                              .commentaryModel!
                                                              .commentaries![
                                                                  reversedIndex]
                                                              .six ==
                                                          true
                                                      ? Colors.deepPurpleAccent
                                                      : Colors.black),
                                      child: Text(
                                        matchesController
                                                    .commentaryModel!
                                                    .commentaries![
                                                        reversedIndex]
                                                    .event ==
                                                "wicket"
                                            ? "W"
                                            : matchesController
                                                        .commentaryModel!
                                                        .commentaries![index]
                                                        .four ==
                                                    true
                                                ? "4"
                                                : matchesController
                                                            .commentaryModel!
                                                            .commentaries![
                                                                reversedIndex]
                                                            .six ==
                                                        true
                                                    ? "6"
                                                    : matchesController
                                                        .commentaryModel!
                                                        .commentaries![
                                                            reversedIndex]
                                                        .score
                                                        .toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Dimensions.fontSizeDefault,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              : const SizedBox(),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(
                              matchesController
                                      .commentaryModel!
                                      .commentaries![reversedIndex]
                                      .commentary ??
                                  "",
                              style: TextStyle(
                                  color: matchesController
                                              .commentaryModel!
                                              .commentaries![reversedIndex]
                                              .event ==
                                          "overend"
                                      ? Colors.red
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.fontSizeLarge),
                            ),
                          ),
                        ],
                      ),
                    );
                  })
              : const SizedBox(),
        ],
      );
    });
  }
}

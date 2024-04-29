import 'package:cricupdate/data/model/body/winning_prediction_body.dart';
import 'package:cricupdate/data/model/response/matchh_page.dart';
import 'package:cricupdate/util/images.dart';
import 'package:cricupdate/view/base/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../controller/all_matches_controller.dart';
import '../../../controller/auth_controller.dart';
import '../../../util/dimensions.dart';

class LiveMatchScreen extends StatefulWidget {
  final Match match;

  const LiveMatchScreen({super.key, required this.match});

  @override
  State<LiveMatchScreen> createState() => _LiveMatchScreenState();
}

class _LiveMatchScreenState extends State<LiveMatchScreen> {
  @override
  void initState() {
    loadData();
    super.initState();
  }

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await loadData();
    _refreshController.refreshCompleted();
  }

  Future<void> loadData() async {
    await Get.find<AllMatchesController>()
        .getLiveMatchDetails(
            token: Get.find<AuthController>().entityToken!,
            matchId: widget.match.matchId!)
        .then((value) async {
      await Get.find<AllMatchesController>()
          .getScoreboardDetails(
              token: Get.find<AuthController>().entityToken!,
              matchId: widget.match.matchId!)
          .then((value) async {
        if (Get.find<AllMatchesController>().liveMatchDetailModel != null) {
          if (Get.find<AllMatchesController>().scoreboardDetailsModel != null) {
            if (Get.find<AllMatchesController>()
                    .liveMatchDetailModel!
                    .liveInningNumber ==
                1) {
              if (widget.match.teama!.teamId ==
                  Get.find<AllMatchesController>()
                      .liveMatchDetailModel!
                      .liveInning!
                      .battingTeamId) {
                await Get.find<AuthController>()
                    .getWinningPrediction(WinningPredictionBody(
                  teamARuns: Get.find<AllMatchesController>()
                              .liveMatchDetailModel!
                              .liveScore !=
                          null
                      ? Get.find<AllMatchesController>()
                          .liveMatchDetailModel!
                          .liveScore!
                          .runs
                      : 0,
                  teamACurrentRunrate: Get.find<AllMatchesController>()
                              .liveMatchDetailModel!
                              .liveScore !=
                          null
                      ? Get.find<AllMatchesController>()
                          .liveMatchDetailModel!
                          .liveScore!
                          .runrate
                      : 0.0,
                  teamAFallenWickets: Get.find<AllMatchesController>()
                              .liveMatchDetailModel!
                              .liveScore !=
                          null
                      ? Get.find<AllMatchesController>()
                          .liveMatchDetailModel!
                          .liveScore!
                          .wickets
                      : 0,
                  teamARequiredRunrate: 0.0,
                  teamBRuns: 0,
                  teamBCurrentRunrate: 0,
                  teamBFallenWickets: 0,
                  teamBRequiredRunrate: 0,
                ));
              } else {
                await Get.find<AuthController>()
                    .getWinningPrediction(WinningPredictionBody(
                  teamARuns: 0,
                  teamACurrentRunrate: 0.0,
                  teamAFallenWickets: 0,
                  teamBRequiredRunrate: 0.0,
                  teamBRuns: Get.find<AllMatchesController>()
                              .liveMatchDetailModel!
                              .liveScore !=
                          null
                      ? Get.find<AllMatchesController>()
                          .liveMatchDetailModel!
                          .liveScore!
                          .runs
                      : 0,
                  teamBCurrentRunrate: Get.find<AllMatchesController>()
                              .liveMatchDetailModel!
                              .liveScore !=
                          null
                      ? Get.find<AllMatchesController>()
                          .liveMatchDetailModel!
                          .liveScore!
                          .runrate
                      : 0.0,
                  teamBFallenWickets: Get.find<AllMatchesController>()
                              .liveMatchDetailModel!
                              .liveScore !=
                          null
                      ? Get.find<AllMatchesController>()
                          .liveMatchDetailModel!
                          .liveScore!
                          .wickets!
                      : 0,
                  teamARequiredRunrate: 0.0,
                ));
              }
            } else {
              if (widget.match.teama!.teamId ==
                  Get.find<AllMatchesController>()
                      .liveMatchDetailModel!
                      .liveInning!
                      .battingTeamId) {
                await Get.find<AuthController>()
                    .getWinningPrediction(WinningPredictionBody(
                  teamARuns: Get.find<AllMatchesController>()
                              .liveMatchDetailModel!
                              .liveScore !=
                          null
                      ? Get.find<AllMatchesController>()
                          .liveMatchDetailModel!
                          .liveScore!
                          .runs
                      : 0,
                  teamACurrentRunrate: Get.find<AllMatchesController>()
                              .liveMatchDetailModel!
                              .liveScore !=
                          null
                      ? Get.find<AllMatchesController>()
                          .liveMatchDetailModel!
                          .liveScore!
                          .runrate
                      : 0.0,
                  teamAFallenWickets: Get.find<AllMatchesController>()
                              .liveMatchDetailModel!
                              .liveScore !=
                          null
                      ? Get.find<AllMatchesController>()
                          .liveMatchDetailModel!
                          .liveScore!
                          .wickets
                      : 0,
                  teamARequiredRunrate: Get.find<AllMatchesController>()
                              .liveMatchDetailModel!
                              .liveScore !=
                          null
                      ? Get.find<AllMatchesController>()
                          .liveMatchDetailModel!
                          .liveScore!
                          .requiredRunrate
                      : 0.0,
                  teamBRuns: Get.find<AllMatchesController>()
                      .scoreboardDetailsModel!
                      .innings![0]
                      .equations!
                      .runs!,
                  teamBCurrentRunrate: double.parse(
                      Get.find<AllMatchesController>()
                          .scoreboardDetailsModel!
                          .innings![0]
                          .equations!
                          .runrate!),
                  teamBFallenWickets: Get.find<AllMatchesController>()
                      .scoreboardDetailsModel!
                      .innings![0]
                      .equations!
                      .wickets!,
                  teamBRequiredRunrate: 0.0,
                ));
              } else {
                await Get.find<AuthController>()
                    .getWinningPrediction(WinningPredictionBody(
                  teamBRuns: Get.find<AllMatchesController>()
                              .liveMatchDetailModel!
                              .liveScore !=
                          null
                      ? Get.find<AllMatchesController>()
                          .liveMatchDetailModel!
                          .liveScore!
                          .runs
                      : 0,
                  teamBCurrentRunrate: Get.find<AllMatchesController>()
                              .liveMatchDetailModel!
                              .liveScore !=
                          null
                      ? Get.find<AllMatchesController>()
                          .liveMatchDetailModel!
                          .liveScore!
                          .runrate
                      : 0.0,
                  teamBFallenWickets: Get.find<AllMatchesController>()
                              .liveMatchDetailModel!
                              .liveScore !=
                          null
                      ? Get.find<AllMatchesController>()
                          .liveMatchDetailModel!
                          .liveScore!
                          .wickets
                      : 0,
                  teamBRequiredRunrate: Get.find<AllMatchesController>()
                              .liveMatchDetailModel!
                              .liveScore !=
                          null
                      ? Get.find<AllMatchesController>()
                          .liveMatchDetailModel!
                          .liveScore!
                          .requiredRunrate
                      : 0.0,
                  teamARuns: Get.find<AllMatchesController>()
                      .scoreboardDetailsModel!
                      .innings![0]
                      .equations!
                      .runs!,
                  teamACurrentRunrate: double.parse(
                      Get.find<AllMatchesController>()
                          .scoreboardDetailsModel!
                          .innings![0]
                          .equations!
                          .runrate!),
                  teamAFallenWickets: Get.find<AllMatchesController>()
                      .scoreboardDetailsModel!
                      .innings![0]
                      .equations!
                      .wickets!,
                  teamARequiredRunrate: 0.0,
                ));
              }
            }
          }
        }
      });
    });
  }

  void _onLoading() async {
    await loadMoreData();
    _refreshController.loadComplete();
  }

  Future<void> loadMoreData() async {}

  @override
  Widget build(BuildContext context) {
    return widget.match.status == 1
        ? Center(
            child: Text(
              "Match has not started yet",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: Dimensions.fontSizeLarge,
                  fontWeight: FontWeight.bold),
            ),
          )
        : SmartRefresher(
            enablePullDown: true,
            enablePullUp: false,
            header: const WaterDropHeader(),
            controller: _refreshController,
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            child: GetBuilder<AuthController>(builder: (authController) {
              return GetBuilder<AllMatchesController>(
                  builder: (matchesController) {
                if (matchesController.isLoading) {
                  return const Loader();
                }
                return Padding(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.match.status == 2
                          ? Text(
                              widget.match.result ?? "",
                              style: TextStyle(
                                  color: Get.theme.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.fontSizeLarge),
                            )
                          : const SizedBox(),
                      widget.match.status == 3
                          ? Text(
                              widget.match.statusNote ?? "",
                              style: TextStyle(
                                  color: Get.theme.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.fontSizeDefault),
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: widget.match.status == 2
                            ? Dimensions.paddingSizeSmall
                            : 0,
                      ),
                      widget.match.status == 2
                          ? Divider(
                              color: Colors.grey[300],
                              thickness: 1,
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: widget.match.status == 2
                            ? Dimensions.paddingSizeSmall
                            : 0,
                      ),
                      widget.match.status == 2
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.match.teama != null
                                        ? widget.match.teama!.name ?? ""
                                        : "",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: Dimensions.fontSizeLarge),
                                  ),
                                ),
                                Text(
                                  widget.match.teama != null
                                      ? widget.match.teama!.scoresFull ?? ""
                                      : "",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Dimensions.fontSizeLarge),
                                ),
                              ],
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: widget.match.status == 2
                            ? Dimensions.paddingSizeDefault
                            : 0,
                      ),
                      widget.match.status == 2
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.match.teamb != null
                                        ? widget.match.teamb!.name ?? ""
                                        : "",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: Dimensions.fontSizeLarge),
                                  ),
                                ),
                                Text(
                                  widget.match.teamb != null
                                      ? widget.match.teamb!.scoresFull ?? ""
                                      : "",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Dimensions.fontSizeLarge),
                                ),
                              ],
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: widget.match.status == 2
                            ? Dimensions.paddingSizeSmall
                            : 0,
                      ),
                      widget.match.status == 2
                          ? Divider(
                              color: Colors.grey[300],
                              thickness: 1,
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: widget.match.status == 2
                            ? Dimensions.paddingSizeSmall
                            : 0,
                      ),
                      widget.match.status == 2
                          ? matchesController.scoreboardDetailsModel != null
                              ? Text(
                                  "Player of the match",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: Dimensions.fontSizeLarge,
                                      fontWeight: FontWeight.bold),
                                )
                              : const SizedBox()
                          : const SizedBox(),
                      const SizedBox(
                        height: Dimensions.paddingSizeDefault,
                      ),
                      widget.match.status == 2 &&
                              matchesController.scoreboardDetailsModel != null
                          ? Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.network(
                                    matchesController.scoreboardDetailsModel!
                                                .manOfTheMatch !=
                                            null
                                        ? matchesController
                                                .scoreboardDetailsModel!
                                                .manOfTheMatch!
                                                .thumbUrl ??
                                            ""
                                        : "",
                                    errorBuilder: (BuildContext context,
                                        Object object, StackTrace? tree) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.asset(
                                          Images.appIcon,
                                          height: 60,
                                          width: 60,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    },
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: Dimensions.paddingSizeDefault,
                                ),
                                Text(
                                  matchesController.scoreboardDetailsModel!
                                              .manOfTheMatch !=
                                          null
                                      ? matchesController
                                              .scoreboardDetailsModel!
                                              .manOfTheMatch!
                                              .name ??
                                          ""
                                      : "",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: Dimensions.fontSizeDefault,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          : const SizedBox(),
                      widget.match.status == 3 &&
                              matchesController.liveMatchDetailModel != null
                          ? Container(
                              padding: const EdgeInsets.all(2),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              matchesController
                                                          .liveMatchDetailModel !=
                                                      null
                                                  ? matchesController
                                                      .liveMatchDetailModel!
                                                      .teamBatting
                                                      .toString()
                                                  : "",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      Dimensions.fontSizeLarge),
                                            ),
                                            Text(
                                              matchesController
                                                          .liveMatchDetailModel !=
                                                      null
                                                  ? matchesController
                                                              .liveMatchDetailModel!
                                                              .liveScore !=
                                                          null
                                                      ? "${matchesController.liveMatchDetailModel!.liveScore!.runs}/${matchesController.liveMatchDetailModel!.liveScore!.wickets}"
                                                      : ""
                                                  : "",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      Dimensions.fontSizeLarge),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Overs",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    Dimensions.fontSizeLarge),
                                          ),
                                          Text(
                                            matchesController
                                                        .liveMatchDetailModel !=
                                                    null
                                                ? matchesController
                                                            .liveMatchDetailModel!
                                                            .liveScore !=
                                                        null
                                                    ? "${matchesController.liveMatchDetailModel!.liveScore!.overs}"
                                                    : ""
                                                : "",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    Dimensions.fontSizeLarge),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: matchesController
                                                    .liveMatchDetailModel !=
                                                null
                                            ? matchesController
                                                        .liveMatchDetailModel!
                                                        .liveInningNumber ==
                                                    2
                                                ? 16
                                                : 0
                                            : 0,
                                      ),
                                      matchesController.liveMatchDetailModel !=
                                              null
                                          ? matchesController
                                                      .liveMatchDetailModel!
                                                      .liveInningNumber ==
                                                  2
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Target",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: Dimensions
                                                              .fontSizeLarge),
                                                    ),
                                                    Text(
                                                      matchesController
                                                                  .liveMatchDetailModel !=
                                                              null
                                                          ? matchesController
                                                                      .liveMatchDetailModel!
                                                                      .liveScore !=
                                                                  null
                                                              ? "${matchesController.liveMatchDetailModel!.liveScore!.target}"
                                                              : ""
                                                          : "",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: Dimensions
                                                              .fontSizeLarge),
                                                    ),
                                                  ],
                                                )
                                              : SizedBox()
                                          : SizedBox(),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: Dimensions.paddingSizeDefault,
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "CRR",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                Dimensions.fontSizeDefault),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        matchesController
                                                    .liveMatchDetailModel !=
                                                null
                                            ? matchesController
                                                        .liveMatchDetailModel!
                                                        .liveScore !=
                                                    null
                                                ? "${matchesController.liveMatchDetailModel!.liveScore!.runrate}"
                                                : ""
                                            : "",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: Dimensions.fontSizeLarge),
                                      ),
                                      Spacer(),
                                      matchesController.liveMatchDetailModel !=
                                              null
                                          ? matchesController
                                                      .liveMatchDetailModel!
                                                      .liveInningNumber ==
                                                  2
                                              ? Text(
                                                  "REQ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: Dimensions
                                                          .fontSizeDefault),
                                                )
                                              : SizedBox()
                                          : SizedBox(),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      matchesController.liveMatchDetailModel !=
                                              null
                                          ? matchesController
                                                      .liveMatchDetailModel!
                                                      .liveInningNumber ==
                                                  2
                                              ? Text(
                                                  matchesController
                                                              .liveMatchDetailModel !=
                                                          null
                                                      ? matchesController
                                                                  .liveMatchDetailModel!
                                                                  .liveScore !=
                                                              null
                                                          ? "${matchesController.liveMatchDetailModel!.liveScore!.requiredRunrate}"
                                                          : ""
                                                      : "",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: Dimensions
                                                          .fontSizeLarge),
                                                )
                                              : SizedBox()
                                          : SizedBox(),
                                    ],
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    height: Dimensions.paddingSizeDefault,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Batter",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  Dimensions.fontSizeDefault),
                                        ),
                                      ),
                                      Text(
                                        "R",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                Dimensions.fontSizeDefault),
                                      ),
                                      const SizedBox(
                                        width: 18,
                                      ),
                                      Text(
                                        "B",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                Dimensions.fontSizeDefault),
                                      ),
                                      const SizedBox(
                                        width: 14,
                                      ),
                                      Text(
                                        "4's",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                Dimensions.fontSizeDefault),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        "6's",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                Dimensions.fontSizeDefault),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: Dimensions.paddingSizeDefault,
                                  ),
                                  matchesController.liveMatchDetailModel != null
                                      ? SizedBox(
                                          height: 50,
                                          child: ListView.builder(
                                              physics: const ScrollPhysics(),
                                              itemCount: matchesController
                                                  .liveMatchDetailModel!
                                                  .batsmen!
                                                  .length,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  margin: const EdgeInsets.only(
                                                      bottom: Dimensions
                                                          .paddingSizeExtraSmall),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          matchesController
                                                                  .liveMatchDetailModel!
                                                                  .batsmen![
                                                                      index]
                                                                  .name ??
                                                              "",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.blue,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: Dimensions
                                                                  .fontSizeDefault),
                                                        ),
                                                      ),
                                                      Text(
                                                        matchesController
                                                            .liveMatchDetailModel!
                                                            .batsmen![index]
                                                            .runs
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: Dimensions
                                                                .fontSizeDefault),
                                                      ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      Text(
                                                        matchesController
                                                            .liveMatchDetailModel!
                                                            .batsmen![index]
                                                            .ballsFaced
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: Dimensions
                                                                .fontSizeDefault),
                                                      ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      Text(
                                                        matchesController
                                                            .liveMatchDetailModel!
                                                            .batsmen![index]
                                                            .fours
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: Dimensions
                                                                .fontSizeDefault),
                                                      ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      Text(
                                                        matchesController
                                                            .liveMatchDetailModel!
                                                            .batsmen![index]
                                                            .sixes
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: Dimensions
                                                                .fontSizeDefault),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }),
                                        )
                                      : const SizedBox(),
                                  const SizedBox(
                                    height: Dimensions.paddingSizeDefault,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Bowler",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  Dimensions.fontSizeDefault),
                                        ),
                                      ),
                                      Text(
                                        "O",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                Dimensions.fontSizeDefault),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "M",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                Dimensions.fontSizeDefault),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "R",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                Dimensions.fontSizeDefault),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "W",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                Dimensions.fontSizeDefault),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: Dimensions.paddingSizeDefault,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          matchesController
                                                  .liveMatchDetailModel!
                                                  .bowlers![0]
                                                  .name ??
                                              "",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  Dimensions.fontSizeDefault),
                                        ),
                                      ),
                                      Text(
                                        matchesController.liveMatchDetailModel!
                                            .bowlers![0].overs
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                Dimensions.fontSizeDefault),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        matchesController.liveMatchDetailModel!
                                            .bowlers![0].maidens
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                Dimensions.fontSizeDefault),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        matchesController.liveMatchDetailModel!
                                            .bowlers![0].runsConceded
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                Dimensions.fontSizeDefault),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        matchesController.liveMatchDetailModel!
                                            .bowlers![0].wickets
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                Dimensions.fontSizeDefault),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: Dimensions.paddingSizeSmall,
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox(),
                      Divider(
                        color: Colors.grey[300],
                        thickness: 1,
                      ),
                      authController.winningPredictionModel != null
                          ? widget.match.status == 3
                              ? Container(
                                  padding: EdgeInsets.all(
                                      Dimensions.paddingSizeDefault),
                                  decoration: BoxDecoration(
                                      color: Get.theme.primaryColor,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radiusDefault)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Winning Predictions",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  Dimensions.fontSizeLarge),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: Column(
                                          children: [
                                            Text(
                                              widget.match.teama!.shortName ??
                                                  "",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      Dimensions.fontSizeLarge),
                                            ),
                                            Text(
                                              authController
                                                  .winningPredictionModel!
                                                  .teamAWinningProbability!
                                                  .round()
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      Dimensions.fontSizeLarge),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: Dimensions.paddingSizeDefault,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: Column(
                                          children: [
                                            Text(
                                              widget.match.teamb!.shortName ??
                                                  "",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      Dimensions.fontSizeLarge),
                                            ),
                                            Text(
                                              authController
                                                  .winningPredictionModel!
                                                  .teamBWinningProbability!
                                                  .round()
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      Dimensions.fontSizeLarge),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : SizedBox()
                          : SizedBox(),
                      Divider(
                        color: Colors.grey[300],
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: Dimensions.paddingSizeDefault,
                      ),
                      Text(
                        "Highlight",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.fontSizeLarge),
                      ),
                      const SizedBox(
                        height: Dimensions.paddingSizeDefault,
                      ),
                      matchesController.liveMatchDetailModel != null
                          ? matchesController
                                      .liveMatchDetailModel!.commentaries !=
                                  null
                              ? Expanded(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: matchesController
                                          .liveMatchDetailModel!
                                          .commentaries!
                                          .length,
                                      physics: const ScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        int reversedIndex = matchesController
                                                .liveMatchDetailModel!
                                                .commentaries!
                                                .length -
                                            1 -
                                            index;
                                        return Container(
                                          margin: const EdgeInsets.only(
                                              bottom: Dimensions
                                                  .paddingSizeDefault),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              matchesController
                                                          .liveMatchDetailModel!
                                                          .commentaries![
                                                              reversedIndex]
                                                          .event !=
                                                      "overend"
                                                  ? Column(
                                                      children: [
                                                        Text(
                                                          "${matchesController.liveMatchDetailModel!.commentaries![reversedIndex].over}.${matchesController.liveMatchDetailModel!.commentaries![reversedIndex].ball}",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: Dimensions
                                                                  .fontSizeLarge,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Container(
                                                          padding: const EdgeInsets
                                                              .all(Dimensions
                                                                  .paddingSizeSmall),
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape.circle,
                                                              color: matchesController.liveMatchDetailModel!.commentaries![reversedIndex].event == "wicket"
                                                                  ? Colors.red
                                                                  : matchesController.liveMatchDetailModel!.commentaries![reversedIndex].four == true
                                                                      ? Colors.blue
                                                                      : matchesController.liveMatchDetailModel!.commentaries![reversedIndex].six == true
                                                                          ? Colors.deepPurpleAccent
                                                                          : Colors.black),
                                                          child: Text(
                                                            matchesController
                                                                        .liveMatchDetailModel!
                                                                        .commentaries![
                                                                            reversedIndex]
                                                                        .event ==
                                                                    "wicket"
                                                                ? "W"
                                                                : matchesController
                                                                            .liveMatchDetailModel!
                                                                            .commentaries![
                                                                                reversedIndex]
                                                                            .four ==
                                                                        true
                                                                    ? "4"
                                                                    : matchesController.liveMatchDetailModel!.commentaries![reversedIndex].six ==
                                                                            true
                                                                        ? "6"
                                                                        : matchesController
                                                                            .liveMatchDetailModel!
                                                                            .commentaries![reversedIndex]
                                                                            .score
                                                                            .toString(),
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: Dimensions
                                                                  .fontSizeDefault,
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
                                                          .liveMatchDetailModel!
                                                          .commentaries![
                                                              reversedIndex]
                                                          .commentary ??
                                                      "",
                                                  style: TextStyle(
                                                      color: matchesController
                                                                  .liveMatchDetailModel!
                                                                  .commentaries![
                                                                      reversedIndex]
                                                                  .event ==
                                                              "overend"
                                                          ? Colors.red
                                                          : Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: Dimensions
                                                          .fontSizeLarge),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                )
                              : const SizedBox()
                          : SizedBox(),
                    ],
                  ),
                );
              });
            }));
  }
}

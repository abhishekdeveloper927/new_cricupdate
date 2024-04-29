import 'package:cricupdate/data/model/response/matchh_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../controller/all_matches_controller.dart';
import '../../../controller/auth_controller.dart';
import '../../../util/dimensions.dart';
import '../../base/loader.dart';

class ScoreboardScreen extends StatefulWidget {
  final Match matchModel;

  const ScoreboardScreen({super.key, required this.matchModel});

  @override
  State<ScoreboardScreen> createState() => _ScoreboardScreenState();
}

class _ScoreboardScreenState extends State<ScoreboardScreen> {
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
    await Get.find<AllMatchesController>().getScoreboardDetails(
        token: Get.find<AuthController>().entityToken!,
        matchId: widget.matchModel.matchId!);
  }

  void _onLoading() async {
    await loadMoreData();
    _refreshController.loadComplete();
  }

  Future<void> loadMoreData() async {}

  @override
  Widget build(BuildContext context) {
    return widget.matchModel.status == 1
        ? Center(
            child: Text(
              "Match has not started yet",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: Dimensions.fontSizeLarge,
                  fontWeight: FontWeight.bold),
            ),
          )
        : GetBuilder<AllMatchesController>(builder: (matchesController) {
            if (matchesController.isLoading) {
              return const Loader();
            }
            if (matchesController.scoreboardDetailsModel == null) {
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
            return SmartRefresher(
                enablePullDown: true,
                enablePullUp: false,
                header: const WaterDropHeader(),
                controller: _refreshController,
                onRefresh: _onRefresh,
                onLoading: _onLoading,
                child: ListView(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                  children: [
                    widget.matchModel.status == 2
                        ? Text(
                            widget.matchModel.result ?? "",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.fontSizeLarge),
                          )
                        : const SizedBox(),
                    widget.matchModel.status != 2
                        ? widget.matchModel.toss != null
                            ? Text(
                                widget.matchModel.toss!.text ?? "",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              )
                            : const SizedBox()
                        : SizedBox(),
                    const SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                    matchesController.scoreboardDetailsModel!.innings != null
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: matchesController
                                .scoreboardDetailsModel!.innings!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(
                                    bottom: Dimensions.paddingSizeDefault),
                                decoration: BoxDecoration(
                                    color: Get.theme.cardColor,
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radiusDefault)),
                                child: ExpansionTile(
                                  iconColor: Colors.black,
                                  collapsedIconColor: Colors.black,
                                  leading: Text(
                                    matchesController.scoreboardDetailsModel!
                                            .innings![index].shortName ??
                                        "",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: Dimensions.fontSizeDefault),
                                  ),
                                  title: Text(
                                    matchesController.scoreboardDetailsModel!
                                            .innings![index].scoresFull ??
                                        "",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: Dimensions.fontSizeDefault),
                                  ),
                                  children: <Widget>[
                                    Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(
                                              Dimensions.paddingSizeDefault),
                                          decoration: BoxDecoration(
                                              color: Colors.grey[100]),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Batter",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: Dimensions
                                                        .fontSizeDefault),
                                              ),
                                              Spacer(),
                                              SizedBox(
                                                width: 30,
                                                child: Center(
                                                  child: Text(
                                                    "R",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: Dimensions
                                                            .fontSizeDefault),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Center(
                                                  child: Text(
                                                    "B",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: Dimensions
                                                            .fontSizeDefault),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Center(
                                                  child: Text(
                                                    "4's",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: Dimensions
                                                            .fontSizeDefault),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: Center(
                                                  child: Text(
                                                    "6's",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: Dimensions
                                                            .fontSizeDefault),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: Dimensions.paddingSizeDefault,
                                        ),
                                        matchesController
                                                    .scoreboardDetailsModel!
                                                    .innings![index]
                                                    .batsmen !=
                                                null
                                            ? ListView.builder(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: Dimensions
                                                        .paddingSizeDefault),
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount: matchesController
                                                    .scoreboardDetailsModel!
                                                    .innings![index]
                                                    .batsmen!
                                                    .length,
                                                itemBuilder:
                                                    (context, battingIndex) {
                                                  return Container(
                                                    margin: const EdgeInsets
                                                        .only(
                                                        bottom: Dimensions
                                                            .paddingSizeDefault),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            matchesController
                                                                    .scoreboardDetailsModel!
                                                                    .innings![
                                                                        index]
                                                                    .batsmen![
                                                                        battingIndex]
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
                                                        SizedBox(
                                                          width: 30,
                                                          child: Center(
                                                            child: Text(
                                                              matchesController
                                                                  .scoreboardDetailsModel!
                                                                  .innings![
                                                                      index]
                                                                  .batsmen![
                                                                      battingIndex]
                                                                  .runs
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      Dimensions
                                                                          .fontSizeDefault),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        SizedBox(
                                                          width: 30,
                                                          child: Center(
                                                            child: Text(
                                                              matchesController
                                                                  .scoreboardDetailsModel!
                                                                  .innings![
                                                                      index]
                                                                  .batsmen![
                                                                      battingIndex]
                                                                  .ballsFaced
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      Dimensions
                                                                          .fontSizeDefault),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        SizedBox(
                                                          width: 30,
                                                          child: Center(
                                                            child: Text(
                                                              matchesController
                                                                  .scoreboardDetailsModel!
                                                                  .innings![
                                                                      index]
                                                                  .batsmen![
                                                                      battingIndex]
                                                                  .fours
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      Dimensions
                                                                          .fontSizeDefault),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        SizedBox(
                                                          width: 30,
                                                          child: Center(
                                                            child: Text(
                                                              matchesController
                                                                  .scoreboardDetailsModel!
                                                                  .innings![
                                                                      index]
                                                                  .batsmen![
                                                                      battingIndex]
                                                                  .sixes
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      Dimensions
                                                                          .fontSizeDefault),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                })
                                            : const SizedBox(),
                                        const SizedBox(
                                          height: Dimensions.paddingSizeSmall,
                                        ),
                                        Divider(
                                          color: Colors.grey[300],
                                        ),
                                        const SizedBox(
                                          height: Dimensions.paddingSizeSmall,
                                        ),
                                        matchesController
                                                    .scoreboardDetailsModel!
                                                    .innings![index]
                                                    .extraRuns !=
                                                null
                                            ? Padding(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: Dimensions
                                                        .paddingSizeDefault),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        "Extras",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: Dimensions
                                                                .fontSizeLarge,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    Text(
                                                      matchesController
                                                          .scoreboardDetailsModel!
                                                          .innings![index]
                                                          .extraRuns!
                                                          .total
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: Dimensions
                                                              .fontSizeDefault,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      width: 6,
                                                    ),
                                                    Text(
                                                      "b ${matchesController.scoreboardDetailsModel!.innings![index].extraRuns!.byes}, ",
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: Dimensions
                                                            .fontSizeSmall,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 6,
                                                    ),
                                                    Text(
                                                      "lb ${matchesController.scoreboardDetailsModel!.innings![index].extraRuns!.legbyes}, ",
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: Dimensions
                                                            .fontSizeSmall,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 6,
                                                    ),
                                                    Text(
                                                      "w ${matchesController.scoreboardDetailsModel!.innings![index].extraRuns!.wides}, ",
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: Dimensions
                                                            .fontSizeSmall,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 6,
                                                    ),
                                                    Text(
                                                      "nb ${matchesController.scoreboardDetailsModel!.innings![index].extraRuns!.noballs}, ",
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: Dimensions
                                                            .fontSizeSmall,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 6,
                                                    ),
                                                    Text(
                                                      "p ${matchesController.scoreboardDetailsModel!.innings![index].extraRuns!.penalty}",
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: Dimensions
                                                            .fontSizeSmall,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : SizedBox(),
                                        const SizedBox(
                                          height: Dimensions.paddingSizeSmall,
                                        ),
                                        Divider(
                                          color: Colors.grey[300],
                                        ),
                                        const SizedBox(
                                          height: Dimensions.paddingSizeSmall,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: Dimensions
                                                          .paddingSizeDefault),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Did not bat",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: Dimensions
                                                            .fontSizeLarge,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height:
                                                  Dimensions.paddingSizeSmall,
                                            ),
                                            matchesController
                                                        .scoreboardDetailsModel!
                                                        .innings![index]
                                                        .didNotBat !=
                                                    null
                                                ? Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: Dimensions
                                                            .paddingSizeDefault),
                                                    child: Wrap(
                                                      spacing: 8,
                                                      crossAxisAlignment:
                                                          WrapCrossAlignment
                                                              .start,
                                                      alignment:
                                                          WrapAlignment.start,
                                                      runAlignment:
                                                          WrapAlignment.start,
                                                      children: matchesController
                                                          .scoreboardDetailsModel!
                                                          .innings![index]
                                                          .didNotBat!
                                                          .map((e) {
                                                        return Text(
                                                          "${e.name ?? ""} , ",
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: Dimensions
                                                                .fontSizeDefault,
                                                          ),
                                                        );
                                                      }).toList(),
                                                    ),
                                                  )
                                                : SizedBox(),
                                            const SizedBox(
                                              height:
                                                  Dimensions.paddingSizeDefault,
                                            ),
                                          ],
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(
                                              Dimensions.paddingSizeDefault),
                                          decoration: BoxDecoration(
                                              color: Colors.grey[100]),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  "Bowler",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: Dimensions
                                                          .fontSizeDefault),
                                                ),
                                              ),
                                              Text(
                                                "O",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: Dimensions
                                                        .fontSizeDefault),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                "M",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: Dimensions
                                                        .fontSizeDefault),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                "R",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: Dimensions
                                                        .fontSizeDefault),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                "W",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: Dimensions
                                                        .fontSizeDefault),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: Dimensions.paddingSizeDefault,
                                        ),
                                        matchesController
                                                    .scoreboardDetailsModel!
                                                    .innings![index]
                                                    .bowlers !=
                                                null
                                            ? ListView.builder(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: Dimensions
                                                        .paddingSizeDefault),
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount: matchesController
                                                    .scoreboardDetailsModel!
                                                    .innings![index]
                                                    .bowlers!
                                                    .length,
                                                itemBuilder:
                                                    (context, bowlingIndex) {
                                                  return Container(
                                                    margin: const EdgeInsets
                                                        .only(
                                                        bottom: Dimensions
                                                            .paddingSizeDefault),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            matchesController
                                                                    .scoreboardDetailsModel!
                                                                    .innings![
                                                                        index]
                                                                    .bowlers![
                                                                        bowlingIndex]
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
                                                              .scoreboardDetailsModel!
                                                              .innings![index]
                                                              .bowlers![
                                                                  bowlingIndex]
                                                              .overs
                                                              .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: Dimensions
                                                                  .fontSizeDefault),
                                                        ),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        Text(
                                                          matchesController
                                                              .scoreboardDetailsModel!
                                                              .innings![index]
                                                              .bowlers![
                                                                  bowlingIndex]
                                                              .maidens
                                                              .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: Dimensions
                                                                  .fontSizeDefault),
                                                        ),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        Text(
                                                          matchesController
                                                              .scoreboardDetailsModel!
                                                              .innings![index]
                                                              .bowlers![
                                                                  bowlingIndex]
                                                              .runsConceded
                                                              .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: Dimensions
                                                                  .fontSizeDefault),
                                                        ),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        Text(
                                                          matchesController
                                                              .scoreboardDetailsModel!
                                                              .innings![index]
                                                              .bowlers![
                                                                  bowlingIndex]
                                                              .wickets
                                                              .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: Dimensions
                                                                  .fontSizeDefault),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                })
                                            : const SizedBox(),
                                        const SizedBox(
                                          height: Dimensions.paddingSizeDefault,
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(
                                              Dimensions.paddingSizeDefault),
                                          decoration: BoxDecoration(
                                              color: Colors.grey[100]),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  "Fall of Wickets",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: Dimensions
                                                          .fontSizeDefault),
                                                ),
                                              ),
                                              Text(
                                                "Score",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: Dimensions
                                                        .fontSizeDefault),
                                              ),
                                              const SizedBox(
                                                width: 30,
                                              ),
                                              Text(
                                                "Over",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: Dimensions
                                                        .fontSizeDefault),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: Dimensions.paddingSizeDefault,
                                        ),
                                        matchesController
                                                    .scoreboardDetailsModel!
                                                    .innings![index]
                                                    .fows !=
                                                null
                                            ? ListView.builder(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: Dimensions
                                                        .paddingSizeDefault),
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount: matchesController
                                                    .scoreboardDetailsModel!
                                                    .innings![index]
                                                    .fows!
                                                    .length,
                                                itemBuilder:
                                                    (context, wicketIndex) {
                                                  return Container(
                                                    margin: const EdgeInsets
                                                        .only(
                                                        bottom: Dimensions
                                                            .paddingSizeDefault),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            matchesController
                                                                    .scoreboardDetailsModel!
                                                                    .innings![
                                                                        index]
                                                                    .fows![
                                                                        wicketIndex]
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
                                                        SizedBox(
                                                          width: 60,
                                                          child: Center(
                                                            child: Text(
                                                              "${matchesController.scoreboardDetailsModel!.innings![index].fows![wicketIndex].scoreAtDismissal}-${matchesController.scoreboardDetailsModel!.innings![index].fows![wicketIndex].number}",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      Dimensions
                                                                          .fontSizeDefault),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        SizedBox(
                                                          width: 60,
                                                          child: Center(
                                                            child: Text(
                                                              matchesController
                                                                  .scoreboardDetailsModel!
                                                                  .innings![
                                                                      index]
                                                                  .fows![
                                                                      wicketIndex]
                                                                  .oversAtDismissal
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      Dimensions
                                                                          .fontSizeDefault),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                })
                                            : const SizedBox(),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            })
                        : SizedBox(),
                    const SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                  ],
                ));
          });
  }
}

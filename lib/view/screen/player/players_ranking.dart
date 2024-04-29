import 'package:cricupdate/view/base/button.dart';
import 'package:cricupdate/view/base/loader.dart';
import 'package:cricupdate/view/screen/player/player_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/all_matches_controller.dart';
import '../../../controller/auth_controller.dart';
import '../../../util/dimensions.dart';

class PlayersRankingScreen extends StatefulWidget {
  const PlayersRankingScreen({super.key});

  @override
  State<PlayersRankingScreen> createState() => _PlayersRankingScreenState();
}

class _PlayersRankingScreenState extends State<PlayersRankingScreen> {
  @override
  void initState() {
    Get.find<AllMatchesController>()
        .getRanking(token: Get.find<AuthController>().entityToken!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Get.theme.primaryColor,
          title: Text(
            "Player Ranking",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.fontSizeLarge),
          ),
          bottom: TabBar(
            labelColor: Colors.white,
            indicatorColor: Theme.of(context).primaryColor,
            tabs: const [
              Tab(text: "TEST"),
              Tab(text: "ODI"),
              Tab(text: "T20"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GetBuilder<AllMatchesController>(builder: (matchesController) {
              if (matchesController.isLoading) {
                return const Loader();
              }
              if (matchesController.rankingModel == null) {
                return Center(
                  child: Text(
                    "No data found",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimensions.fontSizeLarge,
                        fontWeight: FontWeight.bold),
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Button(
                              textColor: matchesController.selectedRankType == 1
                                  ? Colors.white
                                  : Colors.black,
                              bgColor: matchesController.selectedRankType == 1
                                  ? Get.theme.primaryColor
                                  : Colors.grey[300],
                              title: "Batting",
                              onTap: () {
                                matchesController.updateRankType(1);
                                setState(() {});
                              }),
                        ),
                        const SizedBox(
                          width: Dimensions.paddingSizeDefault,
                        ),
                        Expanded(
                          child: Button(
                              textColor: matchesController.selectedRankType == 2
                                  ? Colors.white
                                  : Colors.black,
                              bgColor: matchesController.selectedRankType == 2
                                  ? Get.theme.primaryColor
                                  : Colors.grey[300],
                              title: "Bowling",
                              onTap: () {
                                matchesController.updateRankType(2);
                                setState(() {});
                              }),
                        ),
                        const SizedBox(
                          width: Dimensions.paddingSizeDefault,
                        ),
                        Expanded(
                          child: Button(
                              textColor: matchesController.selectedRankType == 3
                                  ? Colors.white
                                  : Colors.black,
                              bgColor: matchesController.selectedRankType == 3
                                  ? Get.theme.primaryColor
                                  : Colors.grey[300],
                              title: "All Rounder",
                              onTap: () {
                                matchesController.updateRankType(3);
                                setState(() {});
                              }),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                    matchesController.selectedRankType == 1
                        ? Expanded(
                            child: ListView.builder(
                                itemCount: matchesController.rankingModel!
                                            .ranks!.batsmen!.tests!.length >
                                        15
                                    ? 15
                                    : matchesController.rankingModel!.ranks!
                                        .batsmen!.tests!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.to(() => PlayerDetailsScreen(
                                          id: int.parse(matchesController
                                              .rankingModel!
                                              .ranks!
                                              .batsmen!
                                              .tests![index]
                                              .pid!)));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 16),
                                      decoration: BoxDecoration(
                                        color: Get.theme.cardColor,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radiusDefault),
                                      ),
                                      child: ListTile(
                                        leading: Text(
                                          (index + 1).toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  Dimensions.fontSizeDefault,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${matchesController.rankingModel!.ranks!.batsmen!.tests![index].player ?? ""} ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: Dimensions
                                                      .fontSizeDefault,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              matchesController
                                                  .rankingModel!
                                                  .ranks!
                                                  .batsmen!
                                                  .tests![index]
                                                  .team!,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize:
                                                    Dimensions.fontSizeDefault,
                                              ),
                                            ),
                                          ],
                                        ),
                                        trailing: Text(
                                          "${matchesController.rankingModel!.ranks!.batsmen!.tests![index].rating ?? ""} ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  Dimensions.fontSizeDefault,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        : const SizedBox(),
                    matchesController.selectedRankType == 2
                        ? Expanded(
                            child: ListView.builder(
                                itemCount: matchesController.rankingModel!
                                            .ranks!.bowlers!.tests!.length >
                                        15
                                    ? 15
                                    : matchesController.rankingModel!.ranks!
                                        .bowlers!.tests!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.to(() => PlayerDetailsScreen(
                                          id: int.parse(matchesController
                                              .rankingModel!
                                              .ranks!
                                              .bowlers!
                                              .tests![index]
                                              .pid!)));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 16),
                                      decoration: BoxDecoration(
                                        color: Get.theme.cardColor,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radiusDefault),
                                      ),
                                      child: ListTile(
                                        leading: Text(
                                          (index + 1).toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  Dimensions.fontSizeDefault,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${matchesController.rankingModel!.ranks!.bowlers!.tests![index].player ?? ""} ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: Dimensions
                                                      .fontSizeDefault,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              matchesController
                                                  .rankingModel!
                                                  .ranks!
                                                  .bowlers!
                                                  .tests![index]
                                                  .team!,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize:
                                                    Dimensions.fontSizeDefault,
                                              ),
                                            ),
                                          ],
                                        ),
                                        trailing: Text(
                                          "${matchesController.rankingModel!.ranks!.bowlers!.tests![index].rating ?? ""} ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  Dimensions.fontSizeDefault,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        : const SizedBox(),
                    matchesController.selectedRankType == 3
                        ? Expanded(
                            child: ListView.builder(
                                itemCount: matchesController.rankingModel!
                                            .ranks!.allRounders!.tests!.length >
                                        15
                                    ? 15
                                    : matchesController.rankingModel!.ranks!
                                        .allRounders!.tests!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.to(() => PlayerDetailsScreen(
                                          id: int.parse(matchesController
                                              .rankingModel!
                                              .ranks!
                                              .allRounders!
                                              .tests![index]
                                              .pid!)));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 16),
                                      decoration: BoxDecoration(
                                        color: Get.theme.cardColor,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radiusDefault),
                                      ),
                                      child: ListTile(
                                        leading: Text(
                                          (index + 1).toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  Dimensions.fontSizeDefault,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${matchesController.rankingModel!.ranks!.allRounders!.tests![index].player ?? ""} ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: Dimensions
                                                      .fontSizeDefault,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              matchesController
                                                  .rankingModel!
                                                  .ranks!
                                                  .allRounders!
                                                  .tests![index]
                                                  .team!,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize:
                                                    Dimensions.fontSizeDefault,
                                              ),
                                            ),
                                          ],
                                        ),
                                        trailing: Text(
                                          "${matchesController.rankingModel!.ranks!.allRounders!.tests![index].rating ?? ""} ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  Dimensions.fontSizeDefault,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        : const SizedBox(),
                  ],
                ),
              );
            }),
            GetBuilder<AllMatchesController>(builder: (matchesController) {
              if (matchesController.isLoading) {
                return const Loader();
              }
              if (matchesController.rankingModel == null) {
                return Center(
                  child: Text(
                    "No data found",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimensions.fontSizeLarge,
                        fontWeight: FontWeight.bold),
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Button(
                              textColor: matchesController.selectedRankType == 1
                                  ? Colors.white
                                  : Colors.black,
                              bgColor: matchesController.selectedRankType == 1
                                  ? Get.theme.primaryColor
                                  : Colors.grey[300],
                              title: "Batting",
                              onTap: () {
                                matchesController.updateRankType(1);
                                setState(() {});
                              }),
                        ),
                        const SizedBox(
                          width: Dimensions.paddingSizeDefault,
                        ),
                        Expanded(
                          child: Button(
                              textColor: matchesController.selectedRankType == 2
                                  ? Colors.white
                                  : Colors.black,
                              bgColor: matchesController.selectedRankType == 2
                                  ? Get.theme.primaryColor
                                  : Colors.grey[300],
                              title: "Bowling",
                              onTap: () {
                                matchesController.updateRankType(2);
                                setState(() {});
                              }),
                        ),
                        const SizedBox(
                          width: Dimensions.paddingSizeDefault,
                        ),
                        Expanded(
                          child: Button(
                              textColor: matchesController.selectedRankType == 3
                                  ? Colors.white
                                  : Colors.black,
                              bgColor: matchesController.selectedRankType == 3
                                  ? Get.theme.primaryColor
                                  : Colors.grey[300],
                              title: "All Rounder",
                              onTap: () {
                                matchesController.updateRankType(3);
                                setState(() {});
                              }),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                    matchesController.selectedRankType == 1
                        ? Expanded(
                            child: ListView.builder(
                                itemCount: matchesController.rankingModel!
                                            .ranks!.batsmen!.odis!.length >
                                        15
                                    ? 15
                                    : matchesController.rankingModel!.ranks!
                                        .batsmen!.odis!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.to(() => PlayerDetailsScreen(
                                          id: int.parse(matchesController
                                              .rankingModel!
                                              .ranks!
                                              .batsmen!
                                              .odis![index]
                                              .pid!)));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 16),
                                      decoration: BoxDecoration(
                                        color: Get.theme.cardColor,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radiusDefault),
                                      ),
                                      child: ListTile(
                                        leading: Text(
                                          (index + 1).toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  Dimensions.fontSizeDefault,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${matchesController.rankingModel!.ranks!.batsmen!.odis![index].player ?? ""} ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: Dimensions
                                                      .fontSizeDefault,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              matchesController
                                                  .rankingModel!
                                                  .ranks!
                                                  .batsmen!
                                                  .odis![index]
                                                  .team!,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize:
                                                    Dimensions.fontSizeDefault,
                                              ),
                                            ),
                                          ],
                                        ),
                                        trailing: Text(
                                          "${matchesController.rankingModel!.ranks!.batsmen!.odis![index].rating ?? ""} ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  Dimensions.fontSizeDefault,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        : const SizedBox(),
                    matchesController.selectedRankType == 2
                        ? Expanded(
                            child: ListView.builder(
                                itemCount: matchesController.rankingModel!
                                            .ranks!.bowlers!.odis!.length >
                                        15
                                    ? 15
                                    : matchesController.rankingModel!.ranks!
                                        .bowlers!.odis!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.to(() => PlayerDetailsScreen(
                                          id: int.parse(matchesController
                                              .rankingModel!
                                              .ranks!
                                              .bowlers!
                                              .odis![index]
                                              .pid!)));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 16),
                                      decoration: BoxDecoration(
                                        color: Get.theme.cardColor,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radiusDefault),
                                      ),
                                      child: ListTile(
                                        leading: Text(
                                          (index + 1).toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  Dimensions.fontSizeDefault,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${matchesController.rankingModel!.ranks!.bowlers!.odis![index].player ?? ""} ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: Dimensions
                                                      .fontSizeDefault,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              matchesController
                                                  .rankingModel!
                                                  .ranks!
                                                  .bowlers!
                                                  .odis![index]
                                                  .team!,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize:
                                                    Dimensions.fontSizeDefault,
                                              ),
                                            ),
                                          ],
                                        ),
                                        trailing: Text(
                                          "${matchesController.rankingModel!.ranks!.bowlers!.odis![index].rating ?? ""} ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  Dimensions.fontSizeDefault,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        : const SizedBox(),
                    matchesController.selectedRankType == 3
                        ? Expanded(
                            child: ListView.builder(
                                itemCount: matchesController.rankingModel!
                                            .ranks!.allRounders!.odis!.length >
                                        15
                                    ? 15
                                    : matchesController.rankingModel!.ranks!
                                        .allRounders!.odis!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.to(() => PlayerDetailsScreen(
                                          id: int.parse(matchesController
                                              .rankingModel!
                                              .ranks!
                                              .allRounders!
                                              .odis![index]
                                              .pid!)));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 16),
                                      decoration: BoxDecoration(
                                        color: Get.theme.cardColor,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radiusDefault),
                                      ),
                                      child: ListTile(
                                        leading: Text(
                                          (index + 1).toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  Dimensions.fontSizeDefault,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${matchesController.rankingModel!.ranks!.allRounders!.odis![index].player ?? ""} ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: Dimensions
                                                      .fontSizeDefault,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              matchesController
                                                  .rankingModel!
                                                  .ranks!
                                                  .allRounders!
                                                  .odis![index]
                                                  .team!,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize:
                                                    Dimensions.fontSizeDefault,
                                              ),
                                            ),
                                          ],
                                        ),
                                        trailing: Text(
                                          "${matchesController.rankingModel!.ranks!.allRounders!.odis![index].rating ?? ""} ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  Dimensions.fontSizeDefault,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        : const SizedBox(),
                  ],
                ),
              );
            }),
            GetBuilder<AllMatchesController>(builder: (matchesController) {
              if (matchesController.isLoading) {
                return const Loader();
              }
              if (matchesController.rankingModel == null) {
                return Center(
                  child: Text(
                    "No data found",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimensions.fontSizeLarge,
                        fontWeight: FontWeight.bold),
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Button(
                              textColor: matchesController.selectedRankType == 1
                                  ? Colors.white
                                  : Colors.black,
                              bgColor: matchesController.selectedRankType == 1
                                  ? Get.theme.primaryColor
                                  : Colors.grey[300],
                              title: "Batting",
                              onTap: () {
                                matchesController.updateRankType(1);
                                setState(() {});
                              }),
                        ),
                        const SizedBox(
                          width: Dimensions.paddingSizeDefault,
                        ),
                        Expanded(
                          child: Button(
                              textColor: matchesController.selectedRankType == 2
                                  ? Colors.white
                                  : Colors.black,
                              bgColor: matchesController.selectedRankType == 2
                                  ? Get.theme.primaryColor
                                  : Colors.grey[300],
                              title: "Bowling",
                              onTap: () {
                                matchesController.updateRankType(2);
                                setState(() {});
                              }),
                        ),
                        const SizedBox(
                          width: Dimensions.paddingSizeDefault,
                        ),
                        Expanded(
                          child: Button(
                              textColor: matchesController.selectedRankType == 3
                                  ? Colors.white
                                  : Colors.black,
                              bgColor: matchesController.selectedRankType == 3
                                  ? Get.theme.primaryColor
                                  : Colors.grey[300],
                              title: "All Rounder",
                              onTap: () {
                                matchesController.updateRankType(3);
                                setState(() {});
                              }),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                    matchesController.selectedRankType == 1
                        ? Expanded(
                            child: ListView.builder(
                                itemCount: matchesController.rankingModel!
                                            .ranks!.batsmen!.t20S!.length >
                                        15
                                    ? 15
                                    : matchesController.rankingModel!.ranks!
                                        .batsmen!.t20S!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.to(() => PlayerDetailsScreen(
                                          id: int.parse(matchesController
                                              .rankingModel!
                                              .ranks!
                                              .batsmen!
                                              .t20S![index]
                                              .pid!)));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 16),
                                      decoration: BoxDecoration(
                                        color: Get.theme.cardColor,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radiusDefault),
                                      ),
                                      child: ListTile(
                                        leading: Text(
                                          (index + 1).toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  Dimensions.fontSizeDefault,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${matchesController.rankingModel!.ranks!.batsmen!.t20S![index].player ?? ""} ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: Dimensions
                                                      .fontSizeDefault,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              matchesController
                                                  .rankingModel!
                                                  .ranks!
                                                  .batsmen!
                                                  .t20S![index]
                                                  .team!,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize:
                                                    Dimensions.fontSizeDefault,
                                              ),
                                            ),
                                          ],
                                        ),
                                        trailing: Text(
                                          "${matchesController.rankingModel!.ranks!.batsmen!.t20S![index].rating ?? ""} ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  Dimensions.fontSizeDefault,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        : const SizedBox(),
                    matchesController.selectedRankType == 2
                        ? Expanded(
                            child: ListView.builder(
                                itemCount: matchesController.rankingModel!
                                            .ranks!.bowlers!.t20S!.length >
                                        15
                                    ? 15
                                    : matchesController.rankingModel!.ranks!
                                        .bowlers!.t20S!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.to(() => PlayerDetailsScreen(
                                          id: int.parse(matchesController
                                              .rankingModel!
                                              .ranks!
                                              .bowlers!
                                              .t20S![index]
                                              .pid!)));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 16),
                                      decoration: BoxDecoration(
                                        color: Get.theme.cardColor,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radiusDefault),
                                      ),
                                      child: ListTile(
                                        leading: Text(
                                          (index + 1).toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  Dimensions.fontSizeDefault,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${matchesController.rankingModel!.ranks!.bowlers!.t20S![index].player ?? ""} ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: Dimensions
                                                      .fontSizeDefault,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              matchesController
                                                  .rankingModel!
                                                  .ranks!
                                                  .bowlers!
                                                  .t20S![index]
                                                  .team!,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize:
                                                    Dimensions.fontSizeDefault,
                                              ),
                                            ),
                                          ],
                                        ),
                                        trailing: Text(
                                          "${matchesController.rankingModel!.ranks!.bowlers!.t20S![index].rating ?? ""} ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  Dimensions.fontSizeDefault,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        : const SizedBox(),
                    matchesController.selectedRankType == 3
                        ? Expanded(
                            child: ListView.builder(
                                itemCount: matchesController.rankingModel!
                                            .ranks!.allRounders!.t20S!.length >
                                        15
                                    ? 15
                                    : matchesController.rankingModel!.ranks!
                                        .allRounders!.t20S!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.to(() => PlayerDetailsScreen(
                                          id: int.parse(matchesController
                                              .rankingModel!
                                              .ranks!
                                              .allRounders!
                                              .t20S![index]
                                              .pid!)));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 16),
                                      decoration: BoxDecoration(
                                        color: Get.theme.cardColor,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radiusDefault),
                                      ),
                                      child: ListTile(
                                        leading: Text(
                                          (index + 1).toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  Dimensions.fontSizeDefault,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${matchesController.rankingModel!.ranks!.allRounders!.t20S![index].player ?? ""} ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: Dimensions
                                                      .fontSizeDefault,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              matchesController
                                                  .rankingModel!
                                                  .ranks!
                                                  .allRounders!
                                                  .t20S![index]
                                                  .team!,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize:
                                                    Dimensions.fontSizeDefault,
                                              ),
                                            ),
                                          ],
                                        ),
                                        trailing: Text(
                                          "${matchesController.rankingModel!.ranks!.allRounders!.t20S![index].rating ?? ""} ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  Dimensions.fontSizeDefault,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        : const SizedBox(),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

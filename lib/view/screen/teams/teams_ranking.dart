import 'package:cricupdate/controller/all_matches_controller.dart';
import 'package:cricupdate/controller/auth_controller.dart';
import 'package:cricupdate/view/base/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/dimensions.dart';

class TeamRankingScreen extends StatefulWidget {
  const TeamRankingScreen({super.key});

  @override
  State<TeamRankingScreen> createState() => _TeamRankingScreenState();
}

class _TeamRankingScreenState extends State<TeamRankingScreen> {
  @override
  void initState() {
    Get.find<AllMatchesController>()
        .getRanking(token: Get.find<AuthController>().entityToken);

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
            "Team Ranking",
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
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        body: TabBarView(
          children: [
            GetBuilder<AllMatchesController>(builder: (matchesController) {
              if (matchesController.isLoading) {
                return const Loader();
              }
              if (matchesController.rankingModel == null) {
                return Center(
                  child: Text(
                    "No data Found",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.fontSizeLarge),
                  ),
                );
              }

              return ListView.builder(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                  itemCount: matchesController
                              .rankingModel!.ranks!.teams!.tests!.length >
                          10
                      ? 10
                      : matchesController
                          .rankingModel!.ranks!.teams!.tests!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        /*
                        Get.to(() =>
                            TeamDetailsScreen(
                                teamModel: matchesController
                                    .testMensTeamRankingList[0].team![index]));*/
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Get.theme.cardColor,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radiusDefault),
                        ),
                        child: ListTile(
                          leading: Text(
                            (index + 1).toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: Dimensions.fontSizeDefault,
                                fontWeight: FontWeight.bold),
                          ),
                          title: Row(
                            children: [
                              Image.network(
                                matchesController.rankingModel!.ranks!.teams!
                                        .tests![index].logoUrl ??
                                    "",
                                height: 30,
                                width: 40,
                              ),
                              const SizedBox(
                                width: Dimensions.paddingSizeSmall,
                              ),
                              Text(
                                matchesController.rankingModel!.ranks!.teams!
                                        .tests![index].team ??
                                    '',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Dimensions.fontSizeDefault,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  });
            }),
            GetBuilder<AllMatchesController>(builder: (matchesController) {
              if (matchesController.isLoading) {
                return const Loader();
              }
              if (matchesController.rankingModel == null) {
                return Center(
                  child: Text(
                    "No data Found",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.fontSizeLarge),
                  ),
                );
              }

              return ListView.builder(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                  itemCount: matchesController
                              .rankingModel!.ranks!.teams!.odis!.length >
                          10
                      ? 10
                      : matchesController
                          .rankingModel!.ranks!.teams!.odis!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        /*
                        Get.to(() =>
                            TeamDetailsScreen(
                                teamModel: matchesController
                                    .testMensTeamRankingList[0].team![index]));*/
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Get.theme.cardColor,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radiusDefault),
                        ),
                        child: ListTile(
                          leading: Text(
                            (index + 1).toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: Dimensions.fontSizeDefault,
                                fontWeight: FontWeight.bold),
                          ),
                          title: Row(
                            children: [
                              Image.network(
                                matchesController.rankingModel!.ranks!.teams!
                                        .odis![index].logoUrl ??
                                    "",
                                height: 30,
                                width: 40,
                              ),
                              const SizedBox(
                                width: Dimensions.paddingSizeSmall,
                              ),
                              Text(
                                matchesController.rankingModel!.ranks!.teams!
                                        .odis![index].team ??
                                    '',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Dimensions.fontSizeDefault,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  });
            }),
            GetBuilder<AllMatchesController>(builder: (matchesController) {
              if (matchesController.isLoading) {
                return const Loader();
              }
              if (matchesController.rankingModel == null) {
                return Center(
                  child: Text(
                    "No data Found",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.fontSizeLarge),
                  ),
                );
              }

              return ListView.builder(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                  itemCount: matchesController
                              .rankingModel!.ranks!.teams!.t20S!.length >
                          10
                      ? 10
                      : matchesController
                          .rankingModel!.ranks!.teams!.t20S!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        /*
                        Get.to(() =>
                            TeamDetailsScreen(
                                teamModel: matchesController
                                    .testMensTeamRankingList[0].team![index]));*/
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Get.theme.cardColor,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radiusDefault),
                        ),
                        child: ListTile(
                          leading: Text(
                            (index + 1).toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: Dimensions.fontSizeDefault,
                                fontWeight: FontWeight.bold),
                          ),
                          title: Row(
                            children: [
                              Image.network(
                                matchesController.rankingModel!.ranks!.teams!
                                        .t20S![index].logoUrl ??
                                    "",
                                height: 30,
                                width: 40,
                              ),
                              const SizedBox(
                                width: Dimensions.paddingSizeSmall,
                              ),
                              Text(
                                matchesController.rankingModel!.ranks!.teams!
                                        .t20S![index].team ??
                                    '',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Dimensions.fontSizeDefault,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  });
            }),
          ],
        ),
      ),
    );
  }
}

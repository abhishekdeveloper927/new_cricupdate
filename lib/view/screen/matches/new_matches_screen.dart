/*
import 'package:cricupdate/controller/matches_controller.dart';
import 'package:cricupdate/view/screen/matches/widget/completed_match_card.dart';
import 'package:cricupdate/view/screen/matches/widget/live_match_card.dart';
import 'package:cricupdate/view/screen/matches/widget/match_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../util/dimensions.dart';

class NewMatchesScreen extends StatefulWidget {
  final VoidCallback onScreenHideButtonPressed;

  const NewMatchesScreen({Key? key, required this.onScreenHideButtonPressed})
      : super(key: key);

  @override
  State<NewMatchesScreen> createState() => _NewMatchesScreenState();
}

class _NewMatchesScreenState extends State<NewMatchesScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadData();
    });
    super.initState();
  }

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await loadData();
    _refreshController.refreshCompleted();
  }

  Future<void> loadData() async {}

  void _onLoading() async {
    await loadMoreData();
    _refreshController.loadComplete();
  }

  Future<void> loadMoreData() async {}

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
              "Matches",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.fontSizeLarge),
            ),
            bottom: TabBar(
              labelColor: Colors.white,
              indicatorColor: Theme.of(context).primaryColor,
              tabs: const [
                Tab(text: "Live"),
                Tab(text: "Upcoming"),
                Tab(text: "Recent"),
              ],
            ),
          ),
          backgroundColor: Get.theme.scaffoldBackgroundColor,
          body: SmartRefresher(
              enablePullDown: true,
              enablePullUp: false,
              header: const WaterDropHeader(),
              controller: _refreshController,
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              child: TabBarView(
                children: [
                  GetBuilder<MatchesController>(builder: (matchesController) {
                    if (matchesController.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (matchesController.liveFixtureMatchPage == null) {
                      return const Center(
                        child: Text("No Data Found"),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: matchesController
                              .liveFixtureMatchPage!.data.isNotEmpty
                          ? ListView.builder(
                              itemCount: matchesController
                                  .liveFixtureMatchPage!.data.length,
                              itemBuilder: (context, index) {
                                return LiveMatchCard(
                                    matchModel: matchesController
                                        .liveFixtureMatchPage!.data[index]);
                              },
                            )
                          : Center(
                              child: Text(
                                "No data found",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Dimensions.fontSizeLarge,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                    );
                  }),
                  GetBuilder<MatchesController>(builder: (matchesController) {
                    if (matchesController.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (matchesController.upcomingFixtureMatchPage == null) {
                      return const Center(
                        child: Text("No Data Found"),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                InkWell(
                                  onTap: () {
                                    matchesController
                                        .clearUpcomingUpdateLeague();

                                    matchesController
                                        .getAllUpcomingFixtureMatch(null);
                                    setState(() {});
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(
                                        Dimensions.paddingSizeDefault),
                                    margin: const EdgeInsets.only(
                                        right: Dimensions.paddingSizeDefault),
                                    decoration: BoxDecoration(
                                        color: matchesController
                                                    .selectedUpcomingLeagueModel ==
                                                null
                                            ? Get.theme.primaryColor
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radiusDefault)),
                                    child: Center(
                                      child: Text(
                                        "All",
                                        style: TextStyle(
                                            color: matchesController
                                                        .selectedUpcomingLeagueModel ==
                                                    null
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize:
                                                Dimensions.fontSizeDefault,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: matchesController
                                        .leaguePage!.data.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          matchesController
                                              .updateUpcomingLeague(
                                                  matchesController
                                                      .leaguePage!.data[index]);
                                          setState(() {});
                                          matchesController
                                              .getAllUpcomingFixtureMatch(
                                                  matchesController
                                                      .selectedUpcomingLeagueModel!
                                                      .id!);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(
                                              Dimensions.paddingSizeDefault),
                                          margin: const EdgeInsets.only(
                                              right: Dimensions
                                                  .paddingSizeDefault),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: matchesController
                                                              .selectedUpcomingLeagueModel ==
                                                          matchesController
                                                              .leaguePage!
                                                              .data[index]
                                                      ? Colors.transparent
                                                      : Colors.black),
                                              color: matchesController
                                                          .selectedUpcomingLeagueModel ==
                                                      matchesController
                                                          .leaguePage!
                                                          .data[index]
                                                  ? Get.theme.primaryColor
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions
                                                          .radiusDefault)),
                                          child: Center(
                                            child: Text(
                                              matchesController.leaguePage!
                                                      .data[index].name ??
                                                  "",
                                              style: TextStyle(
                                                  color: matchesController
                                                              .selectedUpcomingLeagueModel ==
                                                          matchesController
                                                              .leaguePage!
                                                              .data[index]
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: Dimensions
                                                      .fontSizeDefault,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: matchesController
                                    .upcomingFixtureMatchPage!.data.isNotEmpty
                                ? Dimensions.paddingSizeDefault
                                : 50,
                          ),
                          matchesController
                                  .upcomingFixtureMatchPage!.data.isNotEmpty
                              ? Expanded(
                                  child: ListView.builder(
                                    itemCount: matchesController
                                        .upcomingFixtureMatchPage!.data.length,
                                    itemBuilder: (context, index) {
                                      return MatchCard(
                                          fixtureMatchModel: matchesController
                                              .upcomingFixtureMatchPage!
                                              .data[index]);
                                    },
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    "No data found",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: Dimensions.fontSizeLarge,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                        ],
                      ),
                    );
                  }),
                  GetBuilder<MatchesController>(builder: (matchesController) {
                    if (matchesController.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (matchesController.recentFixtureMatchPage == null) {
                      return const Center(
                        child: Text("No Data Found"),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                InkWell(
                                  onTap: () {
                                    matchesController
                                        .clearCompletedUpdateLeague();
                                    matchesController
                                        .getAllCompletedFixtureMatch(null);
                                    setState(() {});
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(
                                        Dimensions.paddingSizeDefault),
                                    margin: const EdgeInsets.only(
                                        right: Dimensions.paddingSizeDefault),
                                    decoration: BoxDecoration(
                                        color: matchesController
                                                    .selectedCompletedLeagueModel ==
                                                null
                                            ? Get.theme.primaryColor
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radiusDefault)),
                                    child: Center(
                                      child: Text(
                                        "All",
                                        style: TextStyle(
                                            color: matchesController
                                                        .selectedCompletedLeagueModel ==
                                                    null
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize:
                                                Dimensions.fontSizeDefault,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: matchesController
                                        .leaguePage!.data.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          matchesController
                                              .updateCompletedLeague(
                                                  matchesController
                                                      .leaguePage!.data[index]);
                                          setState(() {});
                                          matchesController
                                              .getAllCompletedFixtureMatch(
                                                  matchesController
                                                      .selectedCompletedLeagueModel!
                                                      .id!);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(
                                              Dimensions.paddingSizeDefault),
                                          margin: const EdgeInsets.only(
                                              right: Dimensions
                                                  .paddingSizeDefault),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: matchesController
                                                              .selectedCompletedLeagueModel ==
                                                          matchesController
                                                              .leaguePage!
                                                              .data[index]
                                                      ? Colors.transparent
                                                      : Colors.black),
                                              color: matchesController
                                                          .selectedCompletedLeagueModel ==
                                                      matchesController
                                                          .leaguePage!
                                                          .data[index]
                                                  ? Get.theme.primaryColor
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions
                                                          .radiusDefault)),
                                          child: Center(
                                            child: Text(
                                              matchesController.leaguePage!
                                                      .data[index].name ??
                                                  "",
                                              style: TextStyle(
                                                  color: matchesController
                                                              .selectedCompletedLeagueModel ==
                                                          matchesController
                                                              .leaguePage!
                                                              .data[index]
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: Dimensions
                                                      .fontSizeDefault,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: matchesController
                                    .recentFixtureMatchPage!.data.isNotEmpty
                                ? Dimensions.paddingSizeDefault
                                : 50,
                          ),
                          matchesController
                                  .recentFixtureMatchPage!.data.isNotEmpty
                              ? Expanded(
                                  child: ListView.builder(
                                    itemCount: matchesController
                                        .recentFixtureMatchPage!.data.length,
                                    itemBuilder: (context, index) {
                                      return CompletedMatchCard(
                                          fixtureMatchModel: matchesController
                                              .recentFixtureMatchPage!
                                              .data[index]);
                                    },
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    "No data found",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: Dimensions.fontSizeLarge,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                        ],
                      ),
                    );
                  }),
                ],
              )),
        ));
  }
}
*/

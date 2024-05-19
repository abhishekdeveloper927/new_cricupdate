import 'package:cricupdate/view/base/loader.dart';
import 'package:cricupdate/view/screen/matches/widget/live_match_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../controller/all_matches_controller.dart';
import '../../../controller/auth_controller.dart';
import '../../../util/dimensions.dart';

class LiveMatchesListScreen extends StatefulWidget {
  const LiveMatchesListScreen({super.key});

  @override
  State<LiveMatchesListScreen> createState() => _LiveMatchesListScreenState();
}

class _LiveMatchesListScreenState extends State<LiveMatchesListScreen> {
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

  Future<void> loadData() async {
    await Get.find<AllMatchesController>().getAllMatches(
        token: Get
            .find<AuthController>()
            .entityToken, status: 3);

    await Get.find<AllMatchesController>().getCompetitionList(
        token: Get
            .find<AuthController>()
            .entityToken, status: "live");
  }

  void _onLoading() async {
    await loadMoreData();
    _refreshController.loadComplete();
  }

  Future<void> loadMoreData() async {}

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: false,
      header: const WaterDropHeader(),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: GetBuilder<AllMatchesController>(builder: (matchesController) {
        if (matchesController.isLoading) {
          return const Loader();
        }

        return Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(
                      onTap: () {
                        matchesController.updateMatchFormat(0);
                        setState(() {});
                        matchesController.getAllMatches(
                            token: Get
                                .find<AuthController>()
                                .entityToken,
                            status: 3);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            right: Dimensions.paddingSizeDefault),
                        padding:
                        const EdgeInsets.all(Dimensions.paddingSizeDefault),
                        decoration: BoxDecoration(
                            color: matchesController.selectedMatchFormat == 0
                                ? Get.theme.primaryColor
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(
                                Dimensions.radiusDefault)),
                        child: Center(
                          child: Text(
                            "All",
                            style: TextStyle(
                                color:
                                matchesController.selectedMatchFormat == 0
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: Dimensions.fontSizeLarge,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        matchesController.updateMatchFormat(1);
                        setState(() {});
                        matchesController.getAllMatches(
                            token: Get
                                .find<AuthController>()
                                .entityToken,
                            status: 3,
                            format: 7);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            right: Dimensions.paddingSizeDefault),
                        padding:
                        const EdgeInsets.all(Dimensions.paddingSizeDefault),
                        decoration: BoxDecoration(
                            color: matchesController.selectedMatchFormat == 1
                                ? Get.theme.primaryColor
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(
                                Dimensions.radiusDefault)),
                        child: Center(
                          child: Text(
                            "Odi",
                            style: TextStyle(
                                color:
                                matchesController.selectedMatchFormat == 1
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: Dimensions.fontSizeLarge,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        matchesController.updateMatchFormat(2);
                        await matchesController.getAllMatches(
                            token: Get
                                .find<AuthController>()
                                .entityToken,
                            status: 3,
                            format: 6);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            right: Dimensions.paddingSizeDefault),
                        padding:
                        const EdgeInsets.all(Dimensions.paddingSizeDefault),
                        decoration: BoxDecoration(
                            color: matchesController.selectedMatchFormat == 2
                                ? Get.theme.primaryColor
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(
                                Dimensions.radiusDefault)),
                        child: Center(
                          child: Text(
                            "T20",
                            style: TextStyle(
                                color:
                                matchesController.selectedMatchFormat == 2
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: Dimensions.fontSizeLarge,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        matchesController.updateMatchFormat(3);
                        setState(() {});
                        await matchesController.getAllMatches(
                            token: Get
                                .find<AuthController>()
                                .entityToken,
                            status: 3,
                            format: 5);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            right: Dimensions.paddingSizeDefault),
                        padding:
                        const EdgeInsets.all(Dimensions.paddingSizeDefault),
                        decoration: BoxDecoration(
                            color: matchesController.selectedMatchFormat == 3
                                ? Get.theme.primaryColor
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(
                                Dimensions.radiusDefault)),
                        child: Center(
                          child: Text(
                            "Test",
                            style: TextStyle(
                                color:
                                matchesController.selectedMatchFormat == 3
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: Dimensions.fontSizeLarge,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.paddingSizeDefault,
              ),
              matchesController.liveMatchList.isNotEmpty ?
              Expanded(
                child: ListView.builder(
                  itemCount: matchesController.liveMatchList.length,
                  itemBuilder: (context, index) {
                    return LiveMatchCard(
                        matchModel: matchesController.liveMatchList[index]);
                  },
                ),
              ) : Center(
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
    );
  }
}

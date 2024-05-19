import 'package:cricupdate/view/screen/matches/widget/completed_match_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../controller/all_matches_controller.dart';
import '../../../controller/auth_controller.dart';
import '../../../util/dimensions.dart';
import '../../base/loader.dart';

class CompletedMatchScreen extends StatefulWidget {
  const CompletedMatchScreen({super.key});

  @override
  State<CompletedMatchScreen> createState() => _CompletedMatchScreenState();
}

class _CompletedMatchScreenState extends State<CompletedMatchScreen> {
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
            .entityToken, status: 2);
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
                        matchesController.updateMatchFormat(0);
                        setState(() {});
                        matchesController.getAllMatches(
                            token: Get
                                .find<AuthController>()
                                .entityToken,
                            status: 2);
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
                            status: 2,
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
                            status: 2,
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
                            status: 2,
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
              matchesController.completeMatchList.isNotEmpty ?
              Expanded(
                child: ListView.builder(
                  itemCount: matchesController.completeMatchList.length,
                  itemBuilder: (context, index) {
                    return CompletedMatchCard(
                        matchModel: matchesController.completeMatchList[index]);
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

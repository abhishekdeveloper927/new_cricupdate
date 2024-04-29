import 'package:cricupdate/controller/all_matches_controller.dart';
import 'package:cricupdate/data/model/response/matchh_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../controller/auth_controller.dart';
import '../../../util/dimensions.dart';
import '../../base/loader.dart';

class TeamSquadsScreen extends StatefulWidget {
  final Match matchModel;

  const TeamSquadsScreen({super.key, required this.matchModel});

  @override
  State<TeamSquadsScreen> createState() => _TeamSquadsScreenState();
}

class _TeamSquadsScreenState extends State<TeamSquadsScreen> {
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
    await Get.find<AllMatchesController>().getTeamSquads(
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
    return GetBuilder<AllMatchesController>(builder: (matchesController) {
      if (matchesController.isLoading) {
        return const Loader();
      }
      if (matchesController.teamSquadModel == null) {
        return Center(
          child: Text(
            "No data found ",
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
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusDefault)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            Image.network(
                              widget.matchModel.teama!.logoUrl ?? "",
                              height: 35,
                              width: 35,
                            ),
                            const SizedBox(
                              width: Dimensions.paddingSizeSmall,
                            ),
                            Text(
                              widget.matchModel.teama!.shortName ?? "",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.fontSizeLarge),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Text(
                              widget.matchModel.teamb!.shortName ?? "",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.fontSizeLarge),
                            ),
                            const SizedBox(
                              width: Dimensions.paddingSizeSmall,
                            ),
                            Image.network(
                              widget.matchModel.teamb!.logoUrl ?? "",
                              height: 35,
                              width: 35,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: Dimensions.paddingSizeDefault,
                ),
                Text(
                  "Team Squad",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.fontSizeLarge),
                ),
                const SizedBox(
                  height: Dimensions.paddingSizeDefault,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          matchesController.teamSquadModel!.teama != null
                              ? matchesController
                                          .teamSquadModel!.teama!.squads !=
                                      null
                                  ? Expanded(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: matchesController
                                              .teamSquadModel!
                                              .teama!
                                              .squads!
                                              .length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: Dimensions
                                                      .paddingSizeDefault),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    child: Row(
                                                      children: [
                                                        /*
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      child: Image.network(
                                                        matchesController
                                                            .homeTeamSquadPage!
                                                            .data!
                                                            .squad![index]
                                                            .imagePath!,
                                                        height: 35,
                                                        fit: BoxFit.cover,
                                                        width: 35,
                                                      ),
                                                    ),*/
                                                        const SizedBox(
                                                          width: Dimensions
                                                              .paddingSizeSmall,
                                                        ),
                                                        SizedBox(
                                                          width: Get.width / 3,
                                                          child: Text(
                                                            matchesController
                                                                    .teamSquadModel!
                                                                    .teama!
                                                                    .squads![
                                                                        index]
                                                                    .name ??
                                                                "",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: Dimensions
                                                                    .fontSizeLarge),
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                    )
                                  : SizedBox()
                              : SizedBox(),
                          const SizedBox(
                            width: 4,
                          ),
                          matchesController.teamSquadModel!.teamb != null
                              ? matchesController
                                          .teamSquadModel!.teamb!.squads !=
                                      null
                                  ? Expanded(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: matchesController
                                              .teamSquadModel!
                                              .teamb!
                                              .squads!
                                              .length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: Dimensions
                                                      .paddingSizeDefault),
                                              child: SizedBox(
                                                width: Get.width / 3,
                                                child: Text(
                                                  matchesController
                                                          .teamSquadModel!
                                                          .teamb!
                                                          .squads![index]
                                                          .name ??
                                                      "",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: Dimensions
                                                          .fontSizeLarge),
                                                  textAlign: TextAlign.end,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            );
                                          }),
                                    )
                                  : SizedBox()
                              : SizedBox(),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ));
    });
  }
}
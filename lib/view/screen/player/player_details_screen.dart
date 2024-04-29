import 'package:cricupdate/controller/all_matches_controller.dart';
import 'package:cricupdate/controller/auth_controller.dart';
import 'package:cricupdate/data/model/response/player_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../util/dimensions.dart';
import '../../../util/images.dart';

class PlayerDetailsScreen extends StatefulWidget {
  final int id;

  const PlayerDetailsScreen({super.key, required this.id});

  @override
  State<PlayerDetailsScreen> createState() => _PlayerDetailsScreenState();
}

class _PlayerDetailsScreenState extends State<PlayerDetailsScreen> {
  @override
  void initState() {
    Get.find<AllMatchesController>().getPlayerStats(
        token: Get.find<AuthController>().entityToken!, playerId: widget.id!);
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
              "Player Details",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.fontSizeLarge),
            ),
            bottom: TabBar(
              labelColor: Colors.white,
              indicatorColor: Theme.of(context).primaryColor,
              tabs: const [
                Tab(text: "Personal Info"),
                Tab(text: "Batting"),
                Tab(text: "Bowling"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              GetBuilder<AllMatchesController>(builder: (matchesController) {
                if (matchesController.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (matchesController.playerStatsModel == null) {
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
                return ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    const SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300], shape: BoxShape.circle),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            matchesController
                                .playerStatsModel!.player!.logoUrl!,
                            height: 200,
                            width: 200,
                            errorBuilder: (BuildContext context, Object object,
                                StackTrace? tree) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  Images.appIcon2,
                                  height: 200,
                                  width: 200,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nationality",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.fontSizeLarge),
                        ),
                        Text(
                          "${matchesController.playerStatsModel!.player!.nationality ?? ""}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.fontSizeLarge),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Player Name",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.fontSizeLarge),
                        ),
                        Text(
                          "${matchesController.playerStatsModel!.player!.firstName ?? ""} ${matchesController.playerStatsModel!.player!.lastName! ?? ""}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.fontSizeLarge),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Position",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.fontSizeLarge),
                        ),
                        Text(
                          matchesController
                                  .playerStatsModel!.player!.playingRole ??
                              "",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.fontSizeLarge),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Batting Style",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.fontSizeLarge),
                        ),
                        Text(
                          matchesController
                                  .playerStatsModel!.player!.battingStyle ??
                              "",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.fontSizeLarge),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Bowling Style",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.fontSizeLarge),
                        ),
                        Text(
                          matchesController
                                  .playerStatsModel!.player!.bowlingStyle ??
                              "",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.fontSizeLarge),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Date Of Birth",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.fontSizeLarge),
                        ),
                        Text(
                          matchesController.playerStatsModel!.player!.birthdate
                              .toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.fontSizeLarge),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Birth Place",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.fontSizeLarge),
                        ),
                        Text(
                          matchesController
                                  .playerStatsModel!.player!.birthplace ??
                              "",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.fontSizeLarge),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                  ],
                );
              }),
              GetBuilder<AllMatchesController>(
                builder: (matchesController) {
                  if (matchesController.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (matchesController.playerStatsModel == null) {
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

                  return ListView(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: Colors.grey[300]),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Batting",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                "Test",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                "Odi",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                "T20",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Matches",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.test !=
                                        null
                                    ? matchesController.playerStatsModel!
                                        .batting!.test!.matches
                                        .toString()
                                    : "0",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.odi !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.batting!.odi!.matches
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.t20I !=
                                        null
                                    ? matchesController.playerStatsModel!
                                        .batting!.t20I!.matches
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Innings",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.test !=
                                        null
                                    ? matchesController.playerStatsModel!
                                        .batting!.test!.innings
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.odi !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.batting!.odi!.innings
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.t20I !=
                                        null
                                    ? matchesController.playerStatsModel!
                                        .batting!.t20I!.innings
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Runs",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.test !=
                                        null
                                    ? "${matchesController.playerStatsModel!.batting!.test!.runs ?? "0"}"
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.odi !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.batting!.odi!.runs
                                        .toString()
                                    : "0",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.t20I !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.batting!.t20I!.runs
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Balls",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.test !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.batting!.test!.balls
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.odi !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.batting!.odi!.balls
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.t20I !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.batting!.t20I!.balls
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Highest",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.test !=
                                        null
                                    ? matchesController.playerStatsModel!
                                        .batting!.test!.highest
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.odi !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.batting!.odi!.highest
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.t20I !=
                                        null
                                    ? matchesController.playerStatsModel!
                                        .batting!.t20I!.highest
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Average",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.test !=
                                        null
                                    ? matchesController.playerStatsModel!
                                        .batting!.test!.average
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.odi !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.batting!.odi!.average
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.t20I !=
                                        null
                                    ? matchesController.playerStatsModel!
                                        .batting!.t20I!.average
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "SR",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.test !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.batting!.test!.strike
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.odi !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.batting!.odi!.strike
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.t20I !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.batting!.t20I!.strike
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Not Out",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.test !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.batting!.test!.notout
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.odi !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.batting!.odi!.notout
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.t20I !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.batting!.t20I!.notout
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Fours",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.test !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.batting!.test!.run4
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.odi !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.batting!.odi!.run4
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.t20I !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.batting!.t20I!.run4
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Sixes",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.test !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.batting!.test!.run6
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.odi !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.batting!.odi!.run6
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.t20I !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.batting!.t20I!.run6
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "50s",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.test !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.batting!.test!.run50
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.odi !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.batting!.odi!.run50
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.t20I !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.batting!.t20I!.run50
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "100s",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.test !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.batting!.test!.run100
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.odi !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.batting!.odi!.run100
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.t20I !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.batting!.t20I!.run100
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Catches",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.test !=
                                        null
                                    ? matchesController.playerStatsModel!
                                        .batting!.test!.catches
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.odi !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.batting!.odi!.catches
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.batting!.t20I !=
                                        null
                                    ? matchesController.playerStatsModel!
                                        .batting!.t20I!.catches
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
              GetBuilder<AllMatchesController>(
                builder: (matchesController) {
                  if (matchesController.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (matchesController.playerStatsModel == null) {
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

                  return ListView(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: Colors.grey[300]),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Bowling",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                "Test",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                "Odi",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                "T20",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Matches",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.test !=
                                        null
                                    ? matchesController.playerStatsModel!
                                        .bowling!.test!.matches
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.odi !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.bowling!.odi!.matches
                                        .toString()
                                    : "0",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.t20I !=
                                        null
                                    ? matchesController.playerStatsModel!
                                        .bowling!.t20I!.matches
                                        .toString()
                                    : "0",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Innings",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.test !=
                                        null
                                    ? matchesController.playerStatsModel!
                                        .bowling!.test!.innings
                                        .toString()
                                    : "0",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.odi !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.bowling!.odi!.innings
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.t20I !=
                                        null
                                    ? matchesController.playerStatsModel!
                                        .bowling!.t20I!.innings
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Runs",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.test !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.bowling!.test!.runs
                                        .toString()
                                    : "0",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.odi !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.bowling!.odi!.runs
                                        .toString()
                                    : "0",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.t20I !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.bowling!.t20I!.runs
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Balls",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.test !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.bowling!.test!.balls
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.odi !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.bowling!.odi!.balls
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.t20I !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.bowling!.t20I!.balls
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Wickets",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.test !=
                                        null
                                    ? matchesController.playerStatsModel!
                                        .bowling!.test!.wickets
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.odi !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.bowling!.odi!.wickets
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.t20I !=
                                        null
                                    ? matchesController.playerStatsModel!
                                        .bowling!.t20I!.wickets
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Average",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.test !=
                                        null
                                    ? matchesController.playerStatsModel!
                                        .bowling!.test!.average
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.odi !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.bowling!.odi!.average
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.t20I !=
                                        null
                                    ? matchesController.playerStatsModel!
                                        .bowling!.t20I!.average
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "SR",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.test !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.bowling!.test!.strike
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.odi !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.bowling!.odi!.strike
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.t20I !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.bowling!.t20I!.strike
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Eco",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.test !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.bowling!.test!.econ
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.odi !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.bowling!.odi!.econ
                                        .toString()
                                    : "0",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.t20I !=
                                        null
                                    ? matchesController
                                        .playerStatsModel!.bowling!.t20I!.econ
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "BBI",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.test !=
                                        null
                                    ? matchesController.playerStatsModel!
                                        .bowling!.test!.bestinning
                                        .toString()
                                    : "0",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.odi !=
                                        null
                                    ? matchesController.playerStatsModel!
                                        .bowling!.odi!.bestinning
                                        .toString()
                                    : "0",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.t20I !=
                                        null
                                    ? matchesController.playerStatsModel!
                                        .bowling!.t20I!.bestinning
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "BBM",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.test !=
                                        null
                                    ? "${matchesController.playerStatsModel!.bowling!.test!.bestmatch ?? "0"}"
                                    : "0",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.odi !=
                                        null
                                    ? "${matchesController.playerStatsModel!.bowling!.odi!.bestmatch ?? "0"}"
                                    : "0",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.t20I !=
                                        null
                                    ? "${matchesController.playerStatsModel!.bowling!.t20I!.bestmatch ?? "0"}"
                                    : "0",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "4w",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.test !=
                                        null
                                    ? matchesController.playerStatsModel!
                                        .bowling!.test!.wicket4I
                                        .toString()
                                    : "0",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.odi !=
                                        null
                                    ? matchesController.playerStatsModel!
                                        .bowling!.odi!.wicket4I
                                        .toString()
                                    : "0",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.t20I !=
                                        null
                                    ? matchesController.playerStatsModel!
                                        .bowling!.t20I!.wicket4I
                                        .toString()
                                    : "0",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "5w",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.test !=
                                        null
                                    ? matchesController.playerStatsModel!
                                        .bowling!.test!.wicket5I
                                        .toString()
                                    : "0",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.odi !=
                                        null
                                    ? matchesController.playerStatsModel!
                                        .bowling!.odi!.wicket5I
                                        .toString()
                                    : "0",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.t20I !=
                                        null
                                    ? matchesController.playerStatsModel!
                                        .bowling!.t20I!.wicket5I
                                        .toString()
                                    : "0",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "W10",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.test !=
                                        null
                                    ? "${matchesController.playerStatsModel!.bowling!.test!.wicket10M ?? "0"}"
                                    : "0",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.odi !=
                                        null
                                    ? "${matchesController.playerStatsModel!.bowling!.odi!.wicket10M ?? "0"}"
                                    : "0",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                matchesController
                                            .playerStatsModel!.bowling!.t20I !=
                                        null
                                    ? "${matchesController.playerStatsModel!.bowling!.t20I!.wicket10M ?? "0"}"
                                    : "0",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ],
          )),
    );
  }
}

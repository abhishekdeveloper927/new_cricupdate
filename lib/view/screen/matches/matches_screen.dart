import 'package:cricupdate/view/screen/matches/completed_match_screen.dart';
import 'package:cricupdate/view/screen/matches/live_matches_list_screen.dart';
import 'package:cricupdate/view/screen/matches/upcoming_match_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/dimensions.dart';

class MatchesScreen extends StatelessWidget {
  final VoidCallback onScreenHideButtonPressed;

  const MatchesScreen({Key? key, required this.onScreenHideButtonPressed})
      : super(key: key);

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
              indicatorColor: Theme
                  .of(context)
                  .primaryColor,
              tabs: const [
                Tab(text: "Live"),
                Tab(text: "Upcoming"),
                Tab(text: "Recent"),
              ],
            ),
          ),
          backgroundColor: Get.theme.scaffoldBackgroundColor,
          body: const TabBarView(
            children: [

              LiveMatchesListScreen(),
              UpcomingMatchScreen(),
              CompletedMatchScreen(),
            ],
          )),
    );
  }
}

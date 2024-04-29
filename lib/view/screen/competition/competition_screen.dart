import 'package:cricupdate/view/screen/competition/completed_competition_screen.dart';
import 'package:cricupdate/view/screen/competition/live_competition_screen.dart';
import 'package:cricupdate/view/screen/competition/upcoming_competition_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/dimensions.dart';

class CompetitionScreen extends StatelessWidget {
  const CompetitionScreen({super.key});

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
            "All Competitions",
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
        body: const TabBarView(
          children: [
            LiveCompetitionScreen(),
            UpcomingCompetitionScreen(),
            CompletedCompetitionScreen(),
          ],
        ),
      ),
    );
  }
}

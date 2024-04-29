import 'package:cricupdate/view/screen/matches/matches_screen.dart';
import 'package:cricupdate/view/screen/more/more_screen.dart';
import 'package:cricupdate/view/screen/news/news_screen.dart';
import 'package:cricupdate/view/screen/videos/videos_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../home/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late PersistentTabController _controller;
  late bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() => [
        HomeScreen(
          onScreenHideButtonPressed: () {
            setState(() {
              _hideNavBar = !_hideNavBar;
            });
          },
        ),
        MatchesScreen(
          onScreenHideButtonPressed: () {
            setState(() {
              _hideNavBar = !_hideNavBar;
            });
          },
        ),
        VideosScreen(
          onScreenHideButtonPressed: () {
            setState(() {
              _hideNavBar = !_hideNavBar;
            });
          },
        ),
        NewsScreen(
          onScreenHideButtonPressed: () {
            setState(() {
              _hideNavBar = !_hideNavBar;
            });
          },
        ),
        MoreScreen(
          onScreenHideButtonPressed: () {
            setState(() {
              _hideNavBar = !_hideNavBar;
            });
          },
        ),
      ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
          icon: const Icon(
            FontAwesomeIcons.house,
            size: 20,
          ),
          title: "Home",
          activeColorPrimary: Get.theme.primaryColor,
          inactiveColorPrimary: Colors.black,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.sports_cricket,
            size: 20,
          ),
          title: "Matches",
          activeColorPrimary: Get.theme.primaryColor,
          inactiveColorPrimary: Colors.black,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.play_circle_fill,
            size: 20,
          ),
          title: "Videos",
          activeColorPrimary: Get.theme.primaryColor,
          inactiveColorPrimary: Colors.black,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.request_page_sharp,
            size: 20,
          ),
          title: "News",
          activeColorPrimary: Get.theme.primaryColor,
          inactiveColorPrimary: Colors.black,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.more_horiz,
            size: 20,
          ),
          title: "More",
          activeColorPrimary: Get.theme.primaryColor,
          inactiveColorPrimary: Colors.black,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      body: Container(
        color: Get.theme.canvasColor,
        child: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          hideNavigationBar: _hideNavBar,
          confineInSafeArea: true,
          backgroundColor: Colors.white,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Get.theme.canvasColor,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.simple,
        ),
      ),
    );
  }
}

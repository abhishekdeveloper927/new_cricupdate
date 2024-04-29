import 'package:cricupdate/controller/auth_controller.dart';
import 'package:cricupdate/util/dimensions.dart';
import 'package:cricupdate/view/base/button.dart';
import 'package:cricupdate/view/screen/player/player_screen.dart';
import 'package:cricupdate/view/screen/player/players_ranking.dart';
import 'package:cricupdate/view/screen/profile/profile_screen.dart';
import 'package:cricupdate/view/screen/splash/splash_screen.dart';
import 'package:cricupdate/view/screen/subscription/subscription_screen.dart';
import 'package:cricupdate/view/screen/teams/teams_ranking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../about/about_screen.dart';
import '../auth/sign_in_screen.dart';
import '../photos/photos_screen.dart';
import '../teams/teams_screen.dart';

class MoreScreen extends StatefulWidget {
  final VoidCallback onScreenHideButtonPressed;

  const MoreScreen({Key? key, required this.onScreenHideButtonPressed})
      : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  final ScrollController _scrollController = ScrollController();

  bool isReverse = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (isReverse) {
          widget.onScreenHideButtonPressed();
          isReverse = false;
        }
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!isReverse) {
          widget.onScreenHideButtonPressed();
          isReverse = true;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Get.theme.primaryColor,
          title: Text(
            "More",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.fontSizeLarge),
          ),
        ),
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        body: ListView(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          children: [
            Container(
              padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(Dimensions.radiusDefault)),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Get.to(() => const TeamsScreen());
                    },
                    leading: const Icon(
                      FontAwesomeIcons.users,
                      color: Colors.black,
                    ),
                    title: Text(
                      "Browse Team",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.fontSizeDefault),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(() => const PlayerScreen());
                    },
                    leading: const Icon(
                      FontAwesomeIcons.user,
                      color: Colors.black,
                    ),
                    title: Text(
                      "Browse Player",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.fontSizeDefault),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: Dimensions.paddingSizeDefault,
            ),
            Container(
              padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(Dimensions.radiusDefault)),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Get.to(() => const TeamRankingScreen());
                    },
                    leading: const Icon(
                      FontAwesomeIcons.calendar,
                      color: Colors.black,
                    ),
                    title: Text(
                      "Team Ranking",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.fontSizeDefault),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(() => const PlayersRankingScreen());
                    },
                    leading: const Icon(
                      FontAwesomeIcons.calendar,
                      color: Colors.black,
                    ),
                    title: Text(
                      "Player Ranking",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.fontSizeDefault),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(() => const PhotoScreen());
                    },
                    leading: const Icon(
                      FontAwesomeIcons.image,
                      color: Colors.black,
                    ),
                    title: Text(
                      "Photos",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.fontSizeDefault),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: Dimensions.paddingSizeDefault,
            ),
            Container(
              padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(Dimensions.radiusDefault)),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Get.to(() => const SubscriptionScreen());
                    },
                    leading: const Icon(
                      Icons.subscriptions_outlined,
                      color: Colors.black,
                    ),
                    title: Text(
                      "Subscription",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.fontSizeDefault),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(() => const ProfileScreen());
                    },
                    leading: const Icon(
                      Icons.person_2,
                      color: Colors.black,
                    ),
                    title: Text(
                      "My Profile",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.fontSizeDefault),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(() => const AboutScreen());
                    },
                    leading: const Icon(
                      FontAwesomeIcons.info,
                      color: Colors.black,
                    ),
                    title: Text(
                      "About CricUpdate",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.fontSizeDefault),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: Dimensions.paddingSizeDefault,
            ),
            GetBuilder<AuthController>(builder: (authController) {
              return authController.userModel != null
                  ? Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radiusDefault)),
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () async {
                              await authController.clearSharedData();
                              Get.offAll(() => SplashScreen());
                            },
                            leading: const Icon(
                              Icons.exit_to_app,
                              color: Colors.red,
                            ),
                            title: Text(
                              "Logout",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.fontSizeDefault),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.red,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Button(
                      title: "Login",
                      onTap: () {
                        Get.to(() => const SignInScreen());
                      });
            }),
          ],
        ));
  }
}

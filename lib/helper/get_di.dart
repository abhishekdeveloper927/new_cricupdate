import 'package:cricupdate/controller/all_matches_controller.dart';
import 'package:cricupdate/controller/news_controller.dart';
import 'package:cricupdate/controller/subscription_controller.dart';
import 'package:cricupdate/controller/videos_controller.dart';
import 'package:cricupdate/data/repository/matches_repo.dart';
import 'package:cricupdate/data/repository/news_repo.dart';
import 'package:cricupdate/data/repository/subscription_repo.dart';
import 'package:cricupdate/data/repository/videos_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/auth_controller.dart';
import '../data/api/api_client.dart';
import '../data/repository/all_matches_repo.dart';
import '../data/repository/auth_repo.dart';

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(sharedPreferences: Get.find()));

  //Repo
  Get.lazyPut(() => AuthRepo(
        sharedPreferences: Get.find(),
        apiClient: Get.find(),
      ));
  Get.lazyPut(() => SubscriptionRepo(
        sharedPreferences: Get.find(),
        apiClient: Get.find(),
      ));
  Get.lazyPut(() => NewsRepo(
        sharedPreferences: Get.find(),
        apiClient: Get.find(),
      ));
  Get.lazyPut(() => VideosRepo(
        sharedPreferences: Get.find(),
        apiClient: Get.find(),
      ));
  Get.lazyPut(() => MatchesRepo(
        sharedPreferences: Get.find(),
        apiClient: Get.find(),
      ));
  Get.lazyPut(() => AllMatchesRepo(
        sharedPreferences: Get.find(),
        apiClient: Get.find(),
      ));

  //Controller
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => SubscriptionController(subscriptionRepo: Get.find()));
  Get.lazyPut(() => NewsController(newsRepo: Get.find()));
  Get.lazyPut(() => VideosController(videosRepo: Get.find()));
  Get.lazyPut(() => AllMatchesController(allMatchesRepo: Get.find()));
}

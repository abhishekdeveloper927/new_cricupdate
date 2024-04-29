import 'dart:async';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../util/app_constants.dart';
import '../api/api_client.dart';

class VideosRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  VideosRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getVideoList() async {
    return await apiClient.getData(
      AppConstants.allVideoUri,
    );
  }

  Future<Response> getShortsList() async {
    return await apiClient.getData(
      AppConstants.allShortsUri,
    );
  }

  Future<Response> getFeaturedVideoList() async {
    return await apiClient.getData(
      AppConstants.allFeaturedVideoUri,
    );
  }
}

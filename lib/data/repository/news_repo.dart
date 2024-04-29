import 'dart:async';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../util/app_constants.dart';
import '../api/api_client.dart';

class NewsRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  NewsRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getNewsList({required String categoryId}) async {
    return await apiClient.getData(
      "${AppConstants.newsUri}?category_id=$categoryId",
    );
  }

  Future<Response> getBannerList() async {
    return await apiClient.getData(
      AppConstants.bannerUri,
    );
  }

  Future<Response> getTournamentBannerList() async {
    return await apiClient.getData(
      AppConstants.tournamentBannerUri,
    );
  }

  Future<Response> getCategoryList() async {
    return await apiClient.getData(
      AppConstants.categoryUri,
    );
  }

  Future<Response> getNewsById({required String id}) async {
    return await apiClient.getData(
      "${AppConstants.newsByIdUri}?id=$id",
    );
  }

  Future<Response> getPhotosById({required String categoryId}) async {
    return await apiClient.getData(
      "${AppConstants.photosUri}?category_id=$categoryId",
    );
  }
}

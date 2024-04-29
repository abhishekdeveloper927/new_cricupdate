import 'dart:async';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../util/app_constants.dart';
import '../api/api_client.dart';

class SubscriptionRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  SubscriptionRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getSubscriptionList() async {
    return await apiClient.getData(
      AppConstants.allSubscriptionUri,
    );
  }

  Future<Response> getMySubscription({required int userId}) async {
    return await apiClient.getData(
      "${AppConstants.activeSubscriptionUri}/$userId",
    );
  }

  Future<Response> buySubscription({
    required int userId,
    required int planId,
    required String transactionId,
  }) async {
    return await apiClient.postData(AppConstants.buySubscriptionUri, {
      "user_id": userId,
      "subscription_plan_id": planId,
      "transaction_id": transactionId
    });
  }
}

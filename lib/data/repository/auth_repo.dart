import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:cricupdate/data/model/body/winning_prediction_body.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../util/app_constants.dart';
import '../api/api_client.dart';
import '../model/body/login_body.dart';
import '../model/body/register_body.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<bool> saveUserToken(String token) async {
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.token, token);
  }

  Future<Response> login(LoginBody loginBody) async {
    log(jsonEncode(loginBody));
    return await apiClient.postData(AppConstants.loginUri, loginBody.toJson());
  }

  Future<Response> winningPrediction(
      WinningPredictionBody winningPredictionBody) async {
    log(jsonEncode(winningPredictionBody));
    return await apiClient.postData(
        AppConstants.winningPredictionUri, winningPredictionBody.toJson());
  }

  Future<Response> updateFcmToken({
    required String fcmToken,
    required String deviceId,
  }) async {
    return await apiClient.postData(AppConstants.fcmTokenUri,
        {"fcm_token": fcmToken, "device_id": deviceId});
  }

  Future<Response> getProfile() async {
    return await apiClient.getData(
      AppConstants.getProfileUri,
    );
  }

  Future<Response> updateProfile(RegisterBody registerBody) async {
    return await apiClient.putData(
        AppConstants.updateProfileUri, registerBody.toJson());
  }

  Future<Response> getConfigData() async {
    return await apiClient.getData(
      AppConstants.configUri,
    );
  }

  Future<Response> register(RegisterBody registerBody) async {
    log(jsonEncode(registerBody));
    return await apiClient.postData(
        AppConstants.registerUri, registerBody.toJson());
  }

  String getUserToken() {
    return sharedPreferences.getString(AppConstants.token) ?? "";
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.token);
  }

  Future<bool> clearSharedData() async {
    await sharedPreferences.remove(AppConstants.token);
    apiClient.updateHeader(null);
    return true;
  }
}

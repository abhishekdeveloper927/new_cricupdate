import 'dart:convert';
import 'dart:developer';

import 'package:cricupdate/data/model/body/winning_prediction_body.dart';
import 'package:cricupdate/data/model/response/auth_model.dart';
import 'package:cricupdate/data/model/response/confirg_model.dart';
import 'package:cricupdate/data/model/response/user_model.dart';
import 'package:cricupdate/data/model/response/winning_prediction_model.dart';
import 'package:get/get.dart';

import '../data/api/api_checker.dart';
import '../data/model/base/response_model.dart';
import '../data/model/body/login_body.dart';
import '../data/model/body/register_body.dart';
import '../data/repository/auth_repo.dart';
import '../view/base/show_snackbar.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  bool isLoading = false;
  bool mechanicFetched = false;
  bool selectTime = false;
  int selectedIndex = 0;
  int selectedJob = 0;
  String newMessage = '';
  String entityToken = "6b2854045f64a3afa49ae2be7e3b9e41";
  AuthModel? authModel;
  int selectedTime = 0;
  UserModel? userModel;
  ConfigModel? configModel;
  WinningPredictionModel? winningPredictionModel;
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now();

  void updateIndex(int index) {
    selectedIndex = index;
    update();
  }

  void updateJob(int index) {
    selectedJob = index;
    update();
  }

  void updateTime(int index) {
    selectedTime = index;
    update();
  }

  Future<ResponseModel> login(LoginBody loginBody) async {
    isLoading = true;
    update();
    Response response = await authRepo.login(loginBody);
    log(jsonEncode(response.body));
    log(jsonEncode(response.statusCode));
    ResponseModel responseModel = await checkResponseModel(response);
    showCustomSnackBar(responseModel.message, isError: !responseModel.status);
    log(jsonEncode(response.statusCode));
    if (responseModel.status) {
      userModel = UserModel.fromJson(responseModel.data['user']);
      authRepo.saveUserToken(responseModel.data['token']);
    }
    isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> getWinningPrediction(
      WinningPredictionBody winningPredictionBody) async {
    isLoading = true;
    update();
    Response response = await authRepo.winningPrediction(winningPredictionBody);
    ResponseModel responseModel = await checkResponseModel(response);
    log(jsonEncode(response.statusCode));
    if (responseModel.status) {
      winningPredictionModel =
          WinningPredictionModel.fromJson(responseModel.data);
      print(winningPredictionModel);
    }
    isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> updateFcmToken({
    required String fcmToken,
    required String deviceId,
  }) async {
    isLoading = true;
    update();
    Response response =
        await authRepo.updateFcmToken(fcmToken: fcmToken, deviceId: deviceId);
    log(jsonEncode(response.body));
    log(jsonEncode(response.statusCode));
    ResponseModel responseModel = await checkResponseModel(response);
    log(jsonEncode(response.statusCode));
    if (responseModel.status) {}
    isLoading = false;
    update();
    return responseModel;
  }

  /*Future<ResponseModel> authToken() async {
    isLoading = true;
    update();
    Response response = await authRepo.authToken();
    ResponseModel responseModel = await checkResponseModel(response);
    if (response.statusCode == 200) {
      roanuzApiToken = response.body["data"]["token"];
    }
    isLoading = false;
    update();
    return responseModel;
  }*/
/*
  Future<void> authToken() async {
    isLoading = true;
    final response = await http.post(
        Uri.parse(AppConstants.cricketBaseUri + AppConstants.authUri),
        body: {
          "access_key": AppConstants.accessKey,
          "secret_key": AppConstants.secretKey
        });
    if (response.statusCode == 200) {
      isLoading = false;
      authModel = authModelFromJson(response.body);
      if (authModel != null) {
        if (authModel!.response != null) {
          entityToken = authModel!.response!.token;
        }
      }
    } else {
      isLoading = false;
      // Handle errors appropriately
      throw Exception('Failed to load cricket data');
    }
    update();
  }*/

  Future<ResponseModel> getProfile() async {
    userModel = null;
    isLoading = true;
    update();
    Response response = await authRepo.getProfile();
    log(jsonEncode(response.body));
    log(jsonEncode(response.statusCode));
    ResponseModel responseModel = await checkResponseModel(response);
    log(jsonEncode(response.statusCode));
    if (responseModel.status) {
      userModel = UserModel.fromJson(responseModel.data);
    }
    isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> updateProfile(RegisterBody registerBody) async {
    userModel = null;
    isLoading = true;
    update();
    Response response = await authRepo.updateProfile(registerBody);
    log(jsonEncode(response.body));
    log(jsonEncode(response.statusCode));
    ResponseModel responseModel = await checkResponseModel(response);
    log(jsonEncode(response.statusCode));
    if (responseModel.status) {
      showCustomSnackBar(
        responseModel.message,
      );
      getProfile();
    }
    isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> getConfigData() async {
    configModel = null;
    isLoading = true;
    update();
    Response response = await authRepo.getConfigData();
    log(jsonEncode(response.body));
    log(jsonEncode(response.statusCode));
    ResponseModel responseModel = await checkResponseModel(response);
    log(jsonEncode(response.statusCode));
    if (responseModel.status) {
      configModel = ConfigModel.fromJson(responseModel.data);
    }
    isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> register(RegisterBody registerBody) async {
    isLoading = true;
    update();
    Response response = await authRepo.register(registerBody);
    log(jsonEncode(response.body));
    log(jsonEncode(response.statusCode));
    ResponseModel responseModel = await checkResponseModel(response);
    showCustomSnackBar(responseModel.message, isError: !responseModel.status);
    log(jsonEncode(response.statusCode));
    if (responseModel.status) {
      userModel = UserModel.fromJson(responseModel.data['user']);
      authRepo.saveUserToken(responseModel.data['token']);
    }
    isLoading = false;
    update();
    return responseModel;
  }

  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }

  Future<bool> clearSharedData() async {
    return await authRepo.clearSharedData();
  }

  String getUserToken() {
    return authRepo.getUserToken();
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:cricupdate/data/model/response/active_subscription_model.dart';
import 'package:get/get.dart';

import '../data/api/api_checker.dart';
import '../data/model/base/response_model.dart';
import '../data/model/response/subscription_model.dart';
import '../data/repository/subscription_repo.dart';
import '../view/base/show_snackbar.dart';

class SubscriptionController extends GetxController implements GetxService {
  final SubscriptionRepo subscriptionRepo;

  SubscriptionController({required this.subscriptionRepo});

  bool isLoading = false;
  List<SubscriptionModel> subscriptionList = [];
  ActiveSubscriptionModel? activeSubscriptionModel;

  Future<ResponseModel> getSubscriptionList() async {
    isLoading = true;
    update();
    Response response = await subscriptionRepo.getSubscriptionList();
    log(jsonEncode(response.body));
    log(jsonEncode(response.statusCode));
    ResponseModel responseModel = await checkResponseModel(response);
    showCustomSnackBar(responseModel.message, isError: !responseModel.status);
    log(jsonEncode(response.statusCode));
    if (responseModel.status) {
      subscriptionList =
          subscriptionModelFromJson(jsonEncode(responseModel.data));
    }
    isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> getMySubscription({required int userId}) async {
    isLoading = true;
    update();
    Response response =
        await subscriptionRepo.getMySubscription(userId: userId);
    log(jsonEncode(response.body));
    log(jsonEncode(response.statusCode));
    ResponseModel responseModel = await checkResponseModel(response);
    log(jsonEncode(response.statusCode));
    if (responseModel.status) {
      activeSubscriptionModel =
          ActiveSubscriptionModel.fromJson(responseModel.data);
    }
    isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> buySubscription({
    required int userId,
    required int planId,
    required String transactionId,
  }) async {
    isLoading = true;
    update();
    Response response = await subscriptionRepo.buySubscription(
        userId: userId, planId: planId, transactionId: transactionId);

    ResponseModel responseModel = await checkResponseModel(response);
    if (responseModel.status) {
      getMySubscription(userId: userId);
    }
    isLoading = false;
    update();
    return responseModel;
  }
}

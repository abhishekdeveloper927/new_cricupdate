import 'dart:convert';
import 'dart:developer';

import 'package:cricupdate/data/model/response/video_model.dart';
import 'package:cricupdate/data/repository/videos_repo.dart';
import 'package:get/get.dart';

import '../data/api/api_checker.dart';
import '../data/model/base/response_model.dart';

class VideosController extends GetxController implements GetxService {
  final VideosRepo videosRepo;

  VideosController({required this.videosRepo});

  bool isLoading = false;
  List<VideoModel> videoList = [];
  List<VideoModel> shortsList = [];
  List<VideoModel> featuredVideoList = [];

  Future<ResponseModel> getVideoList() async {
    videoList.clear();
    isLoading = true;
    update();
    Response response = await videosRepo.getVideoList();
    log(jsonEncode(response.body));
    log(jsonEncode(response.statusCode));
    ResponseModel responseModel = await checkResponseModel(response);
    log(jsonEncode(response.statusCode));
    if (responseModel.status) {
      videoList = videoModelFromJson(jsonEncode(responseModel.data));
    }
    isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> getShortsList() async {
    shortsList.clear();
    isLoading = true;
    update();
    Response response = await videosRepo.getShortsList();
    log(jsonEncode(response.body));
    log(jsonEncode(response.statusCode));
    ResponseModel responseModel = await checkResponseModel(response);
    log(jsonEncode(response.statusCode));
    if (responseModel.status) {
      shortsList = videoModelFromJson(jsonEncode(responseModel.data));
    }
    isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> getFeaturedVideoList() async {
    featuredVideoList.clear();
    isLoading = true;
    update();
    Response response = await videosRepo.getFeaturedVideoList();
    log(jsonEncode(response.body));
    log(jsonEncode(response.statusCode));
    ResponseModel responseModel = await checkResponseModel(response);
    log(jsonEncode(response.statusCode));
    if (responseModel.status) {
      featuredVideoList = videoModelFromJson(jsonEncode(responseModel.data));
    }
    isLoading = false;
    update();
    return responseModel;
  }
}

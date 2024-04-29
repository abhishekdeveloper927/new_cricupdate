import 'dart:convert';
import 'dart:developer';

import 'package:cricupdate/data/model/response/banner_model.dart';
import 'package:cricupdate/data/model/response/category_model.dart';
import 'package:cricupdate/data/model/response/photos_model.dart';
import 'package:cricupdate/data/model/response/tournament_banner_model.dart';
import 'package:get/get.dart';

import '../data/api/api_checker.dart';
import '../data/model/base/response_model.dart';
import '../data/model/response/news_model.dart';
import '../data/repository/news_repo.dart';
import '../view/base/show_snackbar.dart';

class NewsController extends GetxController implements GetxService {
  final NewsRepo newsRepo;

  NewsController({required this.newsRepo});

  bool isLoading = false;
  NewsModel? newsModel;
  List<NewsModel> newsList = [];
  List<CategoryModel> categoryList = [];
  List<BannerModel> bannerList = [];
  List<TournamentBannerModel> tournamentBannerList = [];
  List<PhotosModel> photosList = [];
  int? selectedCategory;

  int? selectedCategory2;

  void updateSelectedCategory(int index) {
    selectedCategory = index;
    update();
  }

  void clearSelectedCategory() {
    selectedCategory = null;
    update();
  }

  void updateSelectedCategory2(int index) {
    selectedCategory2 = index;
    update();
  }

  void clearSelectedCategory2() {
    selectedCategory2 = null;
    update();
  }

  Future<ResponseModel> getNewsList({required String categoryId}) async {
    newsList.clear();
    isLoading = true;
    update();
    Response response = await newsRepo.getNewsList(categoryId: categoryId);
    log(jsonEncode(response.body));
    log(jsonEncode(response.statusCode));
    ResponseModel responseModel = await checkResponseModel(response);
    log(jsonEncode(response.statusCode));
    if (responseModel.status) {
      newsList = newsModelFromJson(jsonEncode(responseModel.data));
    }
    isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> getCategoryList() async {
    categoryList.clear();
    isLoading = true;
    update();
    Response response = await newsRepo.getCategoryList();
    log(jsonEncode(response.body));
    log(jsonEncode(response.statusCode));
    ResponseModel responseModel = await checkResponseModel(response);
    log(jsonEncode(response.statusCode));
    if (responseModel.status) {
      categoryList = categoryModelFromJson(jsonEncode(responseModel.data));
    }
    isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> getBannerList() async {
    bannerList.clear();
    isLoading = true;
    update();
    Response response = await newsRepo.getBannerList();
    log(jsonEncode(response.body));
    log(jsonEncode(response.statusCode));
    ResponseModel responseModel = await checkResponseModel(response);
    log(jsonEncode(response.statusCode));
    if (responseModel.status) {
      bannerList = bannerModelFromJson(jsonEncode(responseModel.data));
    }
    isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> getTournamentBannerList() async {
    tournamentBannerList.clear();
    isLoading = true;
    update();
    Response response = await newsRepo.getTournamentBannerList();
    log(jsonEncode(response.body));
    log(jsonEncode(response.statusCode));
    ResponseModel responseModel = await checkResponseModel(response);
    log(jsonEncode(response.statusCode));
    if (responseModel.status) {
      tournamentBannerList =
          tournamentBannerModelFromJson(jsonEncode(responseModel.data));
    }
    isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> getNewsById({required String id}) async {
    isLoading = true;
    update();
    Response response = await newsRepo.getNewsById(id: id);
    log(jsonEncode(response.body));
    log(jsonEncode(response.statusCode));
    ResponseModel responseModel = await checkResponseModel(response);
    showCustomSnackBar(responseModel.message, isError: !responseModel.status);
    log(jsonEncode(response.statusCode));
    if (responseModel.status) {
      newsModel = NewsModel.fromJson(responseModel.data);
    }
    isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> getPhotosById({required String categoryId}) async {
    photosList.clear();
    isLoading = true;
    update();
    Response response = await newsRepo.getPhotosById(categoryId: categoryId);
    log(jsonEncode(response.body));
    log(jsonEncode(response.statusCode));
    ResponseModel responseModel = await checkResponseModel(response);
    log(jsonEncode(response.statusCode));
    if (responseModel.status) {
      photosList = photosModelFromJson(jsonEncode(responseModel.data));
    }
    isLoading = false;
    update();
    return responseModel;
  }
}

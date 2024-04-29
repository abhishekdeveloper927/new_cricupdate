import 'package:cricupdate/data/model/response/news_model.dart';
import 'package:cricupdate/view/screen/news/widget/news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../controller/news_controller.dart';
import '../../../util/dimensions.dart';
import '../../base/loader.dart';

class NewsScreen extends StatefulWidget {
  final VoidCallback onScreenHideButtonPressed;

  const NewsScreen({Key? key, required this.onScreenHideButtonPressed})
      : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<NewsModel> newsList = [];
  List<NewsModel> internationalNewsList = [];
  List<NewsModel> domesticNewsList = [];

  bool isReverse = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadData();
    });
    super.initState();
  }

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await loadData();
    _refreshController.refreshCompleted();
  }

  Future<void> loadData() async {
    await Get.find<NewsController>().getCategoryList();
    await Get.find<NewsController>().getNewsList(
        categoryId: "${Get.find<NewsController>().selectedCategory ?? ""}");
  }

  void _onLoading() async {
    await loadMoreData();
    _refreshController.loadComplete();
  }

  Future<void> loadMoreData() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Get.theme.primaryColor,
          title: Text(
            "News",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.fontSizeLarge),
          ),
        ),
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        body: GetBuilder<NewsController>(
          builder: (newsController) {
            if (newsController.isLoading) {
              return const Loader();
            }
            return Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        InkWell(
                          onTap: () {
                            newsController.clearSelectedCategory();

                            Get.find<NewsController>()
                                .getNewsList(categoryId: '');
                            setState(() {});
                          },
                          child: Container(
                            padding: const EdgeInsets.all(
                                Dimensions.paddingSizeDefault),
                            margin: const EdgeInsets.only(
                                right: Dimensions.paddingSizeDefault),
                            decoration: BoxDecoration(
                                color: newsController.selectedCategory == null
                                    ? Get.theme.primaryColor
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radiusDefault)),
                            child: Center(
                              child: Text(
                                "All",
                                style: TextStyle(
                                    color:
                                        newsController.selectedCategory == null
                                            ? Colors.white
                                            : Colors.black,
                                    fontSize: Dimensions.fontSizeDefault,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: newsController.categoryList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  newsController.updateSelectedCategory(index);
                                  setState(() {});
                                  newsController.getNewsList(
                                      categoryId: newsController
                                          .selectedCategory
                                          .toString());
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(
                                      Dimensions.paddingSizeDefault),
                                  margin: const EdgeInsets.only(
                                      right: Dimensions.paddingSizeDefault),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              newsController.selectedCategory ==
                                                      index
                                                  ? Colors.transparent
                                                  : Colors.black),
                                      color: newsController.selectedCategory ==
                                              index
                                          ? Get.theme.primaryColor
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radiusDefault)),
                                  child: Center(
                                    child: Text(
                                      newsController.categoryList[index].name ??
                                          "",
                                      style: TextStyle(
                                          color:
                                              newsController.selectedCategory ==
                                                      index
                                                  ? Colors.white
                                                  : Colors.black,
                                          fontSize: Dimensions.fontSizeDefault,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeDefault,
                  ),
                  newsController.newsList.isNotEmpty
                      ? Expanded(
                          child: SmartRefresher(
                          enablePullDown: true,
                          enablePullUp: false,
                          header: const WaterDropHeader(),
                          controller: _refreshController,
                          onRefresh: _onRefresh,
                          onLoading: _onLoading,
                          child: ListView.builder(
                              itemCount: newsController.newsList.length,
                              itemBuilder: (context, index) {
                                return NewsCard(
                                    newsModel: newsController.newsList[index]);
                              }),
                        ))
                      : Center(
                          child: Text(
                            "No News Found",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.fontSizeLarge),
                          ),
                        ),
                ],
              ),
            );
          },
        ));
  }
}

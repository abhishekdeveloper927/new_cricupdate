import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../controller/news_controller.dart';
import '../../../data/model/response/photos_model.dart';
import '../../../util/dimensions.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  List<PhotosModel> photosList = [];
  List<PhotosModel> iplPhotosList = [];
  List<PhotosModel> internationalPhotosList = [];
  List<PhotosModel> worldCupPhotosList = [];
  List<PhotosModel> ashesPhotosList = [];

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
    await Get.find<NewsController>().getPhotosById(
        categoryId: "${Get.find<NewsController>().selectedCategory2 ?? ''}");
    await Get.find<NewsController>().getCategoryList();
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
            "Photos",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.fontSizeLarge),
          ),
        ),
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: false,
          header: const WaterDropHeader(),
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: GetBuilder<NewsController>(
            builder: (newsController) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          InkWell(
                            onTap: () {
                              newsController.clearSelectedCategory2();

                              Get.find<NewsController>()
                                  .getPhotosById(categoryId: '');
                              setState(() {});
                            },
                            child: Container(
                              padding: const EdgeInsets.all(
                                  Dimensions.paddingSizeDefault),
                              margin: const EdgeInsets.only(
                                  right: Dimensions.paddingSizeDefault),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: newsController.selectedCategory2 ==
                                              null
                                          ? Colors.transparent
                                          : Colors.black),
                                  color:
                                      newsController.selectedCategory2 == null
                                          ? Get.theme.primaryColor
                                          : Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radiusDefault)),
                              child: Center(
                                child: Text(
                                  "All",
                                  style: TextStyle(
                                      color: newsController.selectedCategory2 ==
                                              null
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
                                    newsController
                                        .updateSelectedCategory2(index);
                                    setState(() {});
                                    newsController.getPhotosById(
                                        categoryId: newsController
                                            .selectedCategory2
                                            .toString());
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(
                                        Dimensions.paddingSizeDefault),
                                    margin: const EdgeInsets.only(
                                        right: Dimensions.paddingSizeDefault),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: newsController
                                                        .selectedCategory2 ==
                                                    index
                                                ? Colors.transparent
                                                : Colors.black),
                                        color:
                                            newsController.selectedCategory2 ==
                                                    index
                                                ? Get.theme.primaryColor
                                                : Colors.white,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radiusDefault)),
                                    child: Center(
                                      child: Text(
                                        newsController
                                                .categoryList[index].name ??
                                            "",
                                        style: TextStyle(
                                            color: newsController
                                                        .selectedCategory2 ==
                                                    index
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize:
                                                Dimensions.fontSizeDefault,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: newsController.photosList.isNotEmpty
                          ? Dimensions.paddingSizeDefault
                          : 100,
                    ),
                    newsController.photosList.isNotEmpty
                        ? Expanded(
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: newsController.photosList.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    final imageProvider = Image.network(
                                            newsController
                                                .photosList[index].image!)
                                        .image;
                                    showImageViewer(context, imageProvider,
                                        onViewerDismissed: () {});
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(
                                          Dimensions.paddingSizeSmall),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radiusDefault)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radiusDefault),
                                        child: Image.network(
                                          newsController
                                              .photosList[index].image!,
                                          height: 100,
                                          width: Get.width,
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                );
                              },
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1.4,
                                      mainAxisSpacing: 16,
                                      crossAxisSpacing: 16),
                            ),
                          )
                        : Center(
                            child: Text(
                              "No Data Found",
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
          ),
        ));
  }
}

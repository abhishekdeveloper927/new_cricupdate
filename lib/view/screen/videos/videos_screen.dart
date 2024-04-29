import 'package:cricupdate/view/screen/videos/widget/shorts_card.dart';
import 'package:cricupdate/view/screen/videos/widget/video_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../controller/videos_controller.dart';
import '../../../util/dimensions.dart';
import '../../base/loader.dart';

class VideosScreen extends StatefulWidget {
  final VoidCallback onScreenHideButtonPressed;

  const VideosScreen({Key? key, required this.onScreenHideButtonPressed})
      : super(key: key);

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
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
    await Get.find<VideosController>().getVideoList();
    await Get.find<VideosController>().getShortsList();
  }

  void _onLoading() async {
    await loadMoreData();
    _refreshController.loadComplete();
  }

  Future<void> loadMoreData() async {}

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Get.theme.primaryColor,
          title: Text(
            "Videos",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.fontSizeLarge),
          ),
          bottom: const TabBar(
            unselectedLabelColor: Colors.white,
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: "Videos",
              ),
              Tab(
                text: "Shorts",
              ),
            ],
          ),
        ),
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        body: TabBarView(
          children: [
            GetBuilder<VideosController>(builder: (videosController) {
              if (videosController.isLoading) {
                return const Loader();
              }
              if (videosController.videoList.isEmpty) {
                return Center(
                  child: Text(
                    "No Data Found",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimensions.fontSizeLarge,
                        fontWeight: FontWeight.bold),
                  ),
                );
              }
              return SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: false,
                  header: const WaterDropHeader(),
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                  onLoading: _onLoading,
                  child: ListView.builder(
                      padding:
                          const EdgeInsets.all(Dimensions.paddingSizeDefault),
                      itemCount: videosController.videoList.length,
                      itemBuilder: (context, index) {
                        return VideoCard(
                            videoModel: videosController.videoList[index]);
                      }));
            }),
            GetBuilder<VideosController>(builder: (videosController) {
              if (videosController.isLoading) {
                return const Loader();
              }
              if (videosController.shortsList.isEmpty) {
                return Center(
                  child: Text(
                    "No Data Found",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimensions.fontSizeLarge,
                        fontWeight: FontWeight.bold),
                  ),
                );
              }
              return PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: videosController.shortsList.length,
                  itemBuilder: (context, index) {
                    return ShortsCard(
                        videoModel: videosController.shortsList[index]);
                  });
            }),
          ],
        ),
      ),
    );
  }
}

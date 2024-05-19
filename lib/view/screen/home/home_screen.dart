import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cricupdate/controller/auth_controller.dart';
import 'package:cricupdate/controller/news_controller.dart';
import 'package:cricupdate/controller/videos_controller.dart';
import 'package:cricupdate/data/model/response/match_model.dart';
import 'package:cricupdate/helper/ad_helper.dart';
import 'package:cricupdate/util/images.dart';
import 'package:cricupdate/view/screen/matches/widget/live_match_card.dart';
import 'package:cricupdate/view/screen/matches/widget/match_card.dart';
import 'package:cricupdate/view/screen/news/news_screen.dart';
import 'package:cricupdate/view/screen/subscription/subscription_screen.dart';
import 'package:cricupdate/view/screen/videos/widget/featured_video_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controller/all_matches_controller.dart';
import '../../../util/dimensions.dart';
import '../../base/loader.dart';
import '../competition/competition_screen.dart';
import '../news/news_details_screen.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onScreenHideButtonPressed;

  const HomeScreen({Key? key, required this.onScreenHideButtonPressed})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BannerAd? bannerAd;
  bool isLoaded = false;
  int currentIndex = 0;
  int currentIndex1 = 0;
  List<MatchModel> matchList = [];
  CarouselController controller = CarouselController();
  CarouselController controller1 = CarouselController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadData();
    });
    loadAd();
    super.initState();
  }

  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();

  void startImageChange() {
    const duration = Duration(seconds: 5); // Change image every 3 seconds

    Timer.periodic(duration, (Timer timer) {
      // Change the image without sliding animation
      int nextIndex = (_currentIndex + 1) %
          Get.find<NewsController>().tournamentBannerList.length;
      _carouselController.jumpToPage(nextIndex);
      setState(() {
        _currentIndex = nextIndex;
      });
    });
  }

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await loadData();
    _refreshController.refreshCompleted();
  }

  Future<void> loadData() async {
    await Get.find<NewsController>().getCategoryList();
    await Get.find<NewsController>().getBannerList();
    await Get.find<NewsController>().getTournamentBannerList().then((value) {
      if (value.status) {
        startImageChange();
      }
    });
    await Get.find<NewsController>().getNewsList(categoryId: '');
    await Get.find<VideosController>().getFeaturedVideoList();
    await Get.find<AllMatchesController>().getAllMatches(
        token: Get.find<AuthController>().entityToken, status: 3);
    await Get.find<AllMatchesController>().getAllMatches(
        token: Get.find<AuthController>().entityToken, status: 1);
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
          backgroundColor: Get.theme.primaryColor,
          title: Image.asset(
            Images.logo4,
            height: 150,
          ),
          actions: [
            InkWell(
              onTap: () {
                Get.to(() => const SubscriptionScreen());
              },
              child: Container(
                margin: EdgeInsets.all(Dimensions.paddingSizeDefault),
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Text(
                  "Get Premium",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            /* InkWell(
              onTap: () {
                Get.to(() => const SubscriptionScreen());
              },
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                child: Image.asset(
                  Images.crown,
                  color: Colors.yellow,
                ),
              ),
            ),*/
          ],
        ),
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        body: GetBuilder<VideosController>(
          builder: (videosController) {
            return GetBuilder<NewsController>(
              builder: (newsController) {
                if (newsController.isLoading) {
                  return const Loader();
                }
                if (videosController.isLoading) {
                  return const Loader();
                }
                return SmartRefresher(
                    enablePullDown: true,
                    enablePullUp: false,
                    header: const WaterDropHeader(),
                    controller: _refreshController,
                    onRefresh: _onRefresh,
                    onLoading: _onLoading,
                    child: ListView(
                      children: [
                        Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                      color: Get.theme.primaryColor),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            newsController
                                                .updateSelectedHome(0);
                                          },
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Home",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: Dimensions
                                                        .fontSizeLarge,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              newsController.selectedHome == 0
                                                  ? Container(
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius
                                                              .circular(Dimensions
                                                                  .radiusDefault)),
                                                      padding:
                                                          EdgeInsets.all(1),
                                                    )
                                                  : SizedBox()
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: Dimensions.paddingSizeDefault,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            newsController
                                                .updateSelectedHome(1);
                                          },
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Live",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: Dimensions
                                                        .fontSizeLarge,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              newsController.selectedHome == 1
                                                  ? Container(
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius
                                                              .circular(Dimensions
                                                                  .radiusDefault)),
                                                      padding:
                                                          EdgeInsets.all(1),
                                                    )
                                                  : SizedBox()
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 200,
                                ),
                              ],
                            ),
                            GetBuilder<AllMatchesController>(
                                builder: (matchesController) {
                              if (matchesController.isLoading) {
                                return const Loader();
                              }
                              return matchesController.liveMatchList.isNotEmpty
                                  ? Positioned(
                                      left: 0,
                                      right: 0,
                                      top: 50,
                                      child: Column(
                                        children: [
                                          CarouselSlider(
                                            options: CarouselOptions(
                                                aspectRatio: 1.5,
                                                viewportFraction: 0.95,
                                                initialPage: 0,
                                                enableInfiniteScroll: true,
                                                reverse: false,
                                                autoPlay: false,
                                                onPageChanged: (index, reason) {
                                                  setState(() {});
                                                  currentIndex = index;
                                                },
                                                autoPlayInterval:
                                                    const Duration(seconds: 3),
                                                autoPlayAnimationDuration:
                                                    const Duration(
                                                        milliseconds: 800),
                                                autoPlayCurve:
                                                    Curves.fastOutSlowIn,
                                                enlargeCenterPage: false,
                                                enlargeFactor: 0.3,
                                                scrollDirection:
                                                    Axis.horizontal),
                                            items: matchesController
                                                .liveMatchList
                                                .map((i) {
                                              return Builder(
                                                builder:
                                                    (BuildContext context) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 16,
                                                            left: 16),
                                                    child: LiveMatchCard(
                                                        margin: true,
                                                        matchModel: i),
                                                  );
                                                },
                                              );
                                            }).toList(),
                                          ),
                                          SizedBox(
                                            height: Dimensions.paddingSizeSmall,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: matchesController
                                                .liveMatchList
                                                .asMap()
                                                .entries
                                                .map((entry) {
                                              return GestureDetector(
                                                onTap: () => controller
                                                    .animateToPage(entry.key),
                                                child: Container(
                                                  padding: EdgeInsets.all(2),
                                                  width: 12.0,
                                                  height: 12.0,
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 4.0),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                      shape: BoxShape.circle,
                                                      color: currentIndex ==
                                                              entry.key
                                                          ? Colors.grey
                                                          : Get.theme
                                                              .scaffoldBackgroundColor),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ],
                                      ),
                                    )
                                  : matchesController
                                          .upcomingMatchList.isNotEmpty
                                      ? Positioned(
                                          left: 0,
                                          right: 0,
                                          top: 50,
                                          child: Column(
                                            children: [
                                              CarouselSlider(
                                                options: CarouselOptions(
                                                    aspectRatio: 1.4,
                                                    viewportFraction: 0.95,
                                                    initialPage: 0,
                                                    enableInfiniteScroll: true,
                                                    reverse: false,
                                                    autoPlay: false,
                                                    onPageChanged:
                                                        (index, reason) {
                                                      setState(() {});
                                                      currentIndex1 = index;
                                                    },
                                                    autoPlayInterval:
                                                        const Duration(
                                                            seconds: 3),
                                                    autoPlayAnimationDuration:
                                                        const Duration(
                                                            milliseconds: 800),
                                                    autoPlayCurve:
                                                        Curves.fastOutSlowIn,
                                                    enlargeCenterPage: false,
                                                    enlargeFactor: 0.3,
                                                    scrollDirection:
                                                        Axis.horizontal),
                                                items: matchesController
                                                    .upcomingMatchList
                                                    .map((i) {
                                                  return Builder(
                                                    builder:
                                                        (BuildContext context) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 16,
                                                                left: 16),
                                                        child: MatchCard(
                                                            matchModel: i),
                                                      );
                                                    },
                                                  );
                                                }).toList(),
                                              ),
                                              SizedBox(
                                                height:
                                                    Dimensions.paddingSizeSmall,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: matchesController
                                                    .upcomingMatchList
                                                    .asMap()
                                                    .entries
                                                    .map((entry) {
                                                  return GestureDetector(
                                                    onTap: () => controller
                                                        .animateToPage(
                                                            entry.key),
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(2),
                                                      width: 12.0,
                                                      height: 12.0,
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 8.0,
                                                              horizontal: 4.0),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Colors.grey),
                                                          shape:
                                                              BoxShape.circle,
                                                          color: currentIndex1 ==
                                                                  entry.key
                                                              ? Colors.grey
                                                              : Get.theme
                                                                  .scaffoldBackgroundColor),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Center(
                                          child: Text(
                                            "No data found",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize:
                                                    Dimensions.fontSizeLarge,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        );
                            }),
                          ],
                        ),
                        newsController.selectedHome == 0
                            ? Container(
                                padding: EdgeInsets.all(
                                    Dimensions.paddingSizeDefault),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: Dimensions.paddingSizeDefault,
                                    ),
                                    newsController.bannerList.isNotEmpty
                                        ? CarouselSlider(
                                            options: CarouselOptions(
                                                aspectRatio: 18 / 8,
                                                viewportFraction: 0.8,
                                                initialPage: 0,
                                                enableInfiniteScroll: true,
                                                reverse: false,
                                                autoPlay: true,
                                                autoPlayInterval:
                                                    const Duration(seconds: 3),
                                                autoPlayAnimationDuration:
                                                    const Duration(
                                                        milliseconds: 800),
                                                autoPlayCurve:
                                                    Curves.fastOutSlowIn,
                                                enlargeCenterPage: true,
                                                enlargeFactor: 0.3,
                                                scrollDirection:
                                                    Axis.horizontal),
                                            items: newsController.bannerList
                                                .map((i) {
                                              return Builder(
                                                builder:
                                                    (BuildContext context) {
                                                  return InkWell(
                                                    onTap: () {
                                                      if (i.link != null) {
                                                        urlLaunch(
                                                            Uri.parse(i.link!));
                                                      }
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius
                                                          .circular(Dimensions
                                                              .radiusDefault),
                                                      child: Image.network(
                                                        i.image ?? "",
                                                        fit: BoxFit.cover,
                                                        width: Get.width,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            }).toList(),
                                          )
                                        : Center(
                                            child: Text(
                                              "No Data Found",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      Dimensions.fontSizeLarge),
                                            ),
                                          ),
                                    const SizedBox(
                                      height: Dimensions.paddingSizeDefault,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => const CompetitionScreen());
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Featured Tournament",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize:
                                                    Dimensions.fontSizeLarge),
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Colors.black,
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: Dimensions.paddingSizeDefault,
                                    ),
                                    newsController
                                            .tournamentBannerList.isNotEmpty
                                        ? CarouselSlider(
                                            carouselController:
                                                _carouselController,
                                            options: CarouselOptions(
                                              height: 90.0,
                                              viewportFraction: 1,
                                              enableInfiniteScroll: false,
                                              scrollPhysics:
                                                  const NeverScrollableScrollPhysics(),
                                              enlargeCenterPage: true,
                                              onPageChanged: (index, reason) {
                                                setState(() {
                                                  _currentIndex = index;
                                                });
                                              },
                                            ),
                                            items: newsController
                                                .tournamentBannerList
                                                .map((i) {
                                              return Builder(
                                                builder:
                                                    (BuildContext context) {
                                                  return InkWell(
                                                    onTap: () {
                                                      Get.to(() =>
                                                          const CompetitionScreen());
                                                    },
                                                    child: Container(
                                                        width: Get.width,
                                                        margin: const EdgeInsets
                                                            .symmetric(
                                                          horizontal: 5.0,
                                                        ),
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          child: Image.network(
                                                            i.image!,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        )),
                                                  );
                                                },
                                              );
                                            }).toList(),
                                          )
                                        : const SizedBox(),

                                    /*  Text(
                                                          "Matches",
                                                          style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize: Dimensions.fontSizeLarge),
                                                        ),
                                                        const SizedBox(
                                                          height: Dimensions.paddingSizeDefault,
                                                        ),
                                                        GetBuilder<AllMatchesController>(
                                                            builder: (matchesController) {
                                                          if (matchesController.isLoading) {
                                                            return const Loader();
                                                          }
                                                          return matchesController.liveMatchList.isNotEmpty
                                                                  ? SizedBox(
                                                                      height: Get.height / 3 + 10,
                                                                      child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: matchesController
                                          .liveMatchList.length,
                                      physics: const ScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(right: 16),
                                          child: LiveMatchCard(
                                              width: Get.width - 70,
                                              matchModel: matchesController
                                                  .liveMatchList[index]),
                                        );
                                      }))
                                                                  : matchesController.upcomingMatchList.isNotEmpty
                                                                      ? SizedBox(
                                      height: Get.height / 3 + 10,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: matchesController
                                              .upcomingMatchList.length,
                                          physics: const ScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 16),
                                              child: MatchCard(
                                                  width: Get.width - 70,
                                                  matchModel: matchesController
                                                          .upcomingMatchList[
                                                      index]),
                                            );
                                          }))
                                                                      : Center(
                                      child: Text(
                                        "No data found",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: Dimensions.fontSizeLarge,
                                            fontWeight: FontWeight.bold),
                                      ),
                                                                        );
                                                        }),
                                                        const SizedBox(
                                                          height: Dimensions.paddingSizeDefault,
                                                        ),*/
                                    const SizedBox(
                                      height: Dimensions.paddingSizeDefault,
                                    ),
                                    /*  bannerAd != null
                                                            ? Align(
                                                                    alignment: Alignment.bottomCenter,
                                                                    child: SafeArea(
                                                                      child: SizedBox(
                                                                        width: bannerAd!.size.width.toDouble(),
                                                                        height: bannerAd!.size.height.toDouble(),
                                                                        child: AdWidget(ad: bannerAd!),
                                                                      ),
                                                                    ),
                                                                  )
                                                            : const SizedBox(),*/
                                    SizedBox(
                                      height: bannerAd != null
                                          ? Dimensions.paddingSizeDefault
                                          : 0,
                                    ),
                                    Text(
                                      "Featured Videos",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: Dimensions.fontSizeLarge),
                                    ),
                                    const SizedBox(
                                      height: Dimensions.paddingSizeDefault,
                                    ),
                                    videosController
                                            .featuredVideoList.isNotEmpty
                                        ? SizedBox(
                                            height: 250,
                                            child: ListView.builder(
                                                itemCount: videosController
                                                    .featuredVideoList.length,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                shrinkWrap: true,
                                                physics: const ScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  return FeaturedVideoCard(
                                                      videoModel: videosController
                                                              .featuredVideoList[
                                                          index]);
                                                }),
                                          )
                                        : Center(
                                            child: Text(
                                              "No Data Found",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize:
                                                      Dimensions.fontSizeLarge,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                    const SizedBox(
                                      height: Dimensions.paddingSizeDefault,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Top News",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  Dimensions.fontSizeLarge),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.to(() => NewsScreen(
                                                onScreenHideButtonPressed:
                                                    () {}));
                                          },
                                          child: Text(
                                            "View All",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize:
                                                    Dimensions.fontSizeLarge),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: Dimensions.paddingSizeDefault,
                                    ),
                                    newsController.newsList.isNotEmpty
                                        ? ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount:
                                                newsController.newsList.length >
                                                        4
                                                    ? 4
                                                    : newsController
                                                        .newsList.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  Get.to(() =>
                                                      NewsDetailsScreen(
                                                          newsModel:
                                                              newsController
                                                                      .newsList[
                                                                  index]));
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: Dimensions
                                                          .paddingSizeDefault),
                                                  decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors
                                                                .grey[300]!,
                                                            blurRadius: 3)
                                                      ],
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius
                                                          .circular(Dimensions
                                                              .radiusDefault)),
                                                  child: Row(
                                                    children: [
                                                      ClipRRect(
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    Dimensions
                                                                        .radiusDefault),
                                                            topRight:
                                                                Radius.circular(
                                                                    Dimensions
                                                                        .radiusDefault),
                                                          ),
                                                          child: Image.network(
                                                            newsController
                                                                .newsList[index]
                                                                .images![0],
                                                            errorBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    Object
                                                                        object,
                                                                    StackTrace?
                                                                        tree) {
                                                              return ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          Dimensions
                                                                              .radiusDefault),
                                                                  child: Image
                                                                      .network(
                                                                    'https://t3.ftcdn.net/jpg/03/27/55/60/360_F_327556002_99c7QmZmwocLwF7ywQ68ChZaBry1DbtD.jpg',
                                                                    width: Get
                                                                        .width,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ));
                                                            },
                                                            fit: BoxFit.cover,
                                                            height: 100,
                                                            width: 150,
                                                          )),
                                                      SizedBox(
                                                        width: 6,
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              newsController
                                                                          .newsList[
                                                                              index]
                                                                          .title! +
                                                                      " bbhh dfjdjfhd dfjdhjfd dfjhdjn kfdjkfndjf nfndm" ??
                                                                  "",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      Dimensions
                                                                          .fontSizeDefault,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            const SizedBox(
                                                              height: Dimensions
                                                                  .paddingSizeExtraSmall,
                                                            ),
                                                            Text(
                                                              "${newsController.newsList[index].description!} bbhh dfjdjfhd dfjdhjfd dfjhdjn kfdjkfndjf nfndm" ??
                                                                  "",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: Dimensions
                                                                    .fontSizeSmall,
                                                              ),
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            })
                                        : Center(
                                            child: Text(
                                              "No Data Found",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize:
                                                      Dimensions.fontSizeLarge,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                    const SizedBox(
                                      height: Dimensions.paddingSizeDefault,
                                    ),
                                    /* bannerAd != null
                                                            ? Align(
                                                                    alignment: Alignment.bottomCenter,
                                                                    child: SafeArea(
                                                                      child: SizedBox(
                                                                        width: bannerAd!.size.width.toDouble(),
                                                                        height: bannerAd!.size.height.toDouble(),
                                                                        child: AdWidget(ad: bannerAd!),
                                                                      ),
                                                                    ),
                                                                  )
                                                            : const SizedBox(),*/
                                    SizedBox(
                                      height: bannerAd != null
                                          ? Dimensions.paddingSizeDefault
                                          : 0,
                                    ),
                                  ],
                                ),
                              )
                            : GetBuilder<AllMatchesController>(
                                builder: (matchesController) {
                                if (matchesController.liveMatchList.isEmpty) {
                                  return Center(
                                    child: Text(
                                      "No data found",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: Dimensions.fontSizeLarge,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  );
                                }
                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.all(
                                      Dimensions.paddingSizeDefault),
                                  itemCount:
                                      matchesController.liveMatchList.length,
                                  itemBuilder: (context, index) {
                                    return LiveMatchCard(
                                        matchModel: matchesController
                                            .liveMatchList[index]);
                                  },
                                );
                              })
                      ],
                    ));
              },
            );
          },
        ));
  }

  urlLaunch(Uri url) async {
    if (await canLaunchUrl(url)) {
      launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  void loadAd() {
    bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          setState(() {
            isLoaded = true;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          // Dispose the ad here to free resources.
          ad.dispose();
        },
      ),
    )..load();
  }
}

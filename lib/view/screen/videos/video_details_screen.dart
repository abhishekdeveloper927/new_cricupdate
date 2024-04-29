import 'package:cricupdate/controller/videos_controller.dart';
import 'package:cricupdate/data/model/response/video_model.dart';
import 'package:cricupdate/view/screen/videos/widget/featured_video_card.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../util/dimensions.dart';

class VideoDetailsScreen extends StatefulWidget {
  final VideoModel videoModel;

  const VideoDetailsScreen({super.key, required this.videoModel});

  @override
  State<VideoDetailsScreen> createState() => _VideoDetailsScreenState();
}

class _VideoDetailsScreenState extends State<VideoDetailsScreen> {
  FlickManager? flickManager;
  VideoPlayerController? videoPlayerController;
  String? videoId;

  @override
  void initState() {
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoModel.url!));

    if (videoPlayerController != null) {
      flickManager = FlickManager(
          autoPlay: false, videoPlayerController: videoPlayerController!);
    }
    widget.videoModel.url!.startsWith("https://www.youtube.com") ||
            widget.videoModel.url!.startsWith("https://youtube.com")
        ? videoId = YoutubePlayer.convertUrlToId(widget.videoModel.url!)
        : null;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<VideosController>().getVideoList();
    });
    super.initState();
  }

  bool watch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<VideosController>(
        builder: (videosController) {
          return Stack(
            children: [
              ListView(
                children: [
                  !watch
                      ? Stack(
                          children: [
                            Image.network(
                              widget.videoModel.horizontalPoster ?? "",
                              width: Get.width,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        watch = !watch;
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(
                                          Dimensions.paddingSizeDefault),
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                      child: const Icon(
                                        Icons.play_arrow,
                                        color: Colors.black,
                                        size: 26,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      : videoId == null
                          ? AspectRatio(
                              aspectRatio: 16 / 9,
                              child: FlickVideoPlayer(
                                flickManager: flickManager!,
                              ),
                            )
                          : AspectRatio(
                              aspectRatio: 16 / 9,
                              child: YoutubePlayer(
                                controller: YoutubePlayerController(
                                  initialVideoId: videoId ?? '',
                                  flags: const YoutubePlayerFlags(
                                      showLiveFullscreenButton: true,
                                      forceHD: true,
                                      autoPlay: true,
                                      mute: false,
                                      loop: true),
                                ),
                              ),
                            ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.videoModel.title!,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.fontSizeOverLarge),
                        ),
                        const SizedBox(
                          height: Dimensions.paddingSizeDefault,
                        ),
                        Text(
                          widget.videoModel.description ?? 'ddd',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                        ),
                        const SizedBox(
                          height: Dimensions.paddingSizeDefault,
                        ),
                        videosController.videoList.isNotEmpty
                            ? GridView.builder(
                                shrinkWrap: true,
                                itemCount: videosController.videoList.length,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10),
                                itemBuilder: (context, index) {
                                  return FeaturedVideoCard(
                                      videoModel:
                                          videosController.videoList[index]);
                                },
                              )
                            : const SizedBox()
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 40,
                ),
                child: RawMaterialButton(
                  onPressed: () {
                    Get.back();
                  },
                  elevation: 2.0,
                  fillColor: Colors.black.withOpacity(.25),
                  padding: const EdgeInsets.all(8.0),
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.arrow_back,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

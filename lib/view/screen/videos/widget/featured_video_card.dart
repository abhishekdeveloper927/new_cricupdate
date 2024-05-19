import 'package:cricupdate/data/model/response/video_model.dart';
import 'package:cricupdate/view/screen/videos/video_details_screen.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../util/dimensions.dart';

class FeaturedVideoCard extends StatefulWidget {
  final VideoModel videoModel;

  const FeaturedVideoCard({super.key, required this.videoModel});

  @override
  State<FeaturedVideoCard> createState() => _FeaturedVideoCardState();
}

class _FeaturedVideoCardState extends State<FeaturedVideoCard> {
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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => VideoDetailsScreen(videoModel: widget.videoModel));
      },
      child: Container(
        width: Get.width - 70,
        decoration: BoxDecoration(
            color: Colors.grey[300]!,
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
        margin: const EdgeInsets.only(
          bottom: 16,
        ),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radiusDefault),
                        topRight: Radius.circular(Dimensions.radiusDefault))),
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimensions.radiusDefault),
                            topRight:
                                Radius.circular(Dimensions.radiusDefault)),
                        child: Image.network(
                          widget.videoModel.horizontalPoster ?? "",
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Positioned(
                        top: 0,
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Center(
                            child: Icon(
                          Icons.play_circle_fill,
                          size: 50,
                          color: Colors.red,
                        ))),
                  ],
                )),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeDefault, vertical: 4),
              child: Text(
                widget.videoModel.title ?? "",
                style: TextStyle(
                    color: Colors.black, fontSize: Dimensions.fontSizeDefault),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}

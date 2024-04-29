import 'package:cricupdate/data/model/response/video_model.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../util/dimensions.dart';

class ShortsCard extends StatefulWidget {
  final VideoModel videoModel;

  const ShortsCard({super.key, required this.videoModel});

  @override
  State<ShortsCard> createState() => _ShortsCardState();
}

class _ShortsCardState extends State<ShortsCard> {
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
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            videoId == null
                ? AspectRatio(
                    aspectRatio: 5 / 8,
                    child: FlickVideoPlayer(
                      flickManager: flickManager!,
                    ),
                  )
                : AspectRatio(
                    aspectRatio: 5 / 8,
                    child: YoutubePlayer(
                      controller: YoutubePlayerController(
                        initialVideoId: videoId ?? widget.videoModel.url!,
                        flags: const YoutubePlayerFlags(
                            forceHD: true,
                            showLiveFullscreenButton: false,
                            autoPlay: true,
                            mute: false,
                            loop: true),
                      ),
                    ),
                  ),
          ],
        ));
  }
}

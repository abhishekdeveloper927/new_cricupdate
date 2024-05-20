import 'package:cricupdate/data/model/response/matchh_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../util/dimensions.dart';
import '../match_details_screen.dart';

class MatchCard extends StatefulWidget {
  final double? width;
  final Match matchModel;

  const MatchCard({super.key, required this.matchModel, this.width});

  @override
  State<MatchCard> createState() => _MatchCardState();
}

class _MatchCardState extends State<MatchCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => MatchDetailsScreen(match: widget.matchModel));
      },
      child: Container(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        width: widget.width ?? Get.width,
        margin: const EdgeInsets.only(bottom: Dimensions.paddingSizeDefault),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.matchModel.competition != null
                        ? widget.matchModel.competition!.title ?? ''
                        : "",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimensions.fontSizeLarge,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                ),
                const SizedBox(
                  width: Dimensions.paddingSizeDefault,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeDefault, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusSmall)),
                  child: Text(
                    "Upcoming",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimensions.fontSizeSmall),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: Dimensions.paddingSizeSmall,
            ),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(
              height: Dimensions.paddingSizeSmall,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          widget.matchModel.teama != null
                              ? widget.matchModel.teama!.logoUrl ??
                                  "https://cdn-icons-png.flaticon.com/512/690/690430.png"
                              : "https://cdn-icons-png.flaticon.com/512/690/690430.png",
                          height: 35,
                          width: 35,
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            widget.matchModel.teama != null
                                ? widget.matchModel.teama!.name ?? ""
                                : "",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: Dimensions.fontSizeDefault),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                const SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: Dimensions.paddingSizeSmall,
                      ),
                      Center(
                        child: Icon(
                          Icons.swap_horiz,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            widget.matchModel.teamb != null
                                ? widget.matchModel.teamb!.name ?? ""
                                : "",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: Dimensions.fontSizeDefault),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Image.network(
                          widget.matchModel.teamb != null
                              ? widget.matchModel.teamb!.logoUrl ??
                                  "https://cdn-icons-png.flaticon.com/512/690/690430.png"
                              : "https://cdn-icons-png.flaticon.com/512/690/690430.png",
                          height: 35,
                          width: 35,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: Dimensions.paddingSizeDefault,
            ),
            Text(
              DateFormat("yyyy-MMMM-dd")
                  .add_jm()
                  .format(widget.matchModel.dateStart!),
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.fontSizeLarge),
            ),
            const SizedBox(
              height: 6,
            ),
            widget.matchModel.venue != null
                ? Text(
                    "Venue : ${widget.matchModel.venue!.location ?? ""}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimensions.fontSizeDefault),
                    overflow: TextOverflow.ellipsis,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

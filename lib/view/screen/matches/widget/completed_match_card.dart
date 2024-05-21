import 'package:cricupdate/data/model/response/matchh_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../util/dimensions.dart';
import '../match_details_screen.dart';

class CompletedMatchCard extends StatefulWidget {
  final Match matchModel;
  final double? width;

  const CompletedMatchCard({super.key, required this.matchModel, this.width});

  @override
  State<CompletedMatchCard> createState() => _CompletedMatchCardState();
}

class _CompletedMatchCardState extends State<CompletedMatchCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => MatchDetailsScreen(match: widget.matchModel));
      },
      child: Container(
        padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
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
                    widget.matchModel.competition!.title ?? '',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimensions.fontSizeLarge,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeDefault, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusSmall)),
                  child: Text(
                    "Complete",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimensions.fontSizeSmall),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: Dimensions.paddingSizeDefault,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          widget.matchModel.teama != null
                              ? widget.matchModel.teama!.logoUrl ??
                                  "https://cdn-icons-png.flaticon.com/512/690/690430.png"
                              : "https://cdn-icons-png.flaticon.com/512/690/690430.png",
                          height: 35,
                          width: 35,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.matchModel.teama!.scores ?? "0",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: widget.matchModel.competition!
                                                    .gameFormat ==
                                                'test' ||
                                            widget.matchModel.competition!
                                                    .gameFormat ==
                                                'firstclass'
                                        ? Dimensions.fontSizeSmall
                                        : Dimensions.fontSizeDefault),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "${widget.matchModel.teama!.overs ?? ""} Overs",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: widget.matchModel.competition!
                                                    .gameFormat ==
                                                'test' ||
                                            widget.matchModel.competition!
                                                    .gameFormat ==
                                                'firstclass'
                                        ? Dimensions.fontSizeSmall
                                        : Dimensions.fontSizeDefault),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                const SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: Dimensions.paddingSizeDefault,
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
                SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                widget.matchModel.teamb!.scores ?? "0",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: widget.matchModel.competition!
                                                    .gameFormat ==
                                                'test' ||
                                            widget.matchModel.competition!
                                                    .gameFormat ==
                                                'firstclass'
                                        ? Dimensions.fontSizeSmall
                                        : Dimensions.fontSizeDefault),
                                textAlign: TextAlign.end,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "${widget.matchModel.teamb!.overs ?? ""} Overs",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: widget.matchModel.competition!
                                                    .gameFormat ==
                                                'test' ||
                                            widget.matchModel.competition!
                                                    .gameFormat ==
                                                'firstclass'
                                        ? Dimensions.fontSizeSmall
                                        : Dimensions.fontSizeDefault),
                                textAlign: TextAlign.end,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 8,
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
              height: Dimensions.paddingSizeExtraSmall,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.matchModel.teama != null
                        ? widget.matchModel.teama!.name ?? ""
                        : "",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimensions.fontSizeDefault),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
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
              ],
            ),
            const SizedBox(
              height: Dimensions.paddingSizeSmall,
            ),
            Divider(
              color: Colors.grey,
            ),
            const SizedBox(
              height: Dimensions.paddingSizeSmall,
            ),
            Text(
              widget.matchModel.result ?? '',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.fontSizeLarge),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                widget.matchModel.venue != null
                    ? Expanded(
                        child: Text(
                          "Venue : ${widget.matchModel.venue!.location ?? ""}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.fontSizeDefault),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    : const SizedBox(),
                Expanded(
                  child: Text(
                    "${DateFormat("EEEE").format(widget.matchModel.dateStart!)} ${DateFormat("hh:mm aaa").format(widget.matchModel.dateStart!.add(Duration(hours: 5, minutes: 30)))}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimensions.fontSizeDefault),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cricupdate/data/model/response/matchh_page.dart';
import 'package:intl/intl.dart';

import '../../../../util/dimensions.dart';
import '../match_details_screen.dart';

class LiveMatchCard extends StatefulWidget {
  final Match matchModel;
  final double? width;
  final bool margin;

  const LiveMatchCard(
      {super.key, required this.matchModel, this.width, this.margin = false});

  @override
  State<LiveMatchCard> createState() => _LiveMatchCardState();
}

class _LiveMatchCardState extends State<LiveMatchCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => MatchDetailsScreen(match: widget.matchModel));
      },
      child: Container(
        padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
        width: widget.width ?? Get.width,
        margin: EdgeInsets.only(
            bottom: widget.margin ? 0 : Dimensions.paddingSizeDefault),
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.grey[300]!, blurRadius: 3)],
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.matchModel.competition!.title ?? '',
                        style: TextStyle(
                          color: Color(0xff373535),
                          fontSize: Dimensions.fontSizeDefault,
                        ),
                        maxLines: 1,
                      ),
                      Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  decoration: BoxDecoration(
                      color: Color(0xff373535),
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusSmall)),
                  child: Text(
                    "Live",
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
                                    color: Color(0xff373535),
                                    fontWeight: FontWeight.bold,
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
                                height: 4,
                              ),
                              Text(
                                "${widget.matchModel.teama!.overs ?? ""} Overs",
                                style: TextStyle(
                                    color: Color(0xff373535),
                                    fontWeight: FontWeight.bold,
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
                                    color: Color(0xff373535),
                                    fontWeight: FontWeight.bold,
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
                                height: 4,
                              ),
                              Text(
                                "${widget.matchModel.teamb!.overs ?? ""} Overs",
                                style: TextStyle(
                                    color: Color(0xff373535),
                                    fontWeight: FontWeight.bold,
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(
              height: Dimensions.paddingSizeExtraSmall,
            ),
            const Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: Dimensions.paddingSizeExtraSmall,
            ),
            /*
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 16,
                ),

                Image.network(
                  widget.matchModel.teama != null
                      ? widget.matchModel.teama!.logoUrl ??
                          "https://cdn-icons-png.flaticon.com/512/690/690430.png"
                      : "https://cdn-icons-png.flaticon.com/512/690/690430.png",
                  height: 30,
                  width: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    widget.matchModel.teama != null
                        ? widget.matchModel.teama!.shortName ?? ""
                        : "",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.fontSizeDefault),
                  ),
                ),
                const SizedBox(
                  width: Dimensions.paddingSizeDefault,
                ),
                widget.matchModel.teama != null
                    ? SizedBox(
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radiusSmall)),
                              child: Center(
                                child: Text(
                                  widget.matchModel.teama!.scores ?? "0",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.fontSizeSmall),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radiusSmall)),
                              child: Center(
                                child: Text(
                                  widget.matchModel.teama!.overs ?? "0",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.fontSizeSmall),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  width: Dimensions.paddingSizeDefault,
                ),
              ],
            ),
            const SizedBox(
              height: Dimensions.paddingSizeExtraSmall,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 16,
                ),
                Image.network(
                  widget.matchModel.teamb != null
                      ? widget.matchModel.teamb!.logoUrl ??
                          "https://cdn-icons-png.flaticon.com/512/690/690430.png"
                      : "https://cdn-icons-png.flaticon.com/512/690/690430.png",
                  height: 30,
                  width: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    widget.matchModel.teamb != null
                        ? widget.matchModel.teamb!.shortName ?? ""
                        : "",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.fontSizeDefault),
                  ),
                ),
                const SizedBox(
                  width: Dimensions.paddingSizeDefault,
                ),
                widget.matchModel.teamb != null
                    ? SizedBox(
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radiusSmall)),
                              child: Center(
                                child: Text(
                                  widget.matchModel.teamb!.scores ?? "0",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.fontSizeSmall),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radiusSmall)),
                              child: Center(
                                child: Text(
                                  widget.matchModel.teamb!.overs ?? "0",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.fontSizeSmall),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  width: Dimensions.paddingSizeDefault,
                ),
              ],
            ),*/

            Text(
              widget.matchModel.toss != null
                  ? widget.matchModel.toss!.text ?? ""
                  : "",
              style: TextStyle(
                  color: Color(0xff820000),
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.fontSizeDefault),
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
          ],
        ),
      ),
    );
  }
}

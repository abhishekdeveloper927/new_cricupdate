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
        width: widget.width ?? Get.width,
        margin: const EdgeInsets.only(bottom: Dimensions.paddingSizeDefault),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radiusDefault),
                      topRight: Radius.circular(Dimensions.radiusDefault))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black,
                    size: 19,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: Dimensions.paddingSizeDefault,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.matchModel.subtitle ?? "",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: Dimensions.fontSizeDefault,
                      ),
                    ),
                  ),
                  const SizedBox(
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
                      "Upcoming",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Dimensions.fontSizeSmall),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: Dimensions.paddingSizeDefault,
            ),
            Row(
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
                Text(
                  widget.matchModel.teama != null
                      ? widget.matchModel.teama!.name ?? ""
                      : "",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.fontSizeDefault),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
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
                Text(
                  widget.matchModel.teamb != null
                      ? widget.matchModel.teamb!.name ?? ""
                      : "",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.fontSizeDefault),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                DateFormat("yyyy-MMMM-dd")
                    .add_jm()
                    .format(widget.matchModel.dateStart!),
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.fontSizeLarge),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            widget.matchModel.venue != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Venue : ${widget.matchModel.venue!.location ?? ""}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.fontSizeDefault),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                : const SizedBox(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

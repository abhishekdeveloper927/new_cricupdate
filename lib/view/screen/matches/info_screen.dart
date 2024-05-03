import 'package:cricupdate/data/model/response/matchh_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../util/dimensions.dart';

class InfoScreen extends StatefulWidget {
  final Match matchModel;

  const InfoScreen({super.key, required this.matchModel});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Info",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.fontSizeLarge),
          ),
          const SizedBox(
            height: Dimensions.paddingSizeDefault,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(Dimensions.radiusDefault)),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Match",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.fontSizeLarge),
                      ),
                      widget.matchModel.teama != null &&
                              widget.matchModel.teamb != null
                          ? Text(
                              "${widget.matchModel.teama!.shortName ?? ""} Vs ${widget.matchModel.teama!.shortName ?? ""}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.fontSizeLarge),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeDefault,
                  ),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeDefault,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Match Type",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.fontSizeLarge),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          widget.matchModel.subtitle ?? "",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.fontSizeLarge),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeDefault,
                  ),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeDefault,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Match Date",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.fontSizeLarge),
                      ),
                      Text(
                        DateFormat("yyyy-MMMM-dd")
                            .format(widget.matchModel.dateStart!),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.fontSizeLarge),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeDefault,
                  ),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeDefault,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Match Time",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.fontSizeLarge),
                      ),
                      Text(
                        DateFormat("hh:mm aaa")
                            .format(widget.matchModel.dateStart!),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.fontSizeLarge),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeDefault,
                  ),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeDefault,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Match Status",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.fontSizeLarge),
                      ),
                      Text(
                        widget.matchModel.statusStr ?? "",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.fontSizeLarge),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeDefault,
                  ),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeDefault,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Venue",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.fontSizeLarge),
                      ),
                      Expanded(
                        child: Text(
                          widget.matchModel.venue != null
                              ? widget.matchModel.venue!.location ?? "null"
                              : "null",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.fontSizeLarge),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeDefault,
                  ),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeDefault,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Venue Country",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.fontSizeLarge),
                      ),
                      Expanded(
                        child: Text(
                          widget.matchModel.venue != null
                              ? widget.matchModel.venue!.country ?? "null"
                              : "null",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.fontSizeLarge),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeDefault,
                  ),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeDefault,
                  ), /*
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ground Capacity",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.fontSizeLarge),
                      ),
                    ],
                  ),*/
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

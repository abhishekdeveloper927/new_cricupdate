import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/response/team_page.dart';
import '../../../util/dimensions.dart';

class TeamDetailsScreen extends StatefulWidget {
  final TeamModel teamModel;

  const TeamDetailsScreen({super.key, required this.teamModel});

  @override
  State<TeamDetailsScreen> createState() => _TeamDetailsScreenState();
}

class _TeamDetailsScreenState extends State<TeamDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Get.theme.primaryColor,
        title: Text(
          "Team Details",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.fontSizeLarge),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
            child: Image.network(
              widget.teamModel.logoUrl!,
              width: Get.width,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: Dimensions.paddingSizeDefault,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Team Name",
                style: TextStyle(
                    color: Colors.black, fontSize: Dimensions.fontSizeLarge),
              ),
              Text(
                widget.teamModel.title ?? "",
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Team Code",
                style: TextStyle(
                    color: Colors.black, fontSize: Dimensions.fontSizeLarge),
              ),
              Text(
                widget.teamModel.altName ?? "",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.fontSizeLarge),
              ),
            ],
          ),
          /*
          const SizedBox(
            height: Dimensions.paddingSizeDefault,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "National Team",
                style: TextStyle(
                    color: Colors.black, fontSize: Dimensions.fontSizeLarge),
              ),
              Text(
                widget.teamModel == true ? "Yes" : "No",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.fontSizeLarge),
              ),
            ],
          ),*/
          const SizedBox(
            height: Dimensions.paddingSizeDefault,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Resource",
                style: TextStyle(
                    color: Colors.black, fontSize: Dimensions.fontSizeLarge),
              ),
              Text(
                widget.teamModel.country!,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.fontSizeLarge),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

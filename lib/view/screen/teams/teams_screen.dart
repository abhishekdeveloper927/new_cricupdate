import 'package:cricupdate/controller/all_matches_controller.dart';
import 'package:cricupdate/controller/auth_controller.dart';
import 'package:cricupdate/util/images.dart';
import 'package:cricupdate/view/base/loader.dart';
import 'package:cricupdate/view/screen/teams/team_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../util/dimensions.dart';

class TeamsScreen extends StatefulWidget {
  const TeamsScreen({super.key});

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  TextEditingController searchController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<AllMatchesController>().getTeamsList(
          token: Get.find<AuthController>().entityToken, search: '');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Get.theme.primaryColor,
        title: Text(
          "Browse Teams",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.fontSizeLarge),
        ),
      ),
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      body: GetBuilder<AllMatchesController>(
        builder: (matchesController) {
          if (matchesController.isLoading) {
            return const Loader();
          }
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                    left: Dimensions.paddingSizeDefault,
                    right: Dimensions.paddingSizeDefault,
                    top: Dimensions.paddingSizeDefault),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                width: Get.width,
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: TextFormField(
                  controller: searchController,
                  focusNode: focusNode,
                  onChanged: (_) {
                    matchesController.getTeamsList(
                        search: searchController.text,
                        token: Get.find<AuthController>().entityToken);
                  },
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 22,
                      ),
                      hintText: "Search",
                      hintStyle:
                          TextStyle(fontSize: 14, color: Colors.black26)),
                ),
              ),
              matchesController.teamList.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(
                              Dimensions.paddingSizeDefault),
                          itemCount: matchesController.teamList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.to(() => TeamDetailsScreen(
                                    teamModel:
                                        matchesController.teamList[index]));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  color: Get.theme.cardColor,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radiusDefault),
                                ),
                                child: ListTile(
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.network(
                                      matchesController
                                          .teamList[index].logoUrl!,
                                      height: 35,
                                      width: 35,
                                      errorBuilder: (BuildContext context,
                                          Object object, StackTrace? tree) {
                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Image.asset(
                                            Images.appIcon2,
                                            height: 35,
                                            width: 35,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  title: Text(
                                    matchesController.teamList[index].title!,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: Dimensions.fontSizeDefault,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  : Center(
                      child: Text(
                        "No data found",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.fontSizeLarge),
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}

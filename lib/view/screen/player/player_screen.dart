import 'package:cricupdate/controller/all_matches_controller.dart';
import 'package:cricupdate/controller/auth_controller.dart';
import 'package:cricupdate/util/images.dart';
import 'package:cricupdate/view/base/loader.dart';
import 'package:cricupdate/view/screen/player/player_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../util/dimensions.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  TextEditingController searchController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<AllMatchesController>().getPlayerList(
          token: Get.find<AuthController>().entityToken!, search: '');
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
          "Browse Player",
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
                    matchesController.getPlayerList(
                        search: searchController.text,
                        token: Get.find<AuthController>().entityToken!);
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
              matchesController.playerList.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(
                              Dimensions.paddingSizeDefault),
                          itemCount: matchesController.playerList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.to(() => PlayerDetailsScreen(
                                    id: matchesController
                                        .playerList[index].pid!));
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
                                          .playerList[index].logoUrl!,
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
                                    matchesController
                                            .playerList[index].firstName! +
                                        " " +
                                        matchesController
                                            .playerList[index].lastName!,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: Dimensions.fontSizeDefault,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  trailing: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 18,
                                    color: Colors.black,
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

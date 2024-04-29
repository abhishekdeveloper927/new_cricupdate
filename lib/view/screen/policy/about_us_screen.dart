import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller.dart';
import '../../../util/dimensions.dart';
import '../../base/loader.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<AuthController>().getConfigData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Get.theme.primaryColor,
        centerTitle: true,
        title: Text(
          "About Us",
          style: TextStyle(
              color: Get.theme.scaffoldBackgroundColor,
              fontSize: Dimensions.fontSizeLarge),
        ),
      ),
      body: GetBuilder<AuthController>(builder: (authController) {
        if (authController.isLoading) {
          return const Loader();
        }
        return ListView(
          padding: const EdgeInsets.all(10),
          children: [
            Html(
              data: """${authController.configModel!.aboutUs!}
                """,
              style: {
                "body": Style(
                    fontSize: FontSize(Dimensions.paddingSizeDefault),
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              },
            ),
          ],
        );
      }),
    );
  }
}

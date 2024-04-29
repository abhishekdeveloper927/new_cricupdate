import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller.dart';
import '../../../util/dimensions.dart';
import '../../base/loader.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
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
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Get.theme.primaryColor,
        centerTitle: true,
        title: Text(
          "Privacy Policy",
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
              data: """${authController.configModel!.privacyPolicy!}
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

import 'package:cricupdate/util/app_constants.dart';
import 'package:cricupdate/util/images.dart';
import 'package:cricupdate/view/screen/policy/about_us_screen.dart';
import 'package:cricupdate/view/screen/policy/privacy_policy_screen.dart';
import 'package:cricupdate/view/screen/policy/t_and_c.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../util/dimensions.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Get.theme.primaryColor,
        title: Text(
          "About ${AppConstants.appName}",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.fontSizeLarge),
        ),
      ),
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Images.logo3,
              height: 200,
              width: 200,
            ),
            const SizedBox(
              height: Dimensions.paddingSizeDefault,
            ),
            Container(
              padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
              decoration: BoxDecoration(
                  color: Get.theme.cardColor,
                  borderRadius:
                      BorderRadius.circular(Dimensions.radiusDefault)),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => const AboutUsScreen());
                    },
                    child: Container(
                      width: Get.width,
                      padding:
                          const EdgeInsets.all(Dimensions.paddingSizeDefault),
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius:
                              BorderRadius.circular(Dimensions.radiusDefault)),
                      child: Center(
                        child: Text(
                          "About Us",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.fontSizeLarge,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeDefault,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => const PrivacyPolicyScreen());
                    },
                    child: Container(
                      width: Get.width,
                      padding:
                          const EdgeInsets.all(Dimensions.paddingSizeDefault),
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius:
                              BorderRadius.circular(Dimensions.radiusDefault)),
                      child: Center(
                        child: Text(
                          "Privacy Policy",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.fontSizeLarge,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeDefault,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => const TAndCScreen());
                    },
                    child: Container(
                      width: Get.width,
                      padding:
                          const EdgeInsets.all(Dimensions.paddingSizeDefault),
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius:
                              BorderRadius.circular(Dimensions.radiusDefault)),
                      child: Center(
                        child: Text(
                          "Terms & Conditions",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.fontSizeLarge,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeDefault,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  urlLaunch(Uri url) async {
    if (await canLaunchUrl(url)) {
      launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }
}

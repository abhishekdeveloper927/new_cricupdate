import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cricupdate/util/app_constants.dart';
import 'package:cricupdate/view/screen/dashboard/dashboard_screen.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller.dart';
import '../../../util/images.dart';
import '../../base/button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<String> onBoardingImages = [
    Images.onBoarding1,
    Images.onBoarding2,
    Images.onBoarding3,
    Images.onBoarding4,
  ];
  AndroidDeviceInfo? android;
  IosDeviceInfo? ios;

  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  Future<void> deviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      android = await deviceInfo.androidInfo;
    } else if (Platform.isIOS) {
      ios = await deviceInfo.iosInfo;
    }
  }

  String? message;

  @override
  void initState() {
    deviceId();
    firebaseMessaging.getToken().then((token) {
      message = token ?? '';
      if (kDebugMode) {
        print("${message}abb");
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (authController) {
        if (authController.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
            child: Stack(
              children: [
                CarouselSlider(
                  items: onBoardingImages.map((e) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Image.asset(
                          e,
                          fit: BoxFit.cover,
                          width: Get.width,
                          height: Get.height,
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    aspectRatio: 0.46,
                    viewportFraction: 1.0,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 16,
                  right: 16,
                  child: Button(
                      radius: 12,
                      title: "Get Started",
                      onTap: () async {
                        Get.find<AuthController>().authRepo.saveUserToken(
                            AppConstants
                                .token); /*
                        await Get.find<AuthController>().authToken();*/

                        await Get.find<AuthController>().updateFcmToken(
                            fcmToken: message!, deviceId: android!.id);
                        await Get.find<AuthController>().getProfile();
                        await Get.find<AuthController>().getConfigData();
                        Get.offAll(() => const DashboardScreen());
                      }),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}

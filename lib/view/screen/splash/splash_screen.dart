import 'package:cricupdate/controller/auth_controller.dart';
import 'package:cricupdate/view/screen/splash/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../util/images.dart';
import '../dashboard/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    if (Get.find<AuthController>().isLoggedIn()) {
      data();
      Future.delayed(const Duration(seconds: 3), () {
        Get.off(() => const DashboardScreen());
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Get.off(() => const OnBoardingScreen());
      });
    }

    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  Future<void> data() async {
    await Get.find<AuthController>().authToken();
    await Get.find<AuthController>().getProfile();
    await Get.find<AuthController>().getConfigData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: Center(
        child: Image.asset(
          Images.logo2,
          width: 250,
          height: 250,
        ),
      ),
    );
  }
}

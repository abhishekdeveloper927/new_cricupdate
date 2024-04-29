import 'package:cricupdate/controller/auth_controller.dart';
import 'package:cricupdate/util/images.dart';
import 'package:cricupdate/view/base/button.dart';
import 'package:cricupdate/view/screen/auth/sign_in_screen.dart';
import 'package:cricupdate/view/screen/profile/edit_profile_screen.dart';
import 'package:cricupdate/view/screen/profile/widget/profile_data_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../util/dimensions.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<AuthController>().getProfile();
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
            "My Profile",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.fontSizeLarge),
          ),
          actions: [
            GetBuilder<AuthController>(builder: (authController) {
              if (authController.userModel == null) {
                return const SizedBox();
              }
              return InkWell(
                  onTap: () {
                    Get.to(() => const EditProfileScreen());
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 20,
                    ),
                  ));
            })
          ],
        ),
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        body: GetBuilder<AuthController>(
          builder: (authController) {
            if (authController.userModel == null) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Button(
                      title: "Login",
                      onTap: () {
                        Get.to(() => const SignInScreen());
                      }),
                ),
              );
            }
            return ListView(padding: const EdgeInsets.all(16), children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    Images.logo2,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ProfileDataField(
                      icon: Icons.person,
                      title: "Name",
                      subTitle: authController.userModel!.name ?? ""),
                  const SizedBox(
                    height: Dimensions.paddingSizeDefault,
                  ),
                  ProfileDataField(
                      icon: Icons.email,
                      title: "Email",
                      subTitle: authController.userModel!.email ?? ""),
                  const SizedBox(
                    height: Dimensions.paddingSizeDefault,
                  ),
                  ProfileDataField(
                      icon: Icons.call,
                      title: "Number",
                      subTitle: authController.userModel!.mobileNumber ?? ""),
                  const SizedBox(
                    height: Dimensions.paddingSizeDefault,
                  ),
                  ProfileDataField(
                      icon: Icons.calendar_month,
                      title: "Joined",
                      subTitle: DateFormat('dd/MM/yy')
                          .add_jm()
                          .format(authController.userModel!.createdAt!)),
                ],
              ),
            ]);
          },
        ));
  }
}

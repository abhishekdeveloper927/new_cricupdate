import 'package:cricupdate/controller/auth_controller.dart';
import 'package:cricupdate/data/model/body/register_body.dart';
import 'package:cricupdate/util/images.dart';
import 'package:cricupdate/view/base/button.dart';
import 'package:cricupdate/view/base/input_field2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/dimensions.dart';
import '../../base/show_snackbar.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<AuthController>().getProfile().then((value) {
        if (value.status) {
          nameController.text =
              Get.find<AuthController>().userModel!.name ?? "";
          emailController.text =
              Get.find<AuthController>().userModel!.email ?? "";
          numberController.text =
              Get.find<AuthController>().userModel!.mobileNumber ?? "";
        }
      });
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
            "Edit My Profile",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.fontSizeLarge),
          ),
        ),
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(
          builder: (authController) {
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
                  InputField2(
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    title: "Name",
                    subTitle: "Enter Name",
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeDefault,
                  ),
                  InputField2(
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    title: "Email",
                    subTitle: "Enter Email",
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeDefault,
                  ),
                  InputField2(
                    prefixIcon: const Icon(
                      Icons.call,
                      color: Colors.black,
                    ),
                    title: "Number",
                    subTitle: "Enter Number",
                    controller: numberController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Button(
                      title: "Update",
                      onTap: () {
                        submit();
                      }),
                ],
              ),
            ]);
          },
        ));
  }

  submit() {
    if (nameController.text.trim().isEmpty) {
      return showCustomSnackBar("Enter Your Name", isError: true);
    }
    if (emailController.text.trim().isEmpty) {
      return showCustomSnackBar("Enter Your Email", isError: true);
    }
    if (numberController.text.trim().isEmpty) {
      return showCustomSnackBar("Enter Your Number", isError: true);
    }
    RegisterBody registerBody = RegisterBody(
        name: nameController.text,
        email: emailController.text,
        mobileNumber: numberController.text);
    Get.find<AuthController>().updateProfile(registerBody).then((value) {
      Get.close(1);
    });
  }
}

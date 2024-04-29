import 'package:cricupdate/controller/auth_controller.dart';
import 'package:cricupdate/data/model/body/register_body.dart';
import 'package:cricupdate/util/dimensions.dart';
import 'package:cricupdate/util/images.dart';
import 'package:cricupdate/view/base/button.dart';
import 'package:cricupdate/view/screen/auth/sign_in_screen.dart';
import 'package:cricupdate/view/screen/dashboard/dashboard_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../base/input_field2.dart';
import '../../base/loader.dart';
import '../../base/show_snackbar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool value = false;
  bool obscureText1 = true;
  bool obscureText2 = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode nameFocus = FocusNode();
  FocusNode numberFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode confirmPasswordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.primaryColor,
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            "Create New Account",
            style: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.fontSizeOverLarge,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(60))),
            child: Column(
              children: [
                Image.asset(
                  Images.logo2,
                  height: 200,
                ),
                Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: Dimensions.fontSizeExtraLarge,
                      fontWeight: FontWeight.bold),
                ),
                InputField2(
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  title: "Name",
                  subTitle: "Enter Name",
                  controller: nameController,
                  focusNode: nameFocus,
                  nextFocus: numberFocus,
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
                  focusNode: numberFocus,
                  nextFocus: emailFocus,
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
                  focusNode: emailFocus,
                  nextFocus: passwordFocus,
                ),
                const SizedBox(
                  height: Dimensions.paddingSizeDefault,
                ),
                InputField2(
                  obscure: obscureText1,
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  title: "Password",
                  subTitle: "Enter Password",
                  controller: passwordController,
                  focusNode: passwordFocus,
                  nextFocus: confirmPasswordFocus,
                  maxLine: 1,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText1 = !obscureText1;
                      });
                    },
                    icon: FaIcon(
                      !obscureText1
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash,
                      color: Colors.black,
                      size: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: Dimensions.paddingSizeDefault,
                ),
                InputField2(
                  obscure: obscureText2,
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  maxLine: 1,
                  title: "Confirm Password",
                  subTitle: "Enter Confirm Password",
                  controller: confirmPasswordController,
                  focusNode: confirmPasswordFocus,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText2 = !obscureText2;
                      });
                    },
                    icon: FaIcon(
                      !obscureText2
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash,
                      color: Colors.black,
                      size: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: Dimensions.paddingSizeDefault,
                ),
                Row(
                  children: [
                    Checkbox(
                      side: const BorderSide(color: Colors.black),
                      activeColor: Colors.black,
                      checkColor: Colors.white,
                      value: value,
                      onChanged: (value) {
                        setState(() {
                          this.value = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: <TextSpan>[
                            const TextSpan(
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                                text: 'I agree to the '),
                            TextSpan(
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                                text: 'Terms of Service',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {}),
                            const TextSpan(
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                                text: ' and '),
                            TextSpan(
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              text: 'Privacy Policy',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  urlLaunch(Uri.parse(
                                      "https://www.bellwayinfotech.com/p/privacy_policy2"));
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: Dimensions.paddingSizeDefault,
                ),
                GetBuilder<AuthController>(builder: (authController) {
                  return authController.isLoading
                      ? const Loader()
                      : Button(
                      title: "Sign Up",
                      onTap: () {
                        submit();
                      });
                }),
                const SizedBox(
                  height: Dimensions.paddingSizeDefault,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const SignInScreen());
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      Text(
                        " Sign In",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: Dimensions.paddingSizeDefault,
                ),
                Button(
                    bgColor: Colors.white,
                    textColor: Get.theme.primaryColor,
                    borderColor: Get.theme.primaryColor,
                    icon: FontAwesomeIcons.google,
                    iconColor: Get.theme.primaryColor,
                    title: "Sign Up With Google",
                    onTap: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void submit() {
    if (nameController.text
        .trim()
        .isNotEmpty) {
      if (numberController.text
          .trim()
          .isNotEmpty) {
        if (emailController.text
            .trim()
            .isNotEmpty) {
          if (passwordController.text
              .trim()
              .isNotEmpty) {
            if (confirmPasswordController.text
                .trim()
                .isNotEmpty) {
              if (passwordController.text == confirmPasswordController.text) {
                RegisterBody registerBody = RegisterBody(
                    name: nameController.text.trim(),
                    mobileNumber: numberController.text.trim(),
                    email: emailController.text.trim(),
                    password: passwordController.text.trim());

                Get.find<AuthController>().register(registerBody).then((value) {
                  if (value.status) {
                    Get.find<AuthController>().authToken();
                    Get.offAll(() => const DashboardScreen());
                  }
                });
              } else {
                showCustomSnackBar('Password Mismatch', isError: true);
                confirmPasswordFocus.requestFocus();
              }
            } else {
              showCustomSnackBar('Enter Confirm Password', isError: true);
              confirmPasswordFocus.requestFocus();
            }
          } else {
            showCustomSnackBar('Enter Password', isError: true);
            passwordFocus.requestFocus();
          }
        } else {
          showCustomSnackBar('Enter Email', isError: true);
          emailFocus.requestFocus();
        }
      } else {
        showCustomSnackBar('Enter Number', isError: true);
        numberFocus.requestFocus();
      }
    } else {
      showCustomSnackBar('Enter Name', isError: true);
      nameFocus.requestFocus();
    }
  }

  urlLaunch(Uri url) async {
    if (await canLaunchUrl(url)) {
      launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }
}

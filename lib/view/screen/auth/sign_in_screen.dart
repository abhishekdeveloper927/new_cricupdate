import 'package:cricupdate/controller/auth_controller.dart';
import 'package:cricupdate/data/model/body/login_body.dart';
import 'package:cricupdate/util/dimensions.dart';
import 'package:cricupdate/util/images.dart';
import 'package:cricupdate/view/base/button.dart';
import 'package:cricupdate/view/base/input_field2.dart';
import 'package:cricupdate/view/screen/auth/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../base/loader.dart';
import '../../base/show_snackbar.dart';
import '../dashboard/dashboard_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode numberFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.primaryColor,
      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          Text(
            "Welcome Back",
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
            height: Get.height,
            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(60))),
            child: Column(
              children: [
                Image.asset(
                  Images.logo2,
                  height: 200,
                ),
                const SizedBox(
                  height: Dimensions.paddingSizeDefault,
                ),
                Text(
                  "Sign In",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: Dimensions.fontSizeExtraLarge,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: Dimensions.paddingSizeOverLarge,
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
                  nextFocus: passwordFocus,
                ),
                const SizedBox(
                  height: Dimensions.paddingSizeDefault,
                ),
                InputField2(
                  obscure: obscure,
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  title: "Password",
                  maxLine: 1,
                  subTitle: "Enter Password",
                  controller: passwordController,
                  focusNode: passwordFocus,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                    icon: FaIcon(
                      !obscure
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash,
                      color: Colors.black,
                      size: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GetBuilder<AuthController>(builder: (authController) {
                  return authController.isLoading
                      ? const Loader()
                      : Button(
                          title: "Sign In",
                          onTap: () {
                            submit();
                          });
                }),
                const SizedBox(
                  height: Dimensions.paddingSizeDefault,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const SignUpScreen());
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      Text(
                        " Sign Up",
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
                    title: "Login With Google",
                    onTap: () async {
                      final User? user = await signInWithGoogle();
                      if (user != null) {
                        Get.to(() => const DashboardScreen());
                      }
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void submit() {
    if (numberController.text.trim().isNotEmpty) {
      if (passwordController.text.trim().isNotEmpty) {
        LoginBody loginBody = LoginBody(
          mobileNumber: numberController.text.trim().toString(),
          password: passwordController.text.trim().toString(),
        );
        Get.find<AuthController>().login(loginBody).then((value) async {
          if (value.status) {
            /*
           await Get.find<AuthController>().authToken();*/
            Get.offAll(() => const DashboardScreen());
          }
        });
      } else {
        showCustomSnackBar('Enter Password', isError: true);
        passwordFocus.requestFocus();
      }
    } else {
      showCustomSnackBar('Enter Number', isError: true);
      numberFocus.requestFocus();
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential authResult =
            await _auth.signInWithCredential(credential);
        final User? user = authResult.user;

        return user;
      }
    } catch (error) {
      print('Error signing in with Google: $error');
    }
    return null;
  }
}

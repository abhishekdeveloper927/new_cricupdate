import 'package:cricupdate/data/model/response/subscription_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_web/razorpay_web.dart';

import '../../../../controller/auth_controller.dart';
import '../../../../controller/subscription_controller.dart';
import '../../../../util/dimensions.dart';
import '../../../../util/images.dart';
import '../../auth/sign_in_screen.dart';

class SubscriptionCard extends StatefulWidget {
  final SubscriptionModel subscriptionModel;

  const SubscriptionCard({super.key, required this.subscriptionModel});

  @override
  State<SubscriptionCard> createState() => _SubscriptionCardState();
}

class _SubscriptionCardState extends State<SubscriptionCard> {
  Razorpay razorpay = Razorpay();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (Get.find<AuthController>().userModel != null) {
          var options = {
            'key': 'rzp_test_WZu8B3H1Bec0W9',
            'amount': double.parse(widget.subscriptionModel.price!) * 100,
            'name': widget.subscriptionModel.name,
            'description': widget.subscriptionModel.description,
            'retry': {'enabled': true, 'max_count': 1},
            'send_sms_hash': true,
            'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
            'external': {
              'wallets': ['paytm']
            }
          };
          razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
          razorpay.on(
              Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
          razorpay.on(
              Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
          razorpay.open(options);
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20.0)), //this right here
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                  ),
                  height: 280,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            Images.logo1,
                            height: 100,
                          ),
                        ),
                        const Text(
                          "You are not logged in.",
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: const Center(
                                child: Text(
                                  "No",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                Get.to(() => const SignInScreen());
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
      child: Container(
        height: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Get.theme.primaryColor),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Text(
              widget.subscriptionModel.name!,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Rs.${widget.subscriptionModel.price!}",
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Duration : ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.fontSizeSmall),
                        ),
                        Expanded(
                          child: Text(
                            "${widget.subscriptionModel.duration!} Days",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: Dimensions.fontSizeSmall),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Description : ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.fontSizeSmall),
                        ),
                        Expanded(
                          child: Text(
                            widget.subscriptionModel.description!,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: Dimensions.fontSizeSmall),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.message.toString()}",
        () {
      Navigator.pop(context);
    });
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    showAlertDialog(
        context, "Payment Successful", "Payment ID: ${response.paymentId}", () {
      if (response.paymentId != null) {
        Get.find<SubscriptionController>()
            .buySubscription(
          userId: Get.find<AuthController>().userModel!.id!,
          planId: widget.subscriptionModel.id!,
          transactionId: response.paymentId!,
        )
            .then((value) {
          if (value.status) {
            Get.find<SubscriptionController>()
                .getMySubscription(
                    userId: Get.find<AuthController>().userModel!.id!)
                .then((value) {
              if (value.status) {}
            });
            Get.close(1);
          }
        });
      }
    });
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}", () {
      Navigator.pop(context);
    });
  }

  void showAlertDialog(
      BuildContext context, String title, String message, Function onTap) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {
        onTap();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

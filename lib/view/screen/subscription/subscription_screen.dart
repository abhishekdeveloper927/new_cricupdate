import 'package:cricupdate/controller/auth_controller.dart';
import 'package:cricupdate/controller/subscription_controller.dart';
import 'package:cricupdate/util/dimensions.dart';
import 'package:cricupdate/view/screen/subscription/widget/subscription_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../util/images.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<SubscriptionController>().getSubscriptionList();
      if (Get.find<AuthController>().userModel != null) {
        Get.find<SubscriptionController>().getMySubscription(
            userId: Get.find<AuthController>().userModel!.id!);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Get.theme.primaryColor,
        title: Image.asset(
          Images.logo4,
          height: 150,
        ),
      ),
      body: GetBuilder<SubscriptionController>(
        builder: (subscriptionController) {
          return ListView(
            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            children: [
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  "Become Pro And Enjoy",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              const Center(
                child: Text(
                  "All Premium resources,",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              const Center(
                child: Text("Smooth Ad-Free Experience",
                    style: TextStyle(color: Colors.black, fontSize: 16)),
              ),
              const SizedBox(
                height: 40,
              ),
              subscriptionController.activeSubscriptionModel != null
                  ? Container(
                      padding:
                          const EdgeInsets.all(Dimensions.paddingSizeDefault),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(color: Colors.grey[300]!, blurRadius: 3)
                          ],
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          Container(
                            width: Get.width,
                            padding: const EdgeInsets.all(
                                Dimensions.paddingSizeDefault),
                            decoration: BoxDecoration(
                                color: Get.theme.primaryColor,
                                borderRadius: BorderRadius.circular(16)),
                            child: const Center(
                              child: Text(
                                "Active Plan",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            "Plan Name : ${subscriptionController.activeSubscriptionModel!.subscriptionPlan!.name!}",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Price : "
                            "Rs.${subscriptionController.activeSubscriptionModel!.subscriptionPlan!.price!}",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Duration :  ${subscriptionController.activeSubscriptionModel!.subscriptionPlan!.duration!} Days",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Purchased Date :  ${DateFormat.yMd().add_jm().format(subscriptionController.activeSubscriptionModel!.subscription!.startDate!)}",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Expiry Date :  ${DateFormat.yMd().add_jm().format(subscriptionController.activeSubscriptionModel!.subscription!.expiryDate!)}",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.all(16),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: .7,
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                      ),
                      itemCount: subscriptionController.subscriptionList.length,
                      itemBuilder: (context, index) {
                        return SubscriptionCard(
                            subscriptionModel:
                                subscriptionController.subscriptionList[index]);
                      },
                    ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/dimensions.dart';

class ProfileDataField extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData? icon;

  const ProfileDataField(
      {Key? key, required this.title, required this.subTitle, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
        const SizedBox(height: Dimensions.paddingSizeSmall),
        Container(
          width: Get.width,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              icon != null
                  ? Icon(
                      icon,
                      color: Colors.black,
                    )
                  : const SizedBox(),
              SizedBox(
                width: icon != null ? Dimensions.paddingSizeDefault : 0,
              ),
              Text(
                subTitle,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.fontSizeDefault),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

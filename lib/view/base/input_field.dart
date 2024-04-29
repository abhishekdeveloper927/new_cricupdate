import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/dimensions.dart';

class InputField extends StatelessWidget {
  final String title;
  final String subTitle;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final double? radius;
  final double? marginRight;
  final double? marginBottom;
  final double? width;
  final TextInputType? keyboardType;

  const InputField(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.controller,
      this.focusNode,
      this.nextFocus,
      this.keyboardType,
      this.radius,
      this.marginRight,
      this.marginBottom,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.fontSizeDefault),
        ),
        const SizedBox(
          height: Dimensions.radiusDefault,
        ),
        Container(
          margin: EdgeInsets.only(
              right: marginRight ?? 0, bottom: marginBottom ?? 0),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          width: width ?? Get.width,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(radius ?? 16)),
          child: TextFormField(
            controller: controller,
            onFieldSubmitted: (_) {},
            style: const TextStyle(fontSize: 14, color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: subTitle,
                hintStyle: const TextStyle(fontSize: 14, color: Colors.grey)),
          ),
        ),
      ],
    );
  }
}

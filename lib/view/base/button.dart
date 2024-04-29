import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/dimensions.dart';

class Button extends StatelessWidget {
  final String title;
  final Function onTap;
  final IconData? icon;
  final Color? bgColor;
  final Color? iconColor;
  final Color? textColor;
  final Color? borderColor;
  final double? width;
  final double? radius;
  final double? padding;
  final double? iconSize;
  final double? fontSize;

  const Button(
      {super.key,
      required this.title,
      required this.onTap,
      this.width,
      this.radius,
      this.padding,
      this.fontSize,
      this.bgColor,
      this.textColor,
      this.borderColor,
      this.icon,
      this.iconColor,
      this.iconSize});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: width ?? Get.width,
        padding: EdgeInsets.all(padding ?? Dimensions.paddingSizeDefault),
        decoration: BoxDecoration(
            border: Border.all(color: borderColor ?? Colors.transparent),
            color: bgColor ?? Get.theme.primaryColor,
            borderRadius:
                BorderRadius.circular(radius ?? Dimensions.paddingSizeDefault)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null
                ? Icon(
                    icon,
                    color: iconColor ?? Colors.white,
                    size: iconSize ?? 18,
                  )
                : const SizedBox(),
            SizedBox(
              width: icon != null ? Dimensions.paddingSizeDefault : 0,
            ),
            Text(
              title,
              style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize ?? Dimensions.fontSizeDefault),
            ),
          ],
        ),
      ),
    );
  }
}

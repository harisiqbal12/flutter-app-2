import "package:flutter/material.dart";
import 'package:flutter_application_2/misc/colors.dart';
import 'package:flutter_application_2/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  final bool? isResponsive;
  final double? width;

  const ResponsiveButton({super.key, this.isResponsive = false, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isResponsive == true ? double.maxFinite : width,
      height: 60,
      padding: isResponsive!
          ? const EdgeInsets.symmetric(horizontal: 20)
          : const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor,
      ),
      child: Row(
        mainAxisAlignment: isResponsive!
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          if (isResponsive!)
            AppText(
              text: "Book Tip Now",
              color: Colors.white,
              size: 14,
            ),
          Image.asset(
            'assets/images/button-one.png',
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

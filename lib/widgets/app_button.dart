import "package:flutter/material.dart";
import 'package:flutter_application_2/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  final double size;
  final String? text;
  final IconData? icon;
  final bool? isIcon;

  const AppButtons({
    super.key,
    required this.color,
    required this.backgroundColor,
    required this.size,
    required this.borderColor,
    this.text = "hi",
    this.icon,
    this.isIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
      child: isIcon == true
          ? Icon(icon, color: color)
          : Center(
              child: AppText(
                text: text!,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}
